//
//  09.getKthMagicNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/28.
//

import Foundation

/*
 面试题 17.09. 第 k 个数
 难度
 中等

 117

 有些数的素因子只有 3，5，7，请设计一个算法找出第 k 个数。注意，不是必须有这些素因子，而是必须不包含其他的素因子。例如，前几个数按顺序应该是 1，3，5，7，9，15，21。

 示例 1:

 输入: k = 5

 输出: 9
 */

func getKthMagicNumber(_ k: Int) -> Int {
    if k < 2 {
        return k
    }
    var dp = [Int](repeating: 0, count: k + 1)
    dp[1] = 1
    var p3 = 1
    var p5 = 1
    var p7 = 1
    for i in 2 ... k {
        let num3 = dp[p3] * 3
        let num5 = dp[p5] * 5
        let num7 = dp[p7] * 7
        dp[i] = min(num3, num5, num7)
        if dp[i] == num3 {
            p3 += 1
        }
        if dp[i] == num5 {
            p5 += 1
        }
        if dp[i] == num7 {
            p7 += 1
        }
    }
    return dp[k]
}
