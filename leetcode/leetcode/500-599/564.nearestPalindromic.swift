//
//  564.nearestPalindromic.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/2.
//

import Foundation

/*
 564. 寻找最近的回文数
 难度
 困难

 129

 给定一个表示整数的字符串 n ，返回与它最近的回文整数（不包括自身）。如果不止一个，返回较小的那个。

 “最近的”定义为两个整数差的绝对值最小。

 示例 1:

 输入: n = "123"
 输出: "121"
 示例 2:

 输入: n = "1"
 输出: "0"
 解释: 0 和 2是最近的回文，但我们返回最小的，也就是 0。

 提示:

 1 <= n.length <= 18
 n 只由数字组成
 n 不含前导 0
 n 代表在 [1, 10^18 - 1] 范围内的整数
 */

func nearestPalindromic(_ n: String) -> String {
    let m = n.count
    var candidates = [Int(pow(10.0, Double(m - 1))) - 1, Int(pow(10.0, Double(m))) + 1]
    let selfPrefix = Int(n.prefix((m + 1) / 2))!
    for x in [selfPrefix - 1, selfPrefix, selfPrefix + 1] {
        var x = x
        var y = x
        if m & 1 == 1 {
            y /= 10
        }

        while y > 0 {
            x = x * 10 + y % 10
            y /= 10
        }
        candidates.append(x)
    }

    var ans = -1
    let selfNumber = Int(n)!
    for candidate in candidates {
        if candidate != selfNumber {
            if ans == -1 ||
                abs(candidate - selfNumber) < abs(ans - selfNumber) ||
                abs(candidate - selfNumber) == abs(ans - selfNumber) && candidate < ans {
                ans = candidate
            }
        }
    }

    return String(ans)
}
