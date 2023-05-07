//
//  2104.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/4.
//

import Foundation

/*
 2104. 子数组范围和
 难度
 中等

 42

 给你一个整数数组 nums 。nums 中，子数组的 范围 是子数组中最大元素和最小元素的差值。

 返回 nums 中 所有 子数组范围的 和 。

 子数组是数组中一个连续 非空 的元素序列。

 示例 1：

 输入：nums = [1,2,3]
 输出：4
 解释：nums 的 6 个子数组如下所示：
 [1]，范围 = 最大 - 最小 = 1 - 1 = 0
 [2]，范围 = 2 - 2 = 0
 [3]，范围 = 3 - 3 = 0
 [1,2]，范围 = 2 - 1 = 1
 [2,3]，范围 = 3 - 2 = 1
 [1,2,3]，范围 = 3 - 1 = 2
 所有范围的和是 0 + 0 + 0 + 1 + 1 + 2 = 4
 示例 2：

 输入：nums = [1,3,3]
 输出：4
 解释：nums 的 6 个子数组如下所示：
 [1]，范围 = 最大 - 最小 = 1 - 1 = 0
 [3]，范围 = 3 - 3 = 0
 [3]，范围 = 3 - 3 = 0
 [1,3]，范围 = 3 - 1 = 2
 [3,3]，范围 = 3 - 3 = 0
 [1,3,3]，范围 = 3 - 1 = 2
 所有范围的和是 0 + 0 + 0 + 2 + 0 + 2 = 4
 示例 3：

 输入：nums = [4,-2,-3,4,1]
 输出：59
 解释：nums 中所有子数组范围的和是 59

 提示：

 1 <= nums.length <= 1000
 -10^9 <= nums[i] <= 10^9
 */

func subArrayRanges(_ nums: [Int]) -> Int {
    let n = nums.count
    var minLeft = [Int](repeating: 0, count: n)
    var maxLeft = [Int](repeating: 0, count: n)
    var minStk: [Int] = []
    var maxStk: [Int] = []

    for i in 0 ..< n {
        while !minStk.isEmpty && nums[i] < nums[minStk.last!] {
            _ = minStk.popLast()
        }

        if !minStk.isEmpty {
            minLeft[i] = minStk.last!
        } else {
            minLeft[i] = -1
        }
        minStk.append(i)

        while !maxStk.isEmpty && nums[maxStk.last!] <= nums[i] {
            _ = maxStk.popLast()
        }
        if !maxStk.isEmpty {
            maxLeft[i] = maxStk.last!
        } else {
            maxLeft[i] = -1
        }
        maxStk.append(i)
    }

    var minRight = [Int](repeating: 0, count: n)
    var maxRight = [Int](repeating: 0, count: n)
    minStk.removeAll()
    maxStk.removeAll()
    for i in stride(from: n - 1, through: 0, by: -1) {
        while !minStk.isEmpty && nums[i] <= nums[minStk.last!] {
            _ = minStk.popLast()
        }
        if !minStk.isEmpty {
            minRight[i] = minStk.last!
        } else {
            minRight[i] = n
        }
        minStk.append(i)

        while !maxStk.isEmpty && nums[maxStk.last!] < nums[i] {
            _ = maxStk.popLast()
        }
        if !maxStk.isEmpty {
            maxRight[i] = maxStk.last!
        } else {
            maxRight[i] = n
        }
        maxStk.append(i)
    }

    var sumMax = 0
    var sumMin = 0
    for i in 0 ..< n {
        sumMax += (maxRight[i] - i) * (i - maxLeft[i]) * nums[i]
        sumMin += (minRight[i] - i) * (i - minLeft[i]) * nums[i]
    }

    return sumMax - sumMin
}
