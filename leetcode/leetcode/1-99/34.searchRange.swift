//
//  34.searchRange.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/16.
//

import Foundation

/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 难度
 中等

 1107

 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：

 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？

 示例 1：

 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 示例 2：

 输入：nums = [5,7,7,8,8,10], target = 6
 输出：[-1,-1]
 示例 3：

 输入：nums = [], target = 0
 输出：[-1,-1]

 提示：

 0 <= nums.length <= 10^5
 -10^9 <= nums[i] <= 10^9
 nums 是一个非递减数组
 -10^9 <= target <= 10^9
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }

    let left = binarySearch(nums, target)
    if left == nums.count || nums[left] != target {
        return [-1, -1]
    }
    let right = binarySearch(nums, target + 1) - 1

    return [left, right]
}
