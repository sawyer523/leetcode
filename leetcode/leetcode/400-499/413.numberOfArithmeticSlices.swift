//
//  413.numberOfArithmeticSlices.swift
//  413.numberOfArithmeticSlices
//
//  Created by Xiaonan Chen on 2021/8/10.
//

import Foundation

/*
 413. 等差数列划分
 难度
 中等

 281

 如果一个数列 至少有三个元素 ，并且任意两个相邻元素之差相同，则称该数列为等差数列。

 例如，[1,3,5,7,9]、[7,7,7,7] 和 [3,-1,-5,-9] 都是等差数列。
 给你一个整数数组 nums ，返回数组 nums 中所有为等差数组的 子数组 个数。

 子数组 是数组中的一个连续序列。

 示例 1：

 输入：nums = [1,2,3,4]
 输出：3
 解释：nums 中有三个子等差数组：[1, 2, 3]、[2, 3, 4] 和 [1,2,3,4] 自身。
 示例 2：

 输入：nums = [1]
 输出：0

 提示：

 1 <= nums.length <= 5000
 -1000 <= nums[i] <= 1000
 */

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    let n = nums.count
    if n == 1 {
        return 0
    }

    var d = nums[0] - nums[1]
    var t = 0

    var ans = 0

    for i in 2 ..< n where n > 2 {
        if nums[i - 1] - nums[i] == d {
            t += 1
        } else {
            d = nums[i - 1] - nums[i]
            t = 0
        }
        ans += t
    }

    return ans
}
