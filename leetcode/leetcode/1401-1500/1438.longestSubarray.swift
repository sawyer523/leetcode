//
//  1438.longestSubarray.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/21.
//

import Foundation

/*
 1438. 绝对差不超过限制的最长连续子数组
 难度
 中等

 146





 给你一个整数数组 nums ，和一个表示限制的整数 limit，请你返回最长连续子数组的长度，该子数组中的任意两个元素之间的绝对差必须小于或者等于 limit 。

 如果不存在满足条件的子数组，则返回 0 。

  

 示例 1：

 输入：nums = [8,2,4,7], limit = 4
 输出：2
 解释：所有子数组如下：
 [8] 最大绝对差 |8-8| = 0 <= 4.
 [8,2] 最大绝对差 |8-2| = 6 > 4.
 [8,2,4] 最大绝对差 |8-2| = 6 > 4.
 [8,2,4,7] 最大绝对差 |8-2| = 6 > 4.
 [2] 最大绝对差 |2-2| = 0 <= 4.
 [2,4] 最大绝对差 |2-4| = 2 <= 4.
 [2,4,7] 最大绝对差 |2-7| = 5 > 4.
 [4] 最大绝对差 |4-4| = 0 <= 4.
 [4,7] 最大绝对差 |4-7| = 3 <= 4.
 [7] 最大绝对差 |7-7| = 0 <= 4.
 因此，满足题意的最长子数组的长度为 2 。
 示例 2：

 输入：nums = [10,1,2,4,7,2], limit = 5
 输出：4
 解释：满足题意的最长子数组是 [2,4,7,2]，其最大绝对差 |2-7| = 5 <= 5 。
 示例 3：

 输入：nums = [4,2,2,2,4,4,2,2], limit = 0
 输出：3
  

 提示：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^9
 0 <= limit <= 10^9

 */

func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
    var minQ: [Int] = []
    var maxQ: [Int] = []
    var left = 0
    var ans = 0
    for (right, v) in nums.enumerated() {
        while 0 < minQ.count && v < minQ.last! {
            minQ.popLast()
        }
        minQ.append(v)
        while 0 < maxQ.count && maxQ.last! < v {
            maxQ.popLast()
        }
        maxQ.append(v)
        while 0 < minQ.count && 0 < maxQ.count && limit < maxQ.first! - minQ.first! {
            if nums[left] == minQ[0] {
                minQ.remove(at: 0)
            }
            if nums[left] == maxQ[0] {
                maxQ.remove(at: 0)
            }
            left += 1
        }
        
        ans = max(ans, right-left+1)
    }
    return ans
}
