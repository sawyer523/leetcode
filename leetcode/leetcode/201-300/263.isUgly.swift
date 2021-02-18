//
//  263.isUgly.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/31.
//

import Foundation

/*
 263. 丑数
 难度
 简单

 168





 编写一个程序判断给定的数是否为丑数。

 丑数就是只包含质因数 2, 3, 5 的正整数。

 示例 1:

 输入: 6
 输出: true
 解释: 6 = 2 × 3
 示例 2:

 输入: 8
 输出: true
 解释: 8 = 2 × 2 × 2
 示例 3:

 输入: 14
 输出: false
 解释: 14 不是丑数，因为它包含了另外一个质因数 7。
 说明：

 1 是丑数。
 输入不会超过 32 位有符号整数的范围: [−2^31,  2^31 − 1]。
 通过次数49,793提交次数99,690

 */

func isUgly(_ num: Int) -> Bool {
    if num <= 0 {
        return false
    }
    var num = num
    for i in [2, 3, 5] {
        while num%i == 0 {
            num /= i
        }
    }
    
    return num == 1 ? true : false
}
