//
//  485.findMaxConsecutiveOnes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/6.
//

import Foundation

/*
 485. 最大连续1的个数
 难度
 简单

 165

 给定一个二进制数组， 计算其中最大连续1的个数。

 示例 1:

 输入: [1,1,0,1,1,1]
 输出: 3
 解释: 开头的两位和最后的三位都是连续1，所以最大连续1的个数是 3.
 注意：

 输入的数组只包含 0 和1。
 输入数组的长度是正整数，且不超过 10,000。
 */
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return nums.first!
    }
    var ans = 0
    var pre = 0
    for i in nums {
        if i == 0 {
            ans = max(pre, ans)
            pre = 0
        } else {
            pre += 1
        }
    }
    return max(pre, ans)
}
