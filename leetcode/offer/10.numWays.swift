//
//  10.numWays.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/18.
//

import Foundation

/*
 剑指 Offer 10- II. 青蛙跳台阶问题
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

 示例 1：

 输入：n = 2
 输出：2
 示例 2：

 输入：n = 7
 输出：21
 示例 3：

 输入：n = 0
 输出：1
 提示：

 0 <= n <= 100
 */

func numWays(_ n: Int) -> Int {
    let sqrt5 = sqrt(5)
    let pow1 = pow((1.0 + sqrt5) / 2.0, Double(n) + 1)
    let pow2 = pow((1.0 - sqrt5) / 2.0, Double(n) + 1)
    return Int(round((pow1 - pow2) / sqrt5))
}
