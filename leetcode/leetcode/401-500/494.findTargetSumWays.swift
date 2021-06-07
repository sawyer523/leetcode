//
//  494.findTargetSumWays.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/7.
//

import Foundation

/*
 494. 目标和
 难度
 中等
 
 733
 
 
 
 
 
 给你一个整数数组 nums 和一个整数 target 。
 
 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：
 
 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
 返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。
 
 
 
 示例 1：
 
 输入：nums = [1,1,1,1,1], target = 3
 输出：5
 解释：一共有 5 种方法让最终目标和为 3 。
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 示例 2：
 
 输入：nums = [1], target = 1
 输出：1
 
 
 提示：
 
 1 <= nums.length <= 20
 0 <= nums[i] <= 1000
 0 <= sum(nums[i]) <= 1000
 -1000 <= target <= 100

 */

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let sum = nums.reduce(0, +)
    let diff = sum - target
    if diff < 0 || diff % 2 == 1 {
        return 0
    }
    
    let n = nums.count
    let neg = diff/2
    var dp = [[Int]](repeating: [Int](repeating: 0, count: neg+1), count: n+1)
    dp[0][0] = 1
    for i in 0..<n {
        for j in 0...neg {
            dp[i+1][j] = dp[i][j]
            if nums[i] <= j {
                dp[i+1][j] += dp[i][j-nums[i]]
            }
        }
    }
    return dp[n][neg]
}
