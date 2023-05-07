//
//  010.subarraySum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/13.
//

import Foundation

/*
 剑指 Offer II 010. 和为 k 的子数组
 给定一个整数数组和一个整数 k ，请找到该数组中和为 k 的连续子数组的个数。

 示例 1：

 输入:nums = [1,1,1], k = 2
 输出: 2
 解释: 此题 [1,1] 与 [1,1] 为两种不同的情况
 示例 2：

 输入:nums = [1,2,3], k = 3
 输出: 2

 提示:

 1 <= nums.length <= 2 * 10^4
 -1000 <= nums[i] <= 1000
 -10^7 <= k <= 10^7
 */

func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
    var pre = 0
    var count = 0
    var m: [Int: Int] = [:]
    m[0] = 1
    for i in 0 ..< nums.count {
        pre += nums[i]
        if let c = m[pre - k] {
            count += c
        }
        m[pre, default: 0] += 1
    }

    return count
}
