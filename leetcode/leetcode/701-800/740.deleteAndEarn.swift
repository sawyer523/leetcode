//
//  740.deleteAndEarn.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/5.
//

import Foundation

/*
 740. 删除并获得点数
 难度
 中等
 
 278
 
 
 
 
 
 给你一个整数数组 nums ，你可以对它进行一些操作。
 
 每次操作中，选择任意一个 nums[i] ，删除它并获得 nums[i] 的点数。之后，你必须删除每个等于 nums[i] - 1 或 nums[i] + 1 的元素。
 
 开始你拥有 0 个点数。返回你能通过这些操作获得的最大点数。
 
 
 
 示例 1：
 
 输入：nums = [3,4,2]
 输出：6
 解释：
 删除 4 获得 4 个点数，因此 3 也被删除。
 之后，删除 2 获得 2 个点数。总共获得 6 个点数。
 示例 2：
 
 输入：nums = [2,2,3,3,3,4]
 输出：9
 解释：
 删除 3 获得 3 个点数，接着要删除两个 2 和 4 。
 之后，再次删除 3 获得 3 个点数，再次删除 3 获得 3 个点数。
 总共获得 9 个点数。
 
 
 提示：
 
 1 <= nums.length <= 2 * 104
 1 <= nums[i] <= 104
 */

func deleteAndEarn(_ nums: [Int]) -> Int {
//    let maxVal = nums.max()!
//    var sum = [Int](repeating: 0, count: maxVal+1)
//    for val in nums {
//        sum[val] += val
//    }
    
    func rob(_ sum: [Int]) -> Int {
        var first = sum[0]
        var second = max(sum[0], sum[1])
        for i in 2..<sum.count {
            (first, second) = (second, max(first + sum[i], second))
        }
        return second
    }
    
    let nums = nums.sorted()
    var sum = [nums[0]]
    var ans = 0
    for i in 1..<nums.count {
        let val = nums[i]
        if val == nums[i-1] {
            sum[sum.count-1] += val
        } else if nums[i-1]+1 == val {
            sum.append(val)
        } else {
            ans += rob(sum)
            sum = [val]
        }
    }
    
    return ans + rob(sum)
}
