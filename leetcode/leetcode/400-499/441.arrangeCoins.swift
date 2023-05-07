//
//  441.arrangeCoins.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/10.
//

import Foundation

/*
 441. 排列硬币
 难度
 简单

 148

 你总共有 n 枚硬币，并计划将它们按阶梯状排列。对于一个由 k 行组成的阶梯，其第 i 行必须正好有 i 枚硬币。阶梯的最后一行 可能 是不完整的。

 给你一个数字 n ，计算并返回可形成 完整阶梯行 的总行数。

 示例 1：

 输入：n = 5
 输出：2
 解释：因为第三行不完整，所以返回 2 。
 示例 2：

 输入：n = 8
 输出：3
 解释：因为第四行不完整，所以返回 3 。

 提示：

 1 <= n <= 2^31 - 1
 */

func arrangeCoins(_ n: Int) -> Int {
//    var i = 1
//    var n = n
//    var ans = 0
//    while i <= n {
//        n -= i
//        i += 1
//        ans += 1
//    }
//    return ans
//    return Int((sqrt(Float(8*n+1)) - 1) / 2)
    var left = 0
    var right = Int(sqrt(Double(2 * n)))
    while left <= right {
        let mid = (left + right) >> 1
        let num = mid * (mid + 1)
        if num == 2 * n {
            return mid
        } else if num < 2 * n {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return right
}
