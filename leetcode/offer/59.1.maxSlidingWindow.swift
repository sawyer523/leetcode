//
//  59.1.maxSlidingWindow.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/7.
//

import Foundation

/*
 剑指 Offer 59 - I. 滑动窗口的最大值
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 你可以假设 k 总是有效的，在输入数组 不为空 的情况下，1 ≤ k ≤ nums.length。
 */

func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        var left = Array(repeating: 0, count: nums.count)
        var right = Array(repeating: 0, count: nums.count)

        left[0] = nums[0]
        right[nums.count - 1] = nums[nums.count - 1]

        for i in 1 ..< nums.count {
            left[i] = (i % k == 0 ? nums[i] : max(left[i - 1], nums[i]))
            let j = nums.count - i - 1
            right[j] = (j + 1) % k == 0 ? nums[j] : max(right[j + 1], nums[j])
        }

        var res = [Int]()
        for i in 0 ..< (nums.count - k + 1) {
            let j = i + k - 1
            res.append(max(right[i], left[j]))
        }
        return res
    }
