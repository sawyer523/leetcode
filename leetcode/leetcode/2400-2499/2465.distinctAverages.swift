//
//  2465.distinctAverages.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/4.
//

import Foundation

/*
 2465. 不同的平均值数目
 给你一个下标从 0 开始长度为 偶数 的整数数组 nums 。

 只要 nums 不是 空数组，你就重复执行以下步骤：

 找到 nums 中的最小值，并删除它。
 找到 nums 中的最大值，并删除它。
 计算删除两数的平均值。
 两数 a 和 b 的 平均值 为 (a + b) / 2 。

 比方说，2 和 3 的平均值是 (2 + 3) / 2 = 2.5 。
 返回上述过程能得到的 不同 平均值的数目。

 注意 ，如果最小值或者最大值有重复元素，可以删除任意一个。

 示例 1：

 输入：nums = [4,1,4,0,3,5]
 输出：2
 解释：
 1. 删除 0 和 5 ，平均值是 (0 + 5) / 2 = 2.5 ，现在 nums = [4,1,4,3] 。
 2. 删除 1 和 4 ，平均值是 (1 + 4) / 2 = 2.5 ，现在 nums = [4,3] 。
 3. 删除 3 和 4 ，平均值是 (3 + 4) / 2 = 3.5 。
 2.5 ，2.5 和 3.5 之中总共有 2 个不同的数，我们返回 2 。
 示例 2：

 输入：nums = [1,100]
 输出：1
 解释：
 删除 1 和 100 后只有一个平均值，所以我们返回 1 。

 提示：

 2 <= nums.length <= 100
 nums.length 是偶数。
 0 <= nums[i] <= 100
 */

func distinctAverages(_ nums: [Int]) -> Int {
    var nums = nums.sorted()
    var seen: [Int: Bool] = [:]
    var i = 0
    var j = nums.count - 1
    while i < j {
        seen[nums[i] + nums[j]] = true
        i += 1
        j -= 1
    }
    return seen.count
}
