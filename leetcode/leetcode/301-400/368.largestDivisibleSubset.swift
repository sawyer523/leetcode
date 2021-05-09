//
//  368.largestDivisibleSubset.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/23.
//

import Foundation

/*
 368. 最大整除子集
 难度
 中等

 243





 给你一个由 无重复 正整数组成的集合 nums ，请你找出并返回其中最大的整除子集 answer ，子集中每一元素对 (answer[i], answer[j]) 都应当满足：
 answer[i] % answer[j] == 0 ，或
 answer[j] % answer[i] == 0
 如果存在多个有效解子集，返回其中任何一个均可。

  

 示例 1：

 输入：nums = [1,2,3]
 输出：[1,2]
 解释：[1,3] 也会被视为正确答案。
 示例 2：

 输入：nums = [1,2,4,8]
 输出：[1,2,4,8]
  

 提示：

 1 <= nums.length <= 1000
 1 <= nums[i] <= 2 * 109
 nums 中的所有整数 互不相同
 */

func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
    let n = nums.count
    let nums = nums.sorted()
    
    var dp = [Int](repeating: 1, count: n)
    var maxSize = 1
    var maxVal = dp[0]
    
    for i in 1..<n {
        for j in 0..<i {
            if nums[i]%nums[j] == 0 && dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
            }
        }
        
        if maxSize < dp[i] {
            (maxSize, maxVal) = (dp[i], nums[i])
        }
    }
    
    if maxSize == 1 {
        return [nums[0]]
    }
    
    var res: [Int] = []
    for i in stride(from: n-1, through: 0, by: -1) {
        if dp[i] == maxSize && maxVal % nums[i] == 0 {
            res.append(nums[i])
            maxVal = nums[i]
            maxSize -= 1
        }
    }
    
    return res
}
