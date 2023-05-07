//
//  001.divide.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/10.
//

import Foundation

/*
 剑指 Offer II 001. 整数除法
 给定两个整数 a 和 b ，求它们的除法的商 a/b ，要求不得使用乘号 '*'、除号 '/' 以及求余符号 '%' 。

 注意：

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231, 231−1]。本题中，如果除法结果溢出，则返回 231 − 1

 示例 1：

 输入：a = 15, b = 2
 输出：7
 解释：15/2 = truncate(7.5) = 7
 示例 2：

 输入：a = 7, b = -3
 输出：-2
 解释：7/-3 = truncate(-2.33333..) = -2
 示例 3：

 输入：a = 0, b = 1
 输出：0
 示例 4：

 输入：a = 1, b = 1
 输出：1

 提示:

 -2^31 <= a, b <= 2^31 - 1
 b != 0
 */

func divide2(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int32.min {
        if divisor == 1 {
            return Int(Int32.min)
        }
        if divisor == -1 {
            return Int(Int32.max)
        }
    }
    let sign = (((dividend ^ divisor) >> 31 & 0x1) != 0) ? -1 : 1
    var result = 0
    var dividend = abs(dividend)
    let divisor = abs(divisor)
    while divisor <= dividend {
        var i = 1
        var tmp = divisor
        while tmp <= dividend {
            dividend -= tmp
            result += i
            i = i << 1
            tmp = tmp << 1
        }
    }

    result *= sign
    return result
}
