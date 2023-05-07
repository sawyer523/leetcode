//
//  421.findMaximumXOR.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/16.
//

import Foundation

/*
 421. 数组中两个数的最大异或值
 难度
 中等

 283

 给你一个整数数组 nums ，返回 nums[i] XOR nums[j] 的最大运算结果，其中 0 ≤ i ≤ j < n 。

 进阶：你可以在 O(n) 的时间解决这个问题吗？

 示例 1：

 输入：nums = [3,10,5,25,2,8]
 输出：28
 解释：最大运算结果是 5 XOR 25 = 28.
 示例 2：

 输入：nums = [0]
 输出：0
 示例 3：

 输入：nums = [2,4]
 输出：6
 示例 4：

 输入：nums = [8,10,2]
 输出：10
 示例 5：

 输入：nums = [14,70,53,83,49,91,36,80,92,51,66,70]
 输出：127

 提示：

 1 <= nums.length <= 2 * 104
 0 <= nums[i] <= 231 - 1
 */

func findMaximumXOR(_ nums: [Int]) -> Int {
    var max = 0, mask = 0

    for i in stride(from: 31, through: 0, by: -1) {
        mask |= 1 << i

        var prefixes = Set<Int>()
        for num in nums {
            prefixes.insert(num & mask)
        }

        let idealMax = max | 1 << i
        for prefix in prefixes {
            if prefixes.contains(idealMax ^ prefix) {
                max = idealMax
                break
            }
        }
    }

    return max
}
