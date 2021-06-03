//
//  523.checkSubarraySum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/2.
//

import Foundation

/*
 523. 连续的子数组和
 难度
 中等
 
 317
 
 
 
 
 
 给你一个整数数组 nums 和一个整数 k ，编写一个函数来判断该数组是否含有同时满足下述条件的连续子数组：
 
 子数组大小 至少为 2 ，且
 子数组元素总和为 k 的倍数。
 如果存在，返回 true ；否则，返回 false 。
 
 如果存在一个整数 n ，令整数 x 符合 x = n * k ，则称 x 是 k 的一个倍数。
 
 
 
 示例 1：
 
 输入：nums = [23,2,4,6,7], k = 6
 输出：true
 解释：[2,4] 是一个大小为 2 的子数组，并且和为 6 。
 示例 2：
 
 输入：nums = [23,2,6,4,7], k = 6
 输出：true
 解释：[23, 2, 6, 4, 7] 是大小为 5 的子数组，并且和为 42 。
 42 是 6 的倍数，因为 42 = 7 * 6 且 7 是一个整数。
 示例 3：
 
 输入：nums = [23,2,6,4,7], k = 13
 输出：false
 
 
 提示：
 
 1 <= nums.length <= 10^5
 0 <= nums[i] <= 10^9
 0 <= sum(nums[i]) <= 2^31 - 1
 1 <= k <= 2^31 - 1

 */

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    /*
     超时
    if nums.count < 2 {
        return false
    }
    
    var sums = [Int](repeating: 0, count: nums.count+1)
    for i in 0..<nums.count {
        sums[i+1] = sums[i] + nums[i]
    }
        
    for right in 1..<nums.count {
        var left = 0
        while left < right {
            if (sums[right+1] - sums[left]) % k == 0 {
                return true
            }
            left += 1
        }
    }
    
    return false
    */

    if nums.count < 2 {
        return false
    }

    var mp = [0: -1]
    var sums = 0
    for i in 0..<nums.count {
        sums = (sums + nums[i]) % k
        if let preIndex = mp[sums] {
            if 2 <= i-preIndex {
                return true
            }
        } else {
            mp[sums] = i
        }
    }

    return false

}
