//
//  698.canPartitionKSubsets.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/20.
//

import Foundation

/*
 698. 划分为k个相等的子集
 难度
 中等

 678

 给定一个整数数组  nums 和一个正整数 k，找出是否有可能把这个数组分成 k 个非空子集，其总和都相等。

 示例 1：

 输入： nums = [4, 3, 2, 3, 5, 2, 1], k = 4
 输出： True
 说明： 有可能将其分成 4 个子集（5），（1,4），（2,3），（2,3）等于总和。
 示例 2:

 输入: nums = [1,2,3,4], k = 3
 输出: false

 提示：

 1 <= k <= len(nums) <= 16
 0 < nums[i] < 10000
 每个元素的频率在 [1,4] 范围内
 */

func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    let all = nums.reduce(0, +)
    if all % k > 0 {
        return false
    }
    let per = all / k
    let nums = nums.sorted()
    if per < nums.last! {
        return false
    }
    let n = nums.count
    var dp = [Bool](repeating: true, count: 1 << n)
    func dfs(_ s: Int, _ p: Int) -> Bool {
        if s == 0 {
            return true
        }

        if !dp[s] {
            return dp[s]
        }

        dp[s] = false
        for (i, num) in nums.enumerated() {
            if per < num + p {
                break
            }

            if s >> i & 1 > 0 &&
                dfs(s ^ 1 << i, (p + nums[i]) % per) {
                return true
            }
        }
        return false
    }
    return dfs(1 << n - 1, 0)
}
