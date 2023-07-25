//
//  60.dicesProbability.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/8.
//

import Foundation

/*
 剑指 Offer 60. n个骰子的点数
 把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s的所有可能的值出现的概率。

 你需要用一个浮点数数组返回答案，其中第 i 个元素代表这 n 个骰子所能掷出的点数集合中第 i 小的那个的概率。

 示例 1:

 输入: 1
 输出: [0.16667,0.16667,0.16667,0.16667,0.16667,0.16667]
 示例 2:

 输入: 2
 输出: [0.02778,0.05556,0.08333,0.11111,0.13889,0.16667,0.13889,0.11111,0.08333,0.05556,0.02778]

 限制：

 1 <= n <= 11
 */

func dicesProbability(_ n: Int) -> [Double] {
    var dp = [Double](repeating: 1.0 / 6.0, count: 6)
    if 1 < n {
        for i in 2 ... n {
            var tmp = [Double](repeating: 0, count: 5 * i + 1)
            for j in 0 ..< dp.count {
                for k in 0 ..< 6 {
                    tmp[j + k] += dp[j] / 6.0
                }
            }
            dp = tmp
        }
    }

    return dp
}