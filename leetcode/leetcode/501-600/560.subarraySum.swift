//
//  560.subarraySum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/29.
//

import Foundation

/*
 560. 和为K的子数组
 难度
 中等
 
 914
 
 
 
 
 
 给定一个整数数组和一个整数 k，你需要找到该数组中和为 k 的连续的子数组的个数。
 
 示例 1 :
 
 输入:nums = [1,1,1], k = 2
 输出: 2 , [1,1] 与 [1,1] 为两种不同的情况。
 说明 :
 
 数组的长度为 [1, 20,000]。
 数组中元素的范围是 [-1000, 1000] ，且整数 k 的范围是 [-1e7, 1e7]。
 */

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var pre = 0
    var count = 0
    var m: [Int: Int] = [:]
    m[0] = 1
    for i in 0..<nums.count {
        pre += nums[i]
        if let c = m[pre-k] {
            count += c
        }
        m[pre, default: 0] += 1
    }

    return count
}
