//
//  65.add.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/31.
//

import Foundation

/*
 剑指 Offer 65. 不用加减乘除做加法
 写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。

 示例:

 输入: a = 1, b = 1
 输出: 2

 提示：

 a, b 均可能是负数或 0
 结果不会溢出 32 位整数
 */

func add(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    while b != 0 {
        let carry = (a & b) << 1
        a ^= b
        b = carry
    }
    return a
}
