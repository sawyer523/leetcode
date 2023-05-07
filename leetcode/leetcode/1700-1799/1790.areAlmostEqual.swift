//
//  1790.areAlmostEqual.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/11.
//

import Foundation

/*
 1790. 仅执行一次字符串交换能否使两个字符串相等
 难度
 简单

 52

 给你长度相等的两个字符串 s1 和 s2 。一次 字符串交换 操作的步骤如下：选出某个字符串中的两个下标（不必不同），并交换这两个下标所对应的字符。

 如果对 其中一个字符串 执行 最多一次字符串交换 就可以使两个字符串相等，返回 true ；否则，返回 false 。

 示例 1：

 输入：s1 = "bank", s2 = "kanb"
 输出：true
 解释：例如，交换 s2 中的第一个和最后一个字符可以得到 "bank"
 示例 2：

 输入：s1 = "attack", s2 = "defend"
 输出：false
 解释：一次字符串交换无法使两个字符串相等
 示例 3：

 输入：s1 = "kelb", s2 = "kelb"
 输出：true
 解释：两个字符串已经相等，所以不需要进行字符串交换
 示例 4：

 输入：s1 = "abcd", s2 = "dcba"
 输出：false

 提示：

 1 <= s1.length, s2.length <= 100
 s1.length == s2.length
 s1 和 s2 仅由小写英文字母组成
 */

func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
    var i = -1
    var j = -1
    let s1 = Array(s1)
    let s2 = Array(s2)
    for idx in 0 ..< s1.count {
        if s1[idx] != s2[idx] {
            if i < 0 {
                i = idx
            } else if j < 0 {
                j = idx
            } else {
                return false
            }
        }
    }

    return i < 0 ||
        j >= 0 && s1[i] == s2[j] && s1[j] == s2[i]
}
