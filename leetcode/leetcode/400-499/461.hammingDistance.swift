//
//  461.hammingDistance.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/27.
//

import Foundation

/*
 461. 汉明距离
 难度
 简单

 458

 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

 给出两个整数 x 和 y，计算它们之间的汉明距离。

 注意：
 0 ≤ x, y < 231.

 示例:

 输入: x = 1, y = 4

 输出: 2

 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
 ↑   ↑

 上面的箭头指出了对应二进制位不同的位置。
 */

func hammingDistance(_ x: Int, _ y: Int) -> Int {
//    var sum = 0
//    var x = x
//    var y = y
//    while x != 0 || y != 0 {
//        sum += (x&1 == y&1) ? 0 : 1
//        x >>= 1
//        y >>= 1
//    }
//    var res = x^y
//    while res != 0 {
//        sum += 1
//        res &= res-1
//    }

    return (x ^ y).nonzeroBitCount
}
