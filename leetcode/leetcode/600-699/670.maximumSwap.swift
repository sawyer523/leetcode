//
//  670.maximumSwap.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/13.
//

import Foundation

/*
 670. 最大交换
 难度
 中等

 282

 给定一个非负整数，你至多可以交换一次数字中的任意两位。返回你能得到的最大值。

 示例 1 :

 输入: 2736
 输出: 7236
 解释: 交换数字2和数字7。
 示例 2 :

 输入: 9973
 输出: 9973
 解释: 不需要交换。
 注意:

 给定数字的范围是 [0, 108]
 */

func maximumSwap(_ num: Int) -> Int {
    var s = Array(String(num))
    let n = s.count
    var maxIDx = n - 1
    var idx1 = -1
    var idx2 = -1
    for i in stride(from: n - 1, through: 0, by: -1) {
        if s[maxIDx] < s[i] {
            maxIDx = i
        } else if s[i] < s[maxIDx] {
            (idx1, idx2) = (i, maxIDx)
        }
    }

    if idx1 < 0 {
        return num
    }
    s.swapAt(idx1, idx2)
    return Int(String(s)) ?? 0
}
