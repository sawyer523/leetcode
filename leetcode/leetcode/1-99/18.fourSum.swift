//
//  18.fourSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/15.
//

import Foundation

/*
 18. 四数之和
 给你一个由 n 个整数组成的数组 nums ，和一个目标值 target 。请你找出并返回满足下述全部条件且不重复的四元组 [nums[a], nums[b], nums[c], nums[d]] （若两个四元组元素一一对应，则认为两个四元组重复）：

 0 <= a, b, c, d < n
 a、b、c 和 d 互不相同
 nums[a] + nums[b] + nums[c] + nums[d] == target
 你可以按 任意顺序 返回答案 。

 示例 1：

 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 示例 2：

 输入：nums = [2,2,2,2,2], target = 8
 输出：[[2,2,2,2]]

 提示：

 1 <= nums.length <= 200
 -10^9 <= nums[i] <= 10^9
 -10^9 <= target <= 10^9
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    let nums = nums.sorted()
    let n = nums.count
    var ans: [[Int]] = []
    for i in 0 ..< n - 3 where nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] <= target {
        if 0 < i && nums[i] == nums[i - 1] ||
            nums[i] + nums[n - 3] + nums[n - 2] + nums[n - 1] < target {
            continue
        }
        for j in i + 1 ..< n - 2 where nums[i] + nums[j] + nums[j + 1] + nums[j + 2] <= target {
            if i + 1 < j && nums[j] == nums[j - 1] ||
                nums[i] + nums[j] + nums[n - 2] + nums[n - 1] < target {
                continue
            }

            var left = j + 1
            var right = n - 1
            while left < right {
                let sum = nums[i] + nums[j] + nums[left] + nums[right]
                if sum == target {
                    ans.append([nums[i], nums[j], nums[left], nums[right]])
                    left += 1
                    while left < right, nums[left] == nums[left - 1] {
                        left += 1
                    }
                    right -= 1
                    while left < right, nums[right] == nums[right + 1] {
                        right -= 1
                    }
                } else if sum < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    return ans
}
