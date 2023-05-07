//
//  15.threeSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/12.
//

import Foundation

/*
 15. 三数之和
 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

 你返回所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 解释：
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
 不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
 注意，输出的顺序和三元组的顺序并不重要。
 示例 2：

 输入：nums = [0,1,1]
 输出：[]
 解释：唯一可能的三元组和不为 0 。
 示例 3：

 输入：nums = [0,0,0]
 输出：[[0,0,0]]
 解释：唯一可能的三元组和为 0 。

 提示：

 3 <= nums.length <= 3000
 -10^5 <= nums[i] <= 10^5
 */

func threeSum2(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    let nums = nums.sorted()
    var ans: [[Int]] = []

    for first in 0 ..< n {
        if 0 < first, nums[first] == nums[first - 1] {
            continue
        }

        let target = -1 * nums[first]
        var thrid = n - 1
        for second in first + 1 ..< n {
            if first + 1 < second, nums[second] == nums[second - 1] {
                continue
            }

            while second < thrid, target < nums[second] + nums[thrid] {
                thrid -= 1
            }

            if second == thrid {
                break
            }

            if nums[second] + nums[thrid] == target {
                ans.append([nums[first], nums[second], nums[thrid]])
            }
        }
    }

    return ans
}
