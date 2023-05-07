//
//  757.intersectionSizeTwo.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/22.
//

import Foundation

/*
 757. 设置交集大小至少为2
 难度
 困难

 86

 一个整数区间 [a, b]  ( a < b ) 代表着从 a 到 b 的所有连续整数，包括 a 和 b。

 给你一组整数区间intervals，请找到一个最小的集合 S，使得 S 里的元素与区间intervals中的每一个整数区间都至少有2个元素相交。

 输出这个最小集合S的大小。

 示例 1:

 输入: intervals = [[1, 3], [1, 4], [2, 5], [3, 5]]
 输出: 3
 解释:
 考虑集合 S = {2, 3, 4}. S与intervals中的四个区间都有至少2个相交的元素。
 且这是S最小的情况，故我们输出3。
 示例 2:

 输入: intervals = [[1, 2], [2, 3], [2, 4], [4, 5]]
 输出: 5
 解释:
 最小的集合S = {1, 2, 3, 4, 5}.
 注意:

 intervals 的长度范围为[1, 3000]。
 intervals[i] 长度为 2，分别代表左、右边界。
 intervals[i][j] 的值是 [0, 10^8]范围内的整数。
 */

func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { a, b in
        a[0] < b[0] || a[0] == b[0] && b[1] < a[1]
    }

    let n = intervals.count
    let m = 2
    var vals = [[Int]](repeating: [], count: n)
    var ans = 0
    for i in stride(from: n - 1, through: 0, by: -1) {
        var j = intervals[i][0]
        if vals[i].count < m {
            for _ in vals[i].count ..< m {
                ans += 1
                for p in stride(from: i - 1, through: 0, by: -1) where j <= intervals[p][1] {
                    vals[p].append(j)
                }
                j += 1
            }
        }
    }
    return ans
}
