//
//  05.findLongestSubarray.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/11.
//

import Foundation

/*
 面试题 17.05.  字母与数字
 给定一个放有字母和数字的数组，找到最长的子数组，且包含的字母和数字的个数相同。

 返回该子数组，若存在多个最长子数组，返回左端点下标值最小的子数组。若不存在这样的数组，返回一个空数组。

 示例 1:

 输入: ["A","1","B","C","D","2","3","4","E","5","F","G","6","7","H","I","J","K","L","M"]

 输出: ["A","1","B","C","D","2","3","4","E","5","F","G","6","7"]
 示例 2:

 输入: ["A","A"]

 输出: []
 提示：

 array.length <= 100000
 */

func findLongestSubarray(_ array: [String]) -> [String] {
    var idxs: [Int: Int] = [:]
    var sum = 0
    var startIndex = -1
    var maxLength = 0
    idxs[0] = -1
    for (i, ch) in array.enumerated() {
        if ch.first!.isNumber {
            sum += 1
        } else {
            sum -= 1
        }

        if let idx = idxs[sum] {
            if maxLength < i - idx {
                maxLength = i - idx
                startIndex = idx + 1
            }
        } else {
            idxs[sum] = i
        }
    }

    return maxLength == 0 ? [] : Array(array[startIndex ..< startIndex + maxLength])
}
