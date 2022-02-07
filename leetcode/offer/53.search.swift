//
//  53.search.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/16.
//

import Foundation

/*
 剑指 Offer 53 - I. 在排序数组中查找数字 I
 难度
 简单
 
 162
 
 
 
 
 
 统计一个数字在排序数组中出现的次数。
 
 
 
 示例 1:
 
 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:
 
 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
 
 
 限制：
 
 0 <= 数组长度 <= 50000
 
 
 
 注意：本题与主站 34 题相同（仅返回值不同）：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    
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
    
    let  left = binarySearch(nums, target)
    if left == nums.count || nums[left] != target {
        return 0
    }
    let right = binarySearch(nums, target + 1) - 1
    return right - left + 1
}
