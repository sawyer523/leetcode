//
//  66.plusOne.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/21.
//

import Foundation

/*
 66. 加一
 难度
 简单

 784

 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

 示例 1：

 输入：digits = [1,2,3]
 输出：[1,2,4]
 解释：输入数组表示数字 123。
 示例 2：

 输入：digits = [4,3,2,1]
 输出：[4,3,2,2]
 解释：输入数组表示数字 4321。
 示例 3：

 输入：digits = [0]
 输出：[1]

 提示：

 1 <= digits.length <= 100
 0 <= digits[i] <= 9

 */

func plusOne(_ digits: [Int]) -> [Int] {
    var dig = digits
    let n = dig.count
    for i in stride(from: n - 1, through: 0, by: -1) {
        if dig[i] != 9 {
            dig[i] += 1
            for j in i + 1 ..< n {
                dig[j] = 0
            }
            return dig
        }
    }

    dig = [Int](repeating: 0, count: n + 1)
    dig[0] = 1
    return dig
}
