//
//  1425.constrainedSubsetSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/15.
//

import Foundation

/*
 1425. 带限制的子序列和
 难度
 困难

 72

 给你一个整数数组 nums 和一个整数 k ，请你返回 非空 子序列元素和的最大值，子序列需要满足：子序列中每两个 相邻 的整数 nums[i] 和 nums[j] ，它们在原数组中的下标 i 和 j 满足 i < j 且 j - i <= k 。

 数组的子序列定义为：将数组中的若干个数字删除（可以删除 0 个数字），剩下的数字按照原本的顺序排布。

 示例 1：

 输入：nums = [10,2,-10,5,20], k = 2
 输出：37
 解释：子序列为 [10, 2, 5, 20] 。
 示例 2：

 输入：nums = [-1,-2,-3], k = 1
 输出：-1
 解释：子序列必须是非空的，所以我们选择最大的数字。
 示例 3：

 输入：nums = [10,-2,-10,-5,20], k = 2
 输出：23
 解释：子序列为 [10, -2, -5, 20] 。

 提示：

 1 <= k <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 */

func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
    var dp = nums
    var queue = [Int](repeating: 0, count: nums.count)
    var ans = nums[0]
    var left = 0
    var right = -1

    for i in 0 ..< nums.count {
        if left <= right && k < i - queue[left] {
            left += 1
        }
        if left <= right {
            dp[i] = max(nums[i], nums[i] + dp[queue[left]])
        }
        ans = max(ans, dp[i])
        while left <= right && dp[queue[right]] < dp[i] {
            right -= 1
        }
        right += 1
        queue[right] = i
    }
    return ans
}
