//
//  673.findNumberOfLIS.swift
//  673.findNumberOfLIS
//
//  Created by Xiaonan Chen on 2021/9/20.
//

import Foundation

/*
 673. 最长递增子序列的个数
 难度
 中等
 
 387
 
 
 
 
 
 给定一个未排序的整数数组，找到最长递增子序列的个数。
 
 示例 1:
 
 输入: [1,3,5,4,7]
 输出: 2
 解释: 有两个最长递增子序列，分别是 [1, 3, 4, 7] 和[1, 3, 5, 7]。
 示例 2:
 
 输入: [2,2,2,2,2]
 输出: 5
 解释: 最长递增子序列的长度是1，并且存在5个子序列的长度为1，因此输出5。
 注意: 给定的数组长度不超过 2000 并且结果一定是32位有符号整数。
 
 */

func findNumberOfLIS(_ nums: [Int]) -> Int {
    var maxLen = 0
    let n = nums.count
    var dp = [Int](repeating: 0, count: n)
    var cnt = [Int](repeating: 0, count: n)
    var ans = 0
    for i in nums.indices {
        dp[i] = 1
        cnt[i] = 1
        for j in 0..<i {
            if nums[j] < nums[i] {
                if dp[i] < dp[j]+1 {
                    dp[i] = dp[j]+1
                    cnt[i] = cnt[j]
                } else if dp[j]+1 == dp[i] {
                    cnt[i] += cnt[j]
                }
            }
        }
        
        if maxLen < dp[i] {
            maxLen = dp[i]
            ans = cnt[i]
        } else if dp[i] == maxLen {
            ans += cnt[i]
        }
    }
    
    return ans
}
