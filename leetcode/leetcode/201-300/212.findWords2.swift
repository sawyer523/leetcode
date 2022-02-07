//
//  212.findWords2.swift
//  212.findWords2
//
//  Created by Xiaonan Chen on 2021/9/16.
//

import Foundation

/*
 212. 单词搜索 II
 难度
 困难
 
 470
 
 
 
 
 
 给定一个 m x n 二维字符网格 board 和一个单词（字符串）列表 words，找出所有同时在二维网格和字典中出现的单词。
 
 单词必须按照字母顺序，通过 相邻的单元格 内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母在一个单词中不允许被重复使用。
 
 
 
 示例 1：
 
 
 输入：board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
 输出：["eat","oath"]
 示例 2：
 
 
 输入：board = [["a","b"],["c","d"]], words = ["abcb"]
 输出：[]
 
 
 提示：
 
 m == board.length
 n == board[i].length
 1 <= m, n <= 12
 board[i][j] 是一个小写英文字母
 1 <= words.length <= 3 * 10^4
 1 <= words[i].length <= 10
 words[i] 由小写英文字母组成
 words 中的所有字符串互不相同
 */


func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var result: Set<String> = []
    var m = 0
    var n = 0
    
    class TrieNode {
        var value: Character
        var children: [Character: TrieNode]
        var isWord: Bool
        init(c: Character) {
            self.value = c
            self.children = [:]
            self.isWord = false
        }
    }
    
    class Trie {
        private var root: TrieNode
        var cur: TrieNode
        init() {
            self.root = TrieNode(c: " ")
            self.cur = root
        }
        
        func insert(_ word: String) {
            if word == "" {
                return
            }
            cur = root
            for char in word {
                var temp = cur.children[char]
                if temp == nil {
                    temp = TrieNode(c: char)
                    cur.children[char] = temp
                }
                cur = temp!
            }
            cur.isWord = true
        }
        
        func search(_ word: String) -> Bool {
            if word == "" {
                return false
            }
            
            cur = root
            for char in word {
                let temp = cur.children[char]
                if temp == nil {
                    return false
                }
                cur = temp!
            }
            
            return true
        }
        
        func getFirstNode(_ char: Character) -> TrieNode? {
            return root.children[char]
        }
        
        func getRootNode() -> TrieNode {
            return root
        }
    }
    
    func dfs(board: inout [[Character]], i: Int, j: Int, curWord:  String, curNode: TrieNode?) {
        var str = curWord
        str.append(board[i][j])
        let node = curNode?.children[board[i][j]]
        
        if node!.isWord {
            result.insert(str)
        }
        
        let tmp = board[i][j]
        board[i][j] = "@"
        var x = 0
        var y = 0
        for k in 0...3 {
            x = i + dx[k]
            y = j + dy[k]
            if (0 <= x && x < m) &&
                (0 <= y && y < n) &&
                (board[x][y] != "@") &&
                (node!.children[board[x][y]] != nil) {
                dfs(board: &board, i: x, j: y, curWord: str, curNode: node)
            }
        }
        board[i][j] = tmp
    }
    
    if board.count == 0 || words.count == 0 {
        return []
    }
    
    let root = Trie()
    for word in words {
        root.insert(word)
    }
    var tBoard = board
    m = board.count
    n = board[0].count
    for i in 0 ..< m {
        for j in 0 ..< n {
            if root.getFirstNode(board[i][j]) != nil {
                dfs(board: &tBoard, i: i, j: j, curWord: "", curNode: root.getRootNode())
            }
        }
    }
    return Array(result)
}



