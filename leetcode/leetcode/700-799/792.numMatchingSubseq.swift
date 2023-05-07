//
//  792.numMatchingSubseq.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/11/17.
//

import Foundation

/*
 792. 匹配子序列的单词数
 难度
 中等

 247

 给定字符串 s 和字符串数组 words, 返回  words[i] 中是s的子序列的单词个数 。

 字符串的 子序列 是从原始字符串中生成的新字符串，可以从中删去一些字符(可以是none)，而不改变其余字符的相对顺序。

 例如， “ace” 是 “abcde” 的子序列。

 示例 1:

 输入: s = "abcde", words = ["a","bb","acd","ace"]
 输出: 3
 解释: 有三个是 s 的子序列的单词: "a", "acd", "ace"。
 Example 2:

 输入: s = "dsahjpjauf", words = ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"]
 输出: 2

 提示:

 1 <= s.length <= 5 * 10^4
 1 <= words.length <= 5000
 1 <= words[i].length <= 50
 words[i]和 s 都只由小写字母组成。
 */

func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
    var ps: [Character: [(Int, Int)]] = [:]
    for (i, word) in words.enumerated() {
        ps[word.first!, default: []].append((i, 0))
    }

    var ans = 0
    for ch in s {
        var q = ps[ch, default: []]
        ps.removeValue(forKey: ch)
        for i in 0 ..< q.count {
            q[i].1 += 1
            if q[i].1 == words[q[i].0].count {
                ans += 1
            } else {
                let word = words[q[i].0]
                let idx = word.index(word.startIndex, offsetBy: q[i].1)
                ps[word[idx], default: []].append(q[i])
            }
        }
    }
    return ans
}
