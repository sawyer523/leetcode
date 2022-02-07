//
//  1218.longestSubsequence.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/5.
//

import Foundation

/*
 1218. 最长定差子序列
 难度
 中等
 
 94
 
 
 
 
 
 给你一个整数数组 arr 和一个整数 difference，请你找出并返回 arr 中最长等差子序列的长度，该子序列中相邻元素之间的差等于 difference 。
 
 子序列 是指在不改变其余元素顺序的情况下，通过删除一些元素或不删除任何元素而从 arr 派生出来的序列。
 
 
 
 示例 1：
 
 输入：arr = [1,2,3,4], difference = 1
 输出：4
 解释：最长的等差子序列是 [1,2,3,4]。
 示例 2：
 
 输入：arr = [1,3,5,7], difference = 1
 输出：1
 解释：最长的等差子序列是任意单个元素。
 示例 3：
 
 输入：arr = [1,5,7,8,5,3,4,2,1], difference = -2
 输出：4
 解释：最长的等差子序列是 [7,5,3,1]。
 
 
 提示：
 
 1 <= arr.length <= 105
 -10^4 <= arr[i], difference <= 10^4
 */

func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
    var dp: [Int: Int] = [:]
    var ans = 0
    for num in arr {
        dp[num, default: 0] = dp[num - difference, default: 0] + 1
        ans = max(dp[num]!, ans)
    }
    return ans
}
