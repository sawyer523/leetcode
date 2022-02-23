//
//  540.singleNonDuplicate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/14.
//

import Foundation

/*
 540. 有序数组中的单一元素
 难度
 中等
 
 351
 
 
 
 
 
 给你一个仅由整数组成的有序数组，其中每个元素都会出现两次，唯有一个数只会出现一次。
 
 请你找出并返回只出现一次的那个数。
 
 你设计的解决方案必须满足 O(log n) 时间复杂度和 O(1) 空间复杂度。
 
 
 
 示例 1:
 
 输入: nums = [1,1,2,3,3,4,4,8,8]
 输出: 2
 示例 2:
 
 输入: nums =  [3,3,7,7,10,11,11]
 输出: 10
 
 
 提示:
 
 1 <= nums.length <= 10^5
 0 <= nums[i] <= 10^5
 */

func singleNonDuplicate(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low < high {
        let mid = low + (high - low) / 2
        if nums[mid] == nums[mid^1] {
            low = mid + 1
        } else {
            high = mid
        }
    }
    
    return nums[low]
}

