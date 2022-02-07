//
//  581.findUnsortedSubarray.swift
//  581.findUnsortedSubarray
//
//  Created by Xiaonan Chen on 2021/8/3.
//

import Foundation

/*
 581. 最短无序连续子数组
 难度
 中等
 
 617
 
 
 
 
 
 给你一个整数数组 nums ，你需要找出一个 连续子数组 ，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。
 
 请你找出符合题意的 最短 子数组，并输出它的长度。
 
 
 
 示例 1：
 
 输入：nums = [2,6,4,8,10,9,15]
 输出：5
 解释：你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
 示例 2：
 
 输入：nums = [1,2,3,4]
 输出：0
 示例 3：
 
 输入：nums = [1]
 输出：0
 
 
 提示：
 
 1 <= nums.length <= 10^4
 -10^5 <= nums[i] <= 10^5
 
 
 进阶：你可以设计一个时间复杂度为 O(n) 的解决方案吗？
 */

func findUnsortedSubarray(_ nums: [Int]) -> Int {
//    let arr = nums.sorted()
//    if arr == nums {
//        return 0
//    }
//
//    var left = 0
//    while arr[left] == nums[left] {
//        left += 1
//    }
//
//    var right = nums.count - 1
//    while arr[right] == nums[right] {
//        right -= 1
//    }
//
//    return right - left + 1
    var left = -1
    var right = -1
    var maxn = Int.min
    var minn = Int.max
    let n = nums.count
    for i in 0..<n {
        if nums[i] < maxn {
            right = i
        } else {
            maxn = nums[i]
        }
        
        if minn < nums[n-i-1] {
            left = n-i-1
        } else {
            minn = nums[n-i-1]
        }
    }
    
    return right == -1 ? 0 : right - left + 1
}
