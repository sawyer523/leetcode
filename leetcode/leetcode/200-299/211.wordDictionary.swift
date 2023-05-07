//
//  211.wordDictionary.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/19.
//

import Foundation

/*
 211. 添加与搜索单词 - 数据结构设计
 难度
 中等

 296

 请你设计一个数据结构，支持 添加新单词 和 查找字符串是否与任何先前添加的字符串匹配 。

 实现词典类 WordDictionary ：

 WordDictionary() 初始化词典对象
 void addWord(word) 将 word 添加到数据结构中，之后可以对它进行匹配
 bool search(word) 如果数据结构中存在字符串与 word 匹配，则返回 true ；否则，返回  false 。word 中可能包含一些 '.' ，每个 . 都可以表示任何一个字母。

 示例：

 输入：
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 输出：
 [null,null,null,null,false,true,true,true]

 解释：
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True

 提示：

 1 <= word.length <= 500
 addWord 中的 word 由小写英文字母组成
 search 中的 word 由 '.' 或小写英文字母组成
 最多调用 50000 次 addWord 和 search
 */

class WordDictionary {
    private class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isEnd: Bool = false
    }

    private let root: TrieNode

    init() {
        root = TrieNode()
    }

    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isEnd = true
    }

    func search(_ word: String) -> Bool {
        return bfs(root, Array(word), 0)
    }

    private func bfs(_ node: TrieNode, _ chars: [Character], _ nextIDx: Int) -> Bool {
        if nextIDx == chars.count {
            return node.isEnd
        }

        for (nextChar, nextNode) in node.children where nextChar == chars[nextIDx] || chars[nextIDx] == "." {
            if bfs(nextNode, chars, nextIDx + 1) {
                return true
            }
        }
        return false
    }
}
