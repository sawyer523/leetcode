//
//  003.countBits.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/10.
//

import Foundation

/*
 剑指 Offer II 003. 前 n 个数字二进制中 1 的个数
 给定一个非负整数 n ，请计算 0 到 n 之间的每个数字的二进制表示中 1 的个数，并输出一个数组。

 示例 1:

 输入: n = 2
 输出: [0,1,1]
 解释:
 0 --> 0
 1 --> 1
 2 --> 10
 示例 2:

 输入: n = 5
 输出: [0,1,1,2,1,2]
 解释:
 0 --> 0
 1 --> 1
 2 --> 10
 3 --> 11
 4 --> 100
 5 --> 101

 说明 :

 0 <= n <= 105
 */

func countBits2(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var count: [Int] = Array(repeating: 0, count: num + 1)
    for i in 1 ... num {
        count[i] = count[i & (i - 1)] + 1
    }
    return count
}
