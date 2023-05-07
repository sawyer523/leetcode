//
//  1144.movesToMakeZigzag.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/2/27.
//

import Foundation

/*
 1144. 递减元素使数组呈锯齿状
 给你一个整数数组 nums，每次 操作 会从中选择一个元素并 将该元素的值减少 1。

 如果符合下列情况之一，则数组 A 就是 锯齿数组：

 每个偶数索引对应的元素都大于相邻的元素，即 A[0] > A[1] < A[2] > A[3] < A[4] > ...
 或者，每个奇数索引对应的元素都大于相邻的元素，即 A[0] < A[1] > A[2] < A[3] > A[4] < ...
 返回将数组 nums 转换为锯齿数组所需的最小操作次数。

 示例 1：

 输入：nums = [1,2,3]
 输出：2
 解释：我们可以把 2 递减到 0，或把 3 递减到 1。
 示例 2：

 输入：nums = [9,6,1,6,2]
 输出：4

 提示：

 1 <= nums.length <= 1000
 1 <= nums[i] <= 1000
 */

func movesToMakeZigzag(_ nums: [Int]) -> Int {
    var c1 = 0, c2 = 0

    for i in stride(from: 0, to: nums.count, by: 2) {
        let m = min(0 < i ? nums[i - 1] : Int.max, i < nums.count - 1 ? nums[i + 1] : Int.max)
        if m <= nums[i] {
            c1 += nums[i] - m + 1
        }
    }

    for i in stride(from: 1, to: nums.count, by: 2) {
        let m = min(nums[i - 1], i < nums.count - 1 ? nums[i + 1] : Int.max)
        if m <= nums[i] {
            c2 += nums[i] - m + 1
        }
    }
    return min(c1, c2)
}
