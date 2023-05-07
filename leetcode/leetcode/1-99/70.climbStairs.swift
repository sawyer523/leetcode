//
//  70.climbStairs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/18.
//

import Foundation

/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 示例 1：

 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 示例 2：

 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶

 提示：

 1 <= n <= 45

 */

func climbStairs(_ n: Int) -> Int {
    let sqrt5 = sqrt(5)
    let pow1 = pow((1.0 + sqrt5) / 2.0, Double(n) + 1)
    let pow2 = pow((1.0 - sqrt5) / 2.0, Double(n) + 1)
    return Int(round((pow1 - pow2) / sqrt5))
}
