//
//  862.shortestSubarray.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/21.
//

import Foundation

/*
 862. 和至少为 K 的最短子数组
 难度
 困难
 
 278
 
 
 
 
 
 返回 A 的最短的非空连续子数组的长度，该子数组的和至少为 K 。
 
 如果没有和至少为 K 的非空子数组，返回 -1 。
 
 
 
 示例 1：
 
 输入：A = [1], K = 1
 输出：1
 示例 2：
 
 输入：A = [1,2], K = 4
 输出：-1
 示例 3：
 
 输入：A = [2,-1,2], K = 3
 输出：3
 
 
 提示：
 
 1 <= A.length <= 50000
 -10 ^ 5 <= A[i] <= 10 ^ 5
 1 <= K <= 10 ^ 9
 */

func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
    var preSum = [0]
    for i in 0..<nums.count {
        preSum.append(nums[i]+preSum[i])
    }

    var queue: [Int] = []
    var ans = Int.max
    for right in 0...nums.count {
        while !queue.isEmpty && preSum[right] <= preSum[queue.last!] {
            queue.removeLast()
        }
        while !queue.isEmpty && k <= (preSum[right] - preSum[queue.first!]) {
            ans = min(ans, right - queue.removeFirst())
        }

        queue.append(right)
    }

    return ans == Int.max ? -1 : ans
}
