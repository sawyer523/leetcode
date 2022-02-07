//
//  162.findPeakElement.swift
//  162.findPeakElement
//
//  Created by Xiaonan Chen on 2021/9/15.
//

import Foundation

/*
 162. 寻找峰值
 难度
 中等
 
 572
 
 
 
 
 
 峰值元素是指其值严格大于左右相邻值的元素。
 
 给你一个整数数组 nums，找到峰值元素并返回其索引。数组可能包含多个峰值，在这种情况下，返回 任何一个峰值 所在位置即可。
 
 你可以假设 nums[-1] = nums[n] = -∞ 。
 
 你必须实现时间复杂度为 O(log n) 的算法来解决此问题。
 
 
 
 示例 1：
 
 输入：nums = [1,2,3,1]
 输出：2
 解释：3 是峰值元素，你的函数应该返回其索引 2。
 示例 2：
 
 输入：nums = [1,2,1,3,5,6,4]
 输出：1 或 5
 解释：你的函数可以返回索引 1，其峰值元素为 2；
 或者返回索引 5， 其峰值元素为 6。
 
 
 提示：
 
 1 <= nums.length <= 1000
 -23^1 <= nums[i] <= 2^31 - 1
 对于所有有效的 i 都有 nums[i] != nums[i + 1]
 */

func findPeakElement(_ nums: [Int]) -> Int {
    let n = nums.count
    func get(_ i: Int) -> Int {
        if i == -1 || i == n {
            return Int.min
        }
        return nums[i]
    }
    
    var left = 0
    var right = nums.count - 1
    while left < right {
        let mid = (left + right) >> 1
        if get(mid-1) < get(mid) && get(mid+1) < get(mid) {
            return mid
        }
        if get(mid) < get(mid + 1) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}
