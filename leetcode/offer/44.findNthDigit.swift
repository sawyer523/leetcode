//
//  44.findNthDigit.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/10.
//

import Foundation

/*
 剑指 Offer 44. 数字序列中某一位的数字
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。

 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0

 限制：

 0 <= n < 2^31
 */

func findNthDigit2(_ n: Int) -> Int {
    var d = 1
    var count = 9
    var n = n
    while d * count < n {
        n -= d * count
        d += 1
        count *= 10
    }

    let index = n - 1
    let start = Int(pow(Double(10), Double(d - 1)))
    let num = start + index / d
    let digitIndex = index % d
    return num / Int(pow(Double(10), Double(d - digitIndex - 1))) % 10
}
