//
//  49.nthUglyNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/8.
//

import Foundation

/*
 剑指 Offer 49. 丑数
 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。

 示例:

 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:

 1 是丑数。
 n 不超过1690。
 */

func nthUglyNumber2(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    dp[1] = 1
    if n < 2 {
        return dp[n]
    }

    var p2 = 1
    var p3 = 1
    var p5 = 1
    for i in 2 ... n {
        let x2 = dp[p2] * 2
        let x3 = dp[p3] * 3
        let x5 = dp[p5] * 5
        dp[i] = min(x2, x3, x5)
        if dp[i] == x2 {
            p2 += 1
        }

        if dp[i] == x3 {
            p3 += 1
        }

        if dp[i] == x5 {
            p5 += 1
        }
    }
    return dp[n]
}
