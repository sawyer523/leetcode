//
//  525.findMaxLength.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/3.
//

import Foundation

/*
 525. 连续数组
 难度
 中等
 
 296
 
 
 
 
 
 给定一个二进制数组 nums , 找到含有相同数量的 0 和 1 的最长连续子数组，并返回该子数组的长度。
 
 
 
 示例 1:
 
 输入: nums = [0,1]
 输出: 2
 说明: [0, 1] 是具有相同数量0和1的最长连续子数组。
 示例 2:
 
 输入: nums = [0,1,0]
 输出: 2
 说明: [0, 1] (或 [1, 0]) 是具有相同数量0和1的最长连续子数组。
 
 
 提示：
 
 1 <= nums.length <= 105
 nums[i] 不是 0 就是 1

 */

func findMaxLength(_ nums: [Int]) -> Int {
    var mp = [0: -1]
    var count = 0
    var ans = 0

    for i in 0..<nums.count {
        if nums[i] == 1 {
            count += 1
        } else {
            count -= 1
        }

        if let s = mp[count] {
            ans = max(ans, i - s)
        } else {
            mp[count] = i
        }
    }

    return ans
}
