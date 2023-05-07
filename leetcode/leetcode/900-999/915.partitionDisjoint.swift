//
//  915.partitionDisjoint.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/24.
//

import Foundation

/*
 915. 分割数组
 难度
 中等

 128

 给定一个数组 nums ，将其划分为两个连续子数组 left 和 right， 使得：

 left 中的每个元素都小于或等于 right 中的每个元素。
 left 和 right 都是非空的。
 left 的长度要尽可能小。
 在完成这样的分组后返回 left 的 长度 。

 用例可以保证存在这样的划分方法。

 示例 1：

 输入：nums = [5,0,3,8,6]
 输出：3
 解释：left = [5,0,3]，right = [8,6]
 示例 2：

 输入：nums = [1,1,1,0,6,12]
 输出：4
 解释：left = [1,1,1,0]，right = [6,12]

 提示：

 2 <= nums.length <= 10^5
 0 <= nums[i] <= 10^6
 可以保证至少有一种方法能够按题目所描述的那样对 nums 进行划分。
 */

func partitionDisjoint(_ nums: [Int]) -> Int {
    let n = nums.count
    var leftMax = nums[0]
    var leftPos = 0
    var curMax = nums[0]
    for i in 1 ..< n - 1 {
        curMax = max(curMax, nums[i])
        if nums[i] < leftMax {
            leftMax = curMax
            leftPos = i
        }
    }
    return leftPos + 1
}
