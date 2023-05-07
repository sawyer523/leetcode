//
//  1224.maxEqualFreq.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/18.
//

import Foundation

/*
 1224. 最大相等频率
 难度
 困难

 72

 给你一个正整数数组 nums，请你帮忙从该数组中找出能满足下面要求的 最长 前缀，并返回该前缀的长度：

 从前缀中 恰好删除一个 元素后，剩下每个数字的出现次数都相同。
 如果删除这个元素后没有剩余元素存在，仍可认为每个数字都具有相同的出现次数（也就是 0 次）。

 示例 1：

 输入：nums = [2,2,1,1,5,3,3,5]
 输出：7
 解释：对于长度为 7 的子数组 [2,2,1,1,5,3,3]，如果我们从中删去 nums[4] = 5，就可以得到 [2,2,1,1,3,3]，里面每个数字都出现了两次。
 示例 2：

 输入：nums = [1,1,1,2,2,2,3,3,3,4,4,4,5]
 输出：13

 提示：

 2 <= nums.length <= 10^5
 1 <= nums[i] <= 10^5
 */

func maxEqualFreq(_ nums: [Int]) -> Int {
    var freq: [Int: Int] = [:]
    var count: [Int: Int] = [:]
    var maxFreq = 0
    var ans = 0
    for (i, num) in nums.enumerated() {
        if count[num, default: 0] > 0 {
            freq[count[num, default: 0], default: 0] -= 1
        }
        count[num, default: 0] += 1
        maxFreq = max(maxFreq, count[num, default: 0])
        freq[count[num, default: 0], default: 0] += 1
        if maxFreq == 1 ||
            freq[maxFreq, default: 0] * maxFreq + freq[maxFreq - 1, default: 0] * (maxFreq - 1) == i + 1 && freq[maxFreq, default: 0] == 1 ||
            freq[maxFreq, default: 0] * maxFreq + 1 == i + 1 && freq[1, default: 0] == 1 {
            ans = max(ans, i + 1)
        }
    }
    return ans
}
