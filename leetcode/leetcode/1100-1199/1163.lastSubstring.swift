//
//  1163.lastSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/24.
//

import Foundation

/*
 1163. 按字典序排在最后的子串
 给你一个字符串 s ，找出它的所有子串并按字典序排列，返回排在最后的那个子串。

 示例 1：

 输入：s = "abab"
 输出："bab"
 解释：我们可以找出 7 个子串 ["a", "ab", "aba", "abab", "b", "ba", "bab"]。按字典序排在最后的子串是 "bab"。
 示例 2：

 输入：s = "leetcode"
 输出："tcode"

 提示：

 1 <= s.length <= 4 * 10^5
 s 仅含有小写英文字符。
 */

func lastSubstring(_ s: String) -> String {
    let s = Array(s)
    var i = 0
    var j = 1
    let n = s.count
    while j < n {
        var k = 0
        while j + k < n, s[i + k] == s[j + k] {
            k += 1
        }

        if j + k < n, s[i + k] < s[j + k] {
            (i, j) = (j, max(j + 1, i + k + 1))
        } else {
            j = j + k + 1
        }
    }
    return String(s[i...])
}
