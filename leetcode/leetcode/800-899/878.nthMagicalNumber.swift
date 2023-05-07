//
//  878.nthMagicalNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/11/22.
//

import Foundation

/*
 878. 第 N 个神奇数字
 难度
 困难

 118

 一个正整数如果能被 a 或 b 整除，那么它是神奇的。

 给定三个整数 n , a , b ，返回第 n 个神奇的数字。因为答案可能很大，所以返回答案 对 109 + 7 取模 后的值。

 示例 1：

 输入：n = 1, a = 2, b = 3
 输出：2
 示例 2：

 输入：n = 4, a = 2, b = 3
 输出：6

 提示：

 1 <= n <= 10^9
 2 <= a, b <= 4 * 10^4
 */

func nthMagicalNumber(_ n: Int, _ a: Int, _ b: Int) -> Int {
    let mod = Int(1e9 + 7)
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b != 0 {
            return gcd(b, a % b)
        }
        return a
    }

    let c = a / gcd(a, b) * b
    let m = c / a + c / b - 1
    let r = n % m
    let res = c * (n / m) % mod
    if r == 0 {
        return res
    }

    var addA = a
    var addB = b
    for _ in 0 ..< r - 1 {
        if addA < addB {
            addA += a
        } else {
            addB += b
        }
    }
    return (res + min(addA, addB) % mod) % mod
}
