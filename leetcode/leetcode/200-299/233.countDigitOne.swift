//
//  233.countDigitOne.swift
//  233.countDigitOne
//
//  Created by Xiaonan Chen on 2021/8/13.
//

import Foundation

/*
 233. 数字 1 的个数
 难度
 困难

 265

 给定一个整数 n，计算所有小于等于 n 的非负整数中数字 1 出现的个数。

 示例 1：

 输入：n = 13
 输出：6
 示例 2：

 输入：n = 0
 输出：0

 提示：

 0 <= n <= 2 * 10^9
 */

func countDigitOne(_ n: Int) -> Int {
    var ans = 0
    var i = 1
    while i <= n {
        ans += (n / (i * 10)) * i + min(max(n % (i * 10) - i + 1, 0), i)
        i *= 10
    }
    return ans
}
