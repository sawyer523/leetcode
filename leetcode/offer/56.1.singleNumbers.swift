//
//  56.singleNumbersI.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/1.
//

import Foundation

/*
 剑指 Offer 56 - I. 数组中数字出现的次数
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]

 限制：

 2 <= nums.length <= 10000
 */

func singleNumbers(_ nums: [Int]) -> [Int] {
    var ret = 0
    for num in nums {
        ret ^= num
    }

    var div = 1
    while div & ret == 0 {
        div <<= 1
    }

    var a = 0
    var b = 0
    for num in nums {
        if div & num != 0 {
            a ^= num
        } else {
            b ^= num
        }
    }

    return [a, b]
}
