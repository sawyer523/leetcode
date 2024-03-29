//
//  728.selfDividingNumbers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/31.
//

import Foundation

/*
 728. 自除数
 难度
 简单

 167

 自除数 是指可以被它包含的每一位数整除的数。

 例如，128 是一个 自除数 ，因为 128 % 1 == 0，128 % 2 == 0，128 % 8 == 0。
 自除数 不允许包含 0 。

 给定两个整数 left 和 right ，返回一个列表，列表的元素是范围 [left, right] 内所有的 自除数 。

 示例 1：

 输入：left = 1, right = 22
 输出：[1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 示例 2:

 输入：left = 47, right = 85
 输出：[48,55,66,77]

 提示：

 1 <= left <= right <= 10^4
 */

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    func isSelfDivding(_ num: Int) -> Bool {
        var n = num
        while n > 0 {
            let d = n % 10
            if d == 0 ||
                num % d != 0 {
                return false
            }
            n /= 10
        }
        return true
    }

    return (left ... right).filter(isSelfDivding)
}
