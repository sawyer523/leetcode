//
//  51.reversePairs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/9.
//

import Foundation

/*
 剑指 Offer 51. 数组中的逆序对
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

 示例 1:

 输入: [7,5,6,4]
 输出: 5

 限制：

 0 <= 数组长度 <= 50000
 */

func reversePairs(_ nums: [Int]) -> Int {
    var nums = nums
    func mergeSort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        if left < right {
            let mid = left + (right - left) >> 1
            let leftCount = mergeSort(&nums, left, mid)
            let rightCount = mergeSort(&nums, mid + 1, right)
            let mergeCount = merge(&nums, left, mid, right)
            return leftCount + rightCount + mergeCount
        }
        return 0
    }

    func merge(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int) -> Int {
        var tempLeft = left, tempRight = mid + 1, index = 0, count = 0
        var tempArray = [Int](repeating: 0, count: right - left + 1)
        while tempLeft <= mid && tempRight <= right {
            if nums[tempLeft] <= nums[tempRight] {
                tempArray[index] = nums[tempLeft]
                index += 1
                tempLeft += 1
            } else {
                tempArray[index] = nums[tempRight]
                index += 1
                tempRight += 1
                count += mid - tempLeft + 1
            }
        }

        if tempLeft <= mid {
            tempArray[index ... index + mid - tempLeft] = nums[tempLeft ... mid]
        }
        if tempRight <= right {
            tempArray[index ... index + right - tempRight] = nums[tempRight ... right]
        }
        nums[left ... right] = tempArray[0 ... right - left]

        return count
    }

    return mergeSort(&nums, 0, nums.count - 1)
}
