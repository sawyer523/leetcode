//
//  1814.countNicePairs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/17.
//

import Foundation

/*
 1814. 统计一个数组中好对子的数目
 难度
 中等

 48

 给你一个数组 nums ，数组中只包含非负整数。定义 rev(x) 的值为将整数 x 各个数字位反转得到的结果。比方说 rev(123) = 321 ， rev(120) = 21 。我们称满足下面条件的下标对 (i, j) 是 好的 ：

 0 <= i < j < nums.length
 nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
 请你返回好下标对的数目。由于结果可能会很大，请将结果对 109 + 7 取余 后返回。

 示例 1：

 输入：nums = [42,11,1,97]
 输出：2
 解释：两个坐标对为：
  - (0,3)：42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121 。
  - (1,2)：11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12 。
 示例 2：

 输入：nums = [13,10,35,24,76]
 输出：4

 提示：

 1 <= nums.length <= 10^5
 0 <= nums[i] <= 10^9
 */

func countNicePairs(_ nums: [Int]) -> Int {
    var cnt: [Int: Int] = [:]
    var ans = 0
    for num in nums {
        var rev = 0
        var x = num
        while x > 0 {
            rev = rev * 10 + x % 10
            x /= 10
        }
        ans += cnt[num - rev, default: 0]
        cnt[num - rev, default: 0] += 1
    }
    return ans % Int(1e9 + 7)
}
