//
//  479.largestPalindrome.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/16.
//

import Foundation

/*
 479. 最大回文数乘积
 难度
 困难

 107

 给定一个整数 n ，返回 可表示为两个 n 位整数乘积的 最大回文整数 。因为答案可能非常大，所以返回它对 1337 取余 。

 示例 1:

 输入：n = 2
 输出：987
 解释：99 x 91 = 9009, 9009 % 1337 = 987
 示例 2:

 输入： n = 1
 输出： 9

 提示:

 1 <= n <= 8
 */

func largestPalindrome(_ n: Int) -> Int {
    if n == 1 {
        return 9
    }

    let upper = Int(exactly: powf(10, Float(n)))! - 1
    var left = upper
    while left > 0 {
        var p = left
        var x = left
        while x > 0 {
            p = p * 10 + x % 10
            x /= 10
        }
        x = upper
        while p <= x * x {
            if p % x == 0 {
                return p % 1337
            }
            x -= 1
        }
        left -= 1
    }

    return 0
}
