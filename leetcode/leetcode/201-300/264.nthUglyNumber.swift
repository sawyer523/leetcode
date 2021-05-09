//
//  264.nthUglyNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/11.
//

import Foundation

/*
 264. 丑数 II
 难度
 中等

 629





 给你一个整数 n ，请你找出并返回第 n 个 丑数 。

 丑数 就是只包含质因数 2、3 和/或 5 的正整数。

  

 示例 1：

 输入：n = 10
 输出：12
 解释：[1, 2, 3, 4, 5, 6, 8, 9, 10, 12] 是由前 10 个丑数组成的序列。
 示例 2：

 输入：n = 1
 输出：1
 解释：1 通常被视为丑数。
  

 提示：

 1 <= n <= 1690

 */

func nthUglyNumber(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n+1)
    dp[1] = 1
    if n < 2 {
        return dp[n]
    }
    var p2 = 1, p3 = 1, p5 = 1
    for i in 2...n {
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
