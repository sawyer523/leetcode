//
//  19.missingTwo.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/26.
//

import Foundation

/*
 面试题 17.19. 消失的两个数字
 难度
 困难

 83

 给定一个数组，包含从 1 到 N 所有的整数，但其中缺了两个数字。你能在 O(N) 时间内只用 O(1) 的空间找到它们吗？

 以任意顺序返回这两个数字均可。

 示例 1:

 输入: [1]
 输出: [2,3]
 示例 2:

 输入: [2,3]
 输出: [1,4]
 提示：

 nums.length <= 30000
 */

func missingTwo(_ nums: [Int]) -> [Int] {
    var xorSum = nums.reduce(0, ^)
    let n = nums.count + 2

    for i in 1 ... n {
        xorSum ^= i
    }

    let lsb = xorSum & -xorSum
    var type1 = 0
    var type2 = 0

    for num in nums {
        if num & lsb > 0 {
            type1 ^= num
        } else {
            type2 ^= num
        }
    }

    for i in 1 ... n {
        if i & lsb > 0 {
            type1 ^= i
        } else {
            type2 ^= i
        }
    }

    return [type1, type2]
}
