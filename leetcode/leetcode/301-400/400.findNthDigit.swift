//
//  400.findNthDigit.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/30.
//

import Foundation

/*
 400. 第 N 位数字
 难度
 中等
 
 206
 
 
 
 
 
 给你一个整数 n ，请你在无限的整数序列 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...] 中找出并返回第 n 位数字。
 
 
 
 示例 1：
 
 输入：n = 3
 输出：3
 示例 2：
 
 输入：n = 11
 输出：0
 解释：第 11 位数字在序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... 里是 0 ，它是 10 的一部分。
 
 
 提示：
 
 1 <= n <= 2^31 - 1

 */

func findNthDigit(_ n: Int) -> Int {
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
