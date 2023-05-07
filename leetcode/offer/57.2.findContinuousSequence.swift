//
//  57.2.findContinuousSequence.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/3.
//

import Foundation

/*
 剑指 Offer 57 - II. 和为s的连续正数序列
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：

 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]

 限制：

 1 <= target <= 10^5
 */

func findContinuousSequence(_ target: Int) -> [[Int]] {
    var ans: [[Int]] = []
    var l = 1
    var r = 2
    while l < r {
        let sum = (l + r) * (r - l + 1) / 2
        if sum == target {
            var res: [Int] = []
            for i in l ... r {
                res.append(i)
            }
            ans.append(res)
            l += 1
        } else if sum < target {
            r += 1
        } else {
            l += 1
        }
    }
    return ans
}
