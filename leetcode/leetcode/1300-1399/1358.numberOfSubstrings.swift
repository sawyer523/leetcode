//
//  1358.numberOfSubstrings.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/15.
//

import Foundation

/*
 1358. 包含所有三种字符的子字符串数目
 难度
 中等

 46

 给你一个字符串 s ，它只包含三种字符 a, b 和 c 。

 请你返回 a，b 和 c 都 至少 出现过一次的子字符串数目。

 示例 1：

 输入：s = "abcabc"
 输出：10
 解释：包含 a，b 和 c 各至少一次的子字符串为 "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" 和 "abc" (相同字符串算多次)。
 示例 2：

 输入：s = "aaacb"
 输出：3
 解释：包含 a，b 和 c 各至少一次的子字符串为 "aaacb", "aacb" 和 "acb" 。
 示例 3：

 输入：s = "abc"
 输出：1

 提示：

 3 <= s.length <= 5 x 10^4
 s 只包含字符 a，b 和 c 。

 */

func numberOfSubstrings(_ s: String) -> Int {
    let n = s.count
    let A = Character("a")
    let B = Character("b")
    let C = Character("c")
    var counta = 0
    var countb = 0
    var countc = 0
    var res = 0
    var left = 0
    for right in 0 ..< n {
        counta += s[right] == A ? 1 : 0
        countb += s[right] == B ? 1 : 0
        countc += s[right] == C ? 1 : 0

        while counta >= 1 &&
            countb >= 1 &&
            countc >= 1 {
            res += n - right
            counta -= s[left] == A ? 1 : 0
            countb -= s[left] == B ? 1 : 0
            countc -= s[left] == C ? 1 : 0
            left += 1
        }
    }
    return res
}
