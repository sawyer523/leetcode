//
//  1668.maxRepeating.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/11/3.
//

import Foundation

/*
 1668. 最大重复子字符串
 难度
 简单

 43

 给你一个字符串 sequence ，如果字符串 word 连续重复 k 次形成的字符串是 sequence 的一个子字符串，那么单词 word 的 重复值为 k 。单词 word 的 最大重复值 是单词 word 在 sequence 中最大的重复值。如果 word 不是 sequence 的子串，那么重复值 k 为 0 。

 给你一个字符串 sequence 和 word ，请你返回 最大重复值 k 。

 示例 1：

 输入：sequence = "ababc", word = "ab"
 输出：2
 解释："abab" 是 "ababc" 的子字符串。
 示例 2：

 输入：sequence = "ababc", word = "ba"
 输出：1
 解释："ba" 是 "ababc" 的子字符串，但 "baba" 不是 "ababc" 的子字符串。
 示例 3：

 输入：sequence = "ababc", word = "ac"
 输出：0
 解释："ac" 不是 "ababc" 的子字符串。

 提示：

 1 <= sequence.length <= 100
 1 <= word.length <= 100
 sequence 和 word 都只包含小写英文字母。
 */

func maxRepeating(_ sequence: String, _ word: String) -> Int {
    let n = sequence.count
    let m = word.count

    if n < m {
        return 0
    }

    let word = Array(word)
    var fail = [Int](repeating: -1, count: m)
    for i in 1 ..< m {
        var j = fail[i - 1]
        while j != -1 && word[j + 1] != word[i] {
            j = fail[j]
        }
        if word[j + 1] == word[i] {
            fail[i] = j + 1
        }
    }

    var f = [Int](repeating: 0, count: n)
    var j = -1
    let sequence = Array(sequence)
    var ans = 0
    for i in 0 ..< n {
        while j != -1 && word[j + 1] != sequence[i] {
            j = fail[j]
        }
        if word[j + 1] == sequence[i] {
            j += 1
            if j == m - 1 {
                if i < m {
                    f[i] = 1
                } else {
                    f[i] = f[i - m] + 1
                }
                ans = max(f[i], ans)
                j = fail[j]
            }
        }
    }

    return ans
}
