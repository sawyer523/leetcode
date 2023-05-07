//
//  43.countDigitOne.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/10.
//

import Foundation

/*
 剑指 Offer 43. 1～n 整数中 1 出现的次数
 输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。

 例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。

 示例 1：

 输入：n = 12
 输出：5
 示例 2：

 输入：n = 13
 输出：6

 限制：

 1 <= n < 2^31
 */

func countDigitOne2(_ n: Int) -> Int {
    var ans = 0
    var i = 1
    while i <= n {
        ans += (n / (i * 10)) * i + min(max(n % (i * 10) - i + 1, 0), i)
        i *= 10
    }
    return ans
}
