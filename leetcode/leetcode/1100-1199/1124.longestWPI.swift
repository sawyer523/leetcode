//
//  1124.longestWPI.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/2/14.
//

import Foundation

/*
 1124. 表现良好的最长时间段
 难度
 中等

 271

 给你一份工作时间表 hours，上面记录着某一位员工每天的工作小时数。

 我们认为当员工一天中的工作小时数大于 8 小时的时候，那么这一天就是「劳累的一天」。

 所谓「表现良好的时间段」，意味在这段时间内，「劳累的天数」是严格 大于「不劳累的天数」。

 请你返回「表现良好时间段」的最大长度。

 示例 1：

 输入：hours = [9,9,6,0,6,6,9]
 输出：3
 解释：最长的表现良好时间段是 [9,9,6]。
 示例 2：

 输入：hours = [6,6,6]
 输出：0

 提示：

 1 <= hours.length <= 10^4
 0 <= hours[i] <= 16
 */

func longestWPI(_ hours: [Int]) -> Int {
    var res = 0
    var m: [Int: Int] = [:]
    var s = 0
    for i in 0 ..< hours.count {
        s += 8 < hours[i] ? 1 : -1
        if s > 0 {
            res = max(res, i + 1)
        } else if let v = m[s - 1] {
            res = max(res, i - v)
        }

        if m[s] == nil {
            m[s] = i
        }
    }

    return res
}
