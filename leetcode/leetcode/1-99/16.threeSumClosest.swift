//
//  16.threeSumClosest.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/10.
//

import Foundation

/*
 16. 最接近的三数之和
 给你一个长度为 n 的整数数组 nums 和 一个目标值 target。请你从 nums 中选出三个整数，使它们的和与 target 最接近。

 返回这三个数的和。

 假定每组输入只存在恰好一个解。

 示例 1：

 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
 示例 2：

 输入：nums = [0,0,0], target = 1
 输出：0

 提示：

 3 <= nums.length <= 1000
 -1000 <= nums[i] <= 1000
 -104 <= target <= 10^4
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let nums = nums.sorted()
    let n = nums.count
    var best = Int.max / 2

    func update(_ cur: Int) {
        if abs(cur - target) < abs(best - target) {
            best = cur
        }
    }

    for i in 0 ..< n {
        if 0 < i &&
            nums[i] == nums[i - 1] {
            continue
        }

        var j = i + 1
        var k = n - 1
        while j < k {
            let sum = nums[i] + nums[j] + nums[k]
            if sum == target {
                return sum
            }

            update(sum)
            if target < sum {
                var k0 = k - 1
                while j < k0 &&
                    nums[k0] == nums[k] {
                    k0 -= 1
                }
                k = k0
            } else {
                var j0 = j + 1
                while j0 < k &&
                    nums[j0] == nums[j] {
                    j0 += 1
                }
                j = j0
            }
        }
    }
    return best
}
