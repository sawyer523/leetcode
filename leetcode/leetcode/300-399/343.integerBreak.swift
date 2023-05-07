//
//  343.integerBreak.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/3.
//

import Foundation

/*
 343. 整数拆分
 给定一个正整数 n ，将其拆分为 k 个 正整数 的和（ k >= 2 ），并使这些整数的乘积最大化。

 返回 你可以获得的最大乘积 。

 示例 1:

 输入: n = 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1。
 示例 2:

 输入: n = 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。

 提示:

 2 <= n <= 58
 */

func integerBreak(_ n: Int) -> Int {
    if n <= 3 {
        return n - 1
    }
    var dp = [Int](repeating: 0, count: n + 1)
    dp[2] = 1
    for i in 3 ... n {
        dp[i] = max(2 * (i - 2), 2 * dp[i - 2], 3 * (i - 3), 3 * dp[i - 3])
    }
    return dp[n]
}
