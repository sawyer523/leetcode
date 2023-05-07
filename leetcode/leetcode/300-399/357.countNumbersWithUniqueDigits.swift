//
//  357.countNumbersWithUniqueDigits.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/11.
//

import Foundation

/*
 357. 统计各位数字都不同的数字个数
 难度
 中等

 179

 给你一个整数 n ，统计并返回各位数字都不同的数字 x 的个数，其中 0 <= x < 10n 。

 示例 1：

 输入：n = 2
 输出：91
 解释：答案应为除去 11、22、33、44、55、66、77、88、99 外，在 0 ≤ x < 100 范围内的所有数字。
 示例 2：

 输入：n = 0
 输出：1

 提示：

 0 <= n <= 8
 */

func countNumbersWithUniqueDigits(_ n: Int) -> Int {
    var ans = 10
    switch n {
    case 0:
        return 1
    case 1:
        return ans
    default:
        var cur = 9
        for i in 0 ..< n - 1 {
            cur *= 9 - i
            ans += cur
        }
    }
    return ans
}
