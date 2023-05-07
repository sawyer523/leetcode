//
//  961.repeatedNTimes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/21.
//

import Foundation

/*
 961. 在长度 2N 的数组中找出重复 N 次的元素
 难度
 简单

 123

 给你一个整数数组 nums ，该数组具有以下属性：

 nums.length == 2 * n.
 nums 包含 n + 1 个 不同的 元素
 nums 中恰有一个元素重复 n 次
 找出并返回重复了 n 次的那个元素。

 示例 1：

 输入：nums = [1,2,3,3]
 输出：3
 示例 2：

 输入：nums = [2,1,2,5,3,2]
 输出：2
 示例 3：

 输入：nums = [5,1,5,2,5,3,5,4]
 输出：5

 提示：

 2 <= n <= 5000
 nums.length == 2 * n
 0 <= nums[i] <= 104
 nums 由 n + 1 个 不同的 元素组成，且其中一个元素恰好重复 n 次
 */

func repeatedNTimes(_ nums: [Int]) -> Int {
    let n = nums.count
    while true {
        let x = Int.random(in: 0 ..< n)
        let y = Int.random(in: 0 ..< n)
        if x != y &&
            nums[x] == nums[y] {
            return nums[x]
        }
    }
}
