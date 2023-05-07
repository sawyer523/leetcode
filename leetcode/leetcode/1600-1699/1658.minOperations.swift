//
//  1658.minOperations.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/7.
//

import Foundation

/*
 1658. 将 x 减到 0 的最小操作数
 难度
 中等

 143

 给你一个整数数组 nums 和一个整数 x 。每一次操作时，你应当移除数组 nums 最左边或最右边的元素，然后从 x 中减去该元素的值。请注意，需要 修改 数组以供接下来的操作使用。

 如果可以将 x 恰好 减到 0 ，返回 最小操作数 ；否则，返回 -1 。

 示例 1：

 输入：nums = [1,1,4,2,3], x = 5
 输出：2
 解释：最佳解决方案是移除后两个元素，将 x 减到 0 。
 示例 2：

 输入：nums = [5,6,7,8,9], x = 4
 输出：-1
 示例 3：

 输入：nums = [3,2,20,1,1,3], x = 10
 输出：5
 解释：最佳解决方案是移除后三个元素和前两个元素（总共 5 次操作），将 x 减到 0 。

 提示：

 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^4
 1 <= x <= 10^9
 */

func minOperations(_ nums: [Int], _ x: Int) -> Int {
    let n = nums.count
    let sum = nums.reduce(0, +)

    if sum < x {
        return -1
    }

    var right = 0
    var lsum = 0
    var rsum = sum
    var ans = n + 1
    var left = -1

    while left < n {
        if left != -1 {
            lsum += nums[left]
        }

        while right < n && x < lsum + rsum {
            rsum -= nums[right]
            right += 1
        }

        if lsum + rsum == x {
            ans = min(ans, left + 1 + n - right)
        }

        left += 1
    }

    if n < ans {
        return -1
    }

    return ans
}
