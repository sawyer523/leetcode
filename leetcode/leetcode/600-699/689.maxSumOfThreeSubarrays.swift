//
//  689.maxSumOfThreeSubarrays.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/8.
//

import Foundation

/*
 689. 三个无重叠子数组的最大和
 难度
 困难

 171

 给你一个整数数组 nums 和一个整数 k ，找出三个长度为 k 、互不重叠、且 3 * k 项的和最大的子数组，并返回这三个子数组。

 以下标的数组形式返回结果，数组中的每一项分别指示每个子数组的起始位置（下标从 0 开始）。如果有多个结果，返回字典序最小的一个。

 示例 1：

 输入：nums = [1,2,1,2,6,7,5,1], k = 2
 输出：[0,3,5]
 解释：子数组 [1, 2], [2, 6], [7, 5] 对应的起始下标为 [0, 3, 5]。
 也可以取 [2, 1], 但是结果 [1, 3, 5] 在字典序上更大。
 示例 2：

 输入：nums = [1,2,1,2,1,2,1,2,1], k = 2
 输出：[0,2,4]

 提示：

 1 <= nums.length <= 2 * 10^4
 1 <= nums[i] < 2^16
 1 <= k <= floor(nums.length / 3)

 */

func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
    var sum1 = 0, maxSum1 = 0, maxSum1IDx = 0
    var sum2 = 0, maxSum12 = 0, maxSum12Idx1 = 0, maxSum12Idx2 = 0
    var sum3 = 0, maxTotal = 0
    var ans: [Int] = []
    for i in k * 2 ..< nums.count {
        sum1 += nums[i - k * 2]
        sum2 += nums[i - k]
        sum3 += nums[i]
        if k * 3 - 1 <= i {
            if maxSum1 < sum1 {
                maxSum1 = sum1
                maxSum1IDx = i - k * 3 + 1
            }

            if maxSum12 < maxSum1 + sum2 {
                maxSum12 = maxSum1 + sum2
                (maxSum12Idx1, maxSum12Idx2) = (maxSum1IDx, i - k * 2 + 1)
            }

            if maxTotal < maxSum12 + sum3 {
                maxTotal = maxSum12 + sum3
                ans = [maxSum12Idx1, maxSum12Idx2, i - k + 1]
            }

            sum1 -= nums[i - k * 3 + 1]
            sum2 -= nums[i - k * 2 + 1]
            sum3 -= nums[i - k + 1]
        }
    }

    return ans
}
