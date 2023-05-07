//
//  48.lengthOfLongestSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/20.
//

import Foundation

/*
 剑指 Offer 48. 最长不含重复字符的子字符串
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 提示：

 s.length <= 40000
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var m: [Character: Int] = [:]
    let n = s.count
    let s = Array(s)
    var rk = -1
    var ans = 0
    for i in 0 ..< n {
        if i != 0 {
            m.removeValue(forKey: s[i - 1])
        }

        while rk + 1 < n,
              m[s[rk + 1], default: 0] == 0 {
            m[s[rk + 1], default: 0] += 1
            rk += 1
        }

        ans = max(ans, rk - i + 1)
    }

    return ans
}
