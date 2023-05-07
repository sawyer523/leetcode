//
//  829.consecutiveNumbersSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/3.
//

import Foundation

/*
 829. 连续整数求和
 难度
 困难

 166

 给定一个正整数 n，返回 连续正整数满足所有数字之和为 n 的组数 。

 示例 1:

 输入: n = 5
 输出: 2
 解释: 5 = 2 + 3，共有两组连续整数([5],[2,3])求和后为 5。
 示例 2:

 输入: n = 9
 输出: 3
 解释: 9 = 4 + 5 = 2 + 3 + 4
 示例 3:

 输入: n = 15
 输出: 4
 解释: 15 = 8 + 7 = 4 + 5 + 6 = 1 + 2 + 3 + 4 + 5

 提示:

 1 <= n <= 10^9
 */

func consecutiveNumbersSum(_ n: Int) -> Int {
    func isKConsecurive(_ k: Int) -> Bool {
        if k & 1 == 1 {
            return n % k == 0
        }
        return n % k != 0 &&
            2 * n % k == 0
    }

    var ans = 0
    var k = 1
    while k * (k + 1) <= 2 * n {
        if isKConsecurive(k) {
            ans += 1
        }
        k += 1
    }
    return ans
}
