//
//  1208.equalSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/5.
//

import Foundation

/*
 1208. 尽可能使字符串相等
 难度
 中等

 68

 给你两个长度相同的字符串，s 和 t。

 将 s 中的第 i 个字符变到 t 中的第 i 个字符需要 |s[i] - t[i]| 的开销（开销可能为 0），也就是两个字符的 ASCII 码值的差的绝对值。

 用于变更字符串的最大预算是 maxCost。在转化字符串时，总开销应当小于等于该预算，这也意味着字符串的转化可能是不完全的。

 如果你可以将 s 的子字符串转化为它在 t 中对应的子字符串，则返回可以转化的最大长度。

 如果 s 中没有子字符串可以转化成 t 中对应的子字符串，则返回 0。

 示例 1：

 输入：s = "abcd", t = "bcdf", cost = 3
 输出：3
 解释：s 中的 "abc" 可以变为 "bcd"。开销为 3，所以最大长度为 3。
 示例 2：

 输入：s = "abcd", t = "cdef", cost = 3
 输出：1
 解释：s 中的任一字符要想变成 t 中对应的字符，其开销都是 2。因此，最大长度为 1。
 示例 3：

 输入：s = "abcd", t = "acde", cost = 0
 输出：1
 解释：你无法作出任何改动，所以最大长度为 1。
 */

func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
    let n = s.count
    var diff = [Int](repeating: -1, count: n)
    let sArr = Array(s)
    let tArr = Array(t)
    for i in 0 ..< n {
        let s1 = Int(sArr[i].asciiValue!)
        let s2 = Int(tArr[i].asciiValue!)
        diff[i] = abs(s1 - s2)
    }

    var start = 0
    var sum = 0
    var ans = 0
    for (end, v) in diff.enumerated() {
        sum += v
        if maxCost < sum {
            sum -= diff[start]
            start += 1
        }
        ans = max(ans, end - start + 1)
    }

    return ans
}
