//
//  453.minMoves.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/20.
//

import Foundation

/*
 453. 最小操作次数使数组元素相等
 难度
 简单

 286

 给你一个长度为 n 的整数数组，每次操作将会使 n - 1 个元素增加 1 。返回让数组所有元素相等的最小操作次数。

 示例 1：

 输入：nums = [1,2,3]
 输出：3
 解释：
 只需要3次操作（注意每次操作会增加两个元素的值）：
 [1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
 示例 2：

 输入：nums = [1,1,1]
 输出：0

 提示：

 n == nums.length
 1 <= nums.length <= 10^5
 -10^9 <= nums[i] <= 10^9
 答案保证符合 32-bit 整数
 */

func minMoves(_ nums: [Int]) -> Int {
    let m = nums.min()!
    var ans = 0
    for num in nums {
        ans += num - m
    }
    return ans
}
