//
//  7.reverse.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 7. 整数反转
 难度
 简单

 2434

 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 */
func reverse(_ x: Int) -> Int {
    if x > -10 && x < 10 {
        return x
    }
    let signBit = x < 0 ? -1 : 1
    var num = x * signBit
    var ans = 0
    while num > 0 {
        ans = ans * 10 + num % 10
        num /= 10
    }
    ans = ans * signBit
    return Int32.min <= ans && ans <= Int32.max ? ans : 0
}
