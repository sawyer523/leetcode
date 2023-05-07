//
//  3.lengthOfLongestSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/20.
//

import Foundation

/*
 3. 无重复字符的最长子串
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 提示：

 0 <= s.length <= 5 * 10^4
 s 由英文字母、数字、符号和空格组成

 */

func lengthOfLongestSubstring2(_ s: String) -> Int {
    let s = Array(s)
    let n = s.count
    var rk = -1
    var ans = 0
    var m: [Character: Int] = [:]
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
