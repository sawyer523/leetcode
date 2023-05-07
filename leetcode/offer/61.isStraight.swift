//
//  61.isStraight.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/26.
//

import Foundation

/*
 面试题61. 扑克牌中的顺子
 从若干副扑克牌中随机抽 5 张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任意数字。A 不能视为 14。

 示例 1:

 输入: [1,2,3,4,5]
 输出: True

 示例 2:

 输入: [0,0,1,2,5]
 输出: True

 限制：

 数组长度为 5

 数组的数取值为 [0, 13] .
 */

func isStraight(_ nums: [Int]) -> Bool {
    var joker = 0
    let nums = nums.sorted()
    for i in 0 ..< 4 {
        if nums[i] == 0 {
            joker += 1
        } else if nums[i] == nums[i + 1] {
            return false
        }
    }

    return nums[4] - nums[joker] < 5
}
