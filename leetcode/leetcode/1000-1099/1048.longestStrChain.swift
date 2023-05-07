//
//  1048.longestStrChain.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/27.
//

import Foundation

/*
 1048. 最长字符串链
 给出一个单词数组 words ，其中每个单词都由小写英文字母组成。

 如果我们可以 不改变其他字符的顺序 ，在 wordA 的任何地方添加 恰好一个 字母使其变成 wordB ，那么我们认为 wordA 是 wordB 的 前身 。

 例如，"abc" 是 "abac" 的 前身 ，而 "cba" 不是 "bcad" 的 前身
 词链是单词 [word_1, word_2, ..., word_k] 组成的序列，k >= 1，其中 word1 是 word2 的前身，word2 是 word3 的前身，依此类推。一个单词通常是 k == 1 的 单词链 。

 从给定单词列表 words 中选择单词组成词链，返回 词链的 最长可能长度 。

 示例 1：

 输入：words = ["a","b","ba","bca","bda","bdca"]
 输出：4
 解释：最长单词链之一为 ["a","ba","bda","bdca"]
 示例 2:

 输入：words = ["xbc","pcxbcf","xb","cxbc","pcxbc"]
 输出：5
 解释：所有的单词都可以放入单词链 ["xb", "xbc", "cxbc", "pcxbc", "pcxbcf"].
 示例 3:

 输入：words = ["abcd","dbqca"]
 输出：1
 解释：字链["abcd"]是最长的字链之一。
 ["abcd"，"dbqca"]不是一个有效的单词链，因为字母的顺序被改变了。

 提示：

 1 <= words.length <= 1000
 1 <= words[i].length <= 16
 words[i] 仅由小写英文字母组成。
 */

func longestStrChain(_ words: [String]) -> Int {
    var cnt: [String: Int] = [:]
    let words = words.sorted(by: { $0.count <= $1.count })
    var res = 0
    for word in words {
        cnt[word] = 1
        for i in 0 ..< word.count {
            var prev = word
            prev.remove(at: word.index(word.startIndex, offsetBy: i))
            let j = cnt[prev, default: 0] + 1
            if cnt[word, default: 0] < j {
                cnt[word] = j
            }

            if res < cnt[word]! {
                res = cnt[word]!
            }
        }
    }

    return res
}
