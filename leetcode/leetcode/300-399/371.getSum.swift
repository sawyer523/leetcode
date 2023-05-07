//
//  371.getSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/9/26.
//

import Foundation

/*
 371. 两整数之和
 难度
 中等

 458

 给你两个整数 a 和 b ，不使用 运算符 + 和 - ​​​​​​​，计算并返回两整数之和。

 示例 1：

 输入：a = 1, b = 2
 输出：3
 示例 2：

 输入：a = 2, b = 3
 输出：5

 提示：

 -1000 <= a, b <= 1000
 */

func getSum(_ a: Int, _ b: Int) -> Int {
    var x = a
    var y = b

    while y != 0 {
        let borrow = x & y
        x = x ^ y
        y = borrow << 1
    }
    return x
//    return a.advanced(by: b)
}
