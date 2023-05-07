//
//  1414.findMinFibonacciNumbers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/3.
//

import Foundation

/*
 1414. 和为 K 的最少斐波那契数字数目
 难度
 中等

 74

 给你数字 k ，请你返回和为 k 的斐波那契数字的最少数目，其中，每个斐波那契数字都可以被使用多次。

 斐波那契数字定义为：

 F1 = 1
 F2 = 1
 Fn = Fn-1 + Fn-2 ， 其中 n > 2 。
 数据保证对于给定的 k ，一定能找到可行解。

 示例 1：

 输入：k = 7
 输出：2
 解释：斐波那契数字为：1，1，2，3，5，8，13，……
 对于 k = 7 ，我们可以得到 2 + 5 = 7 。
 示例 2：

 输入：k = 10
 输出：2
 解释：对于 k = 10 ，我们可以得到 2 + 8 = 10 。
 示例 3：

 输入：k = 19
 输出：3
 解释：对于 k = 19 ，我们可以得到 1 + 5 + 13 = 19 。

 提示：

 1 <= k <= 10^9
 */

func findMinFibonacciNumbers(_ k: Int) -> Int {
    var f = [1, 1]
    while f.last! < k {
        f.append(f[f.count - 1] + f[f.count - 2])
    }

    var k = k
    var ans = 0
    for i in stride(from: f.count - 1, to: 0, by: -1) where k > 0 {
        if f[i] <= k {
            k -= f[i]
            ans += 1
        }
    }

    return ans
}
