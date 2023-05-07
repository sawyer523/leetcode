//
//  219.containsNearbyDuplicate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/19.
//

import Foundation

/*
 219. 存在重复元素 II
 难度
 简单

 370

 给你一个整数数组 nums 和一个整数 k ，判断数组中是否存在两个 不同的索引 i 和 j ，满足 nums[i] == nums[j] 且 abs(i - j) <= k 。如果存在，返回 true ；否则，返回 false 。

 示例 1：

 输入：nums = [1,2,3,1], k = 3
 输出：true
 示例 2：

 输入：nums = [1,0,1,1], k = 1
 输出：true
 示例 3：

 输入：nums = [1,2,3,1,2,3], k = 2
 输出：false

 提示：

 1 <= nums.length <= 10^5
 -10^9 <= nums[i] <= 10^9
 0 <= k <= 10^5

 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var set: [Int: Int] = [:]
    for i in 0 ..< nums.count {
        if k < i {
            set.removeValue(forKey: nums[i - k - 1])
        }
        if set[nums[i]] != nil {
            return true
        }
        set[nums[i]] = 0
    }
    return false
}
