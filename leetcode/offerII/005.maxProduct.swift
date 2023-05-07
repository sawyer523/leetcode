//
//  005.maxProduct.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/11.
//

import Foundation

/*
 剑指 Offer II 005. 单词长度的最大乘积
 给定一个字符串数组 words，请计算当两个字符串 words[i] 和 words[j] 不包含相同字符时，它们长度的乘积的最大值。假设字符串中只包含英语的小写字母。如果没有不包含相同字符的一对字符串，返回 0。

 示例 1:

 输入: words = ["abcw","baz","foo","bar","fxyz","abcdef"]
 输出: 16
 解释: 这两个单词为 "abcw", "fxyz"。它们不包含相同字符，且长度的乘积最大。
 示例 2:

 输入: words = ["a","ab","abc","d","cd","bcd","abcd"]
 输出: 4
 解释: 这两个单词为 "ab", "cd"。
 示例 3:

 输入: words = ["a","aa","aaa","aaaa"]
 输出: 0
 解释: 不存在这样的两个单词。

 提示：

 2 <= words.length <= 1000
 1 <= words[i].length <= 1000
 words[i] 仅包含小写字母
 */

func maxProduct2(_ words: [String]) -> Int {
    var masks: [Int: Int] = [:]
    let aAscii = Character("a").asciiValue!
    for word in words {
        var mask = 0
        for ch in word {
            mask |= 1 << (ch.asciiValue! - aAscii)
        }

        if masks[mask, default: 0] < word.count {
            masks[mask] = word.count
        }
    }

    var ans = 0

    for (x, lx) in masks {
        for (y, ly) in masks {
            if x & y == 0, ans < lx * ly {
                ans = lx * ly
            }
        }
    }

    return ans
}
