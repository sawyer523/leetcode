//
//  1796.secondHighest.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/3.
//

import Foundation

/*
 1796. 字符串中第二大的数字
 难度
 简单

 18

 给你一个混合字符串 s ，请你返回 s 中 第二大 的数字，如果不存在第二大的数字，请你返回 -1 。

 混合字符串 由小写英文字母和数字组成。

 示例 1：

 输入：s = "dfa12321afd"
 输出：2
 解释：出现在 s 中的数字包括 [1, 2, 3] 。第二大的数字是 2 。
 示例 2：

 输入：s = "abc1111"
 输出：-1
 解释：出现在 s 中的数字只包含 [1] 。没有第二大的数字。

 提示：

 1 <= s.length <= 500
 s 只包含小写英文字母和（或）数字。
 */

func secondHighest(_ s: String) -> Int {
    var first = -1
    var second = -1
    for ch in s {
        if ch.isNumber {
            let num = ch.wholeNumberValue!
            if first < num {
                second = first
                first = num
            } else if second < num && num < first {
                second = num
            }
        }
    }
    return second
}
