//
//  303.numArray.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/1.
//

import Foundation

/*
 303. 区域和检索 - 数组不可变
 难度
 简单

 268

 给定一个整数数组  nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点。

 实现 NumArray 类：

 NumArray(int[] nums) 使用数组 nums 初始化对象
 int sumRange(int i, int j) 返回数组 nums 从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点（也就是 sum(nums[i], nums[i + 1], ... , nums[j])）

 示例：

 输入：
 ["NumArray", "sumRange", "sumRange", "sumRange"]
 [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
 输出：
 [null, 1, -1, -3]

 解释：
 NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
 numArray.sumRange(0, 2); // return 1 ((-2) + 0 + 3)
 numArray.sumRange(2, 5); // return -1 (3 + (-5) + 2 + (-1))
 numArray.sumRange(0, 5); // return -3 ((-2) + 0 + 3 + (-5) + 2 + (-1))

 提示：

 0 <= nums.length <= 104
 -105 <= nums[i] <= 105
 0 <= i <= j < nums.length
 最多调用 104 次 sumRange 方法
 */

class NumArray {
    private var sums: [Int]
    init(_ nums: [Int]) {
        sums = [Int](repeating: 0, count: nums.count + 1)
        for (i, v) in nums.enumerated() {
            sums[i + 1] = sums[i] + v
        }
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sums[j + 1] - sums[i]
    }
}
