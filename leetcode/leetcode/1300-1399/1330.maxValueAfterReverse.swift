//
// Created by Xiaonan Chen on 2023/5/12.
//

import Foundation

/*
  1330. 翻转子数组得到最大的数组值
 给你一个整数数组 nums 。「数组值」定义为所有满足 0 <= i < nums.length-1 的 |nums[i]-nums[i+1]| 的和。

 你可以选择给定数组的任意子数组，并将该子数组翻转。但你只能执行这个操作 一次 。

 请你找到可行的最大 数组值 。

 示例 1：

 输入：nums = [2,3,1,5,4]
 输出：10
 解释：通过翻转子数组 [3,1,5] ，数组变成 [2,5,1,3,4] ，数组值为 10 。
 示例 2：

 输入：nums = [2,4,9,24,2,1,10]
 输出：68

 提示：

 1 <= nums.length <= 3*10^4
 -10^5 <= nums[i] <= 10^5
  */

func maxValueAfterReverse(_ nums: [Int]) -> Int {
    var value = 0
    let n = nums.count
    for i in 0 ..< n - 1 {
        value += abs(nums[i] - nums[i + 1])
    }

    var mx1 = 0
    for i in 1 ..< n - 1 {
        mx1 = max(mx1, abs(nums[0] - nums[i + 1]) - abs(nums[i] - nums[i + 1]), abs(nums[n - 1] - nums[i - 1]) - abs(nums[i] - nums[i - 1]))
    }

    var mx2 = -100_000
    var mn2 = 100_000
    for i in 0 ..< n - 1 {
        let x = nums[i]
        let y = nums[i + 1]
        mx2 = max(mx2, min(x, y))
        mn2 = min(mn2, max(x, y))
    }
    return value + max(mx1, 2 * (mx2 - mn2))
}
