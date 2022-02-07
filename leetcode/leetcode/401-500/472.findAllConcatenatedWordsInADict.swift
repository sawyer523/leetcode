//
//  472.findAllConcatenatedWordsInADict.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/28.
//

import Foundation

/*
 472. 连接词
 难度
 困难
 
 141
 
 
 
 
 
 给你一个 不含重复 单词的字符串数组 words ，请你找出并返回 words 中的所有 连接词 。
 
 连接词 定义为：一个完全由给定数组中的至少两个较短单词组成的字符串。
 
 
 
 示例 1：
 
 输入：words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
 输出：["catsdogcats","dogcatsdog","ratcatdogcat"]
 解释："catsdogcats" 由 "cats", "dog" 和 "cats" 组成;
 "dogcatsdog" 由 "dog", "cats" 和 "dog" 组成;
 "ratcatdogcat" 由 "rat", "cat", "dog" 和 "cat" 组成。
 示例 2：
 
 输入：words = ["cat","dog","catdog"]
 输出：["catdog"]
 
 
 提示：
 
 1 <= words.length <= 10^4
 0 <= words[i].length <= 1000
 words[i] 仅由小写字母组成
 0 <= sum(words[i].length) <= 10^5

 */

func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
    class TrieNode {
        var children = [TrieNode?](repeating: nil, count: 26)
        var isEnd = false
    }
    
    class Trie {
        let asciiA = Character("a").asciiValue!
        private var root: TrieNode?
        init() {
            self.root = TrieNode()
        }
        
        func insert(_ word: String) {
            var node = root
            for w in word {
                let ch = Int(w.asciiValue! - asciiA)
                if node?.children[ch] == nil {
                    node?.children[ch] = TrieNode()
                }
                node = node?.children[ch]
            }
            node?.isEnd = true
        }
        
        func dfs(_ vis: [Bool], _ word: String) -> Bool {
            if word.isEmpty {
                return true
            }
            
            if vis[word.count - 1] {
                return false
            }
            
            var node = root
            for i in word.indices {
                node = node?.children[Int(word[i].asciiValue! - asciiA)]
                if node == nil {
                    return false
                }
                
                if node!.isEnd && dfs(vis, String(word[word.index(after: i)...])) {
                    return true
                }
            }
            
            return false
        }
    }
    
    let words = words.sorted {$0.count < $1.count}
    
    let root = Trie()
    var ans: [String] = []
    for word in words {
        if word == "" {
            continue
        }
        
        let vis = [Bool](repeating: false, count: word.count)
        if root.dfs(vis, word) {
            ans.append(word)
        } else {
            root.insert(word)
        }
    }
    
    return ans
}
