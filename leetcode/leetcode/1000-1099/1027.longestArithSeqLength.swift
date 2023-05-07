//
//  1027.longestArithSeqLength.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/22.
//

import Foundation

/*
 1027. 最长等差数列
 给你一个整数数组 nums，返回 nums 中最长等差子序列的长度。

 回想一下，nums 的子序列是一个列表 nums[i1], nums[i2], ..., nums[ik] ，且 0 <= i1 < i2 < ... < ik <= nums.length - 1。并且如果 seq[i+1] - seq[i]( 0 <= i < seq.length - 1) 的值都相同，那么序列 seq 是等差的。

 示例 1：

 输入：nums = [3,6,9,12]
 输出：4
 解释：
 整个数组是公差为 3 的等差数列。
 示例 2：

 输入：nums = [9,4,7,2,10]
 输出：3
 解释：
 最长的等差子序列是 [4,7,10]。
 示例 3：

 输入：nums = [20,1,15,3,10,5,8]
 输出：4
 解释：
 最长的等差子序列是 [20,15,10,5]。

 提示：

 2 <= nums.length <= 1000
 0 <= nums[i] <= 500
 */

func longestArithSeqLength(_ nums: [Int]) -> Int {
    let minv = nums.min()!
    let maxv = nums.max()!
    let diff = maxv - minv
    var ans = 1
    for d in -diff ... diff {
        var f = [Int](repeating: -1, count: maxv + 1)
        for num in nums {
            let prev = num - d
            if minv <= prev, prev <= maxv, f[prev] != -1 {
                f[num] = max(f[num], f[prev] + 1)
                ans = max(ans, f[num])
            }
            f[num] = max(f[num], 1)
        }
    }

    return ans
}
