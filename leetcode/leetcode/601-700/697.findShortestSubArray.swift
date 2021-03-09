//
//  697.findShortestSubArray.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/20.
//

import Foundation

/*
 697. 数组的度
 难度
 简单

 226





 给定一个非空且只包含非负数的整数数组 nums，数组的度的定义是指数组里任一元素出现频数的最大值。

 你的任务是在 nums 中找到与 nums 拥有相同大小的度的最短连续子数组，返回其长度。

  

 示例 1：

 输入：[1, 2, 2, 3, 1]
 输出：2
 解释：
 输入数组的度是2，因为元素1和2的出现频数最大，均为2.
 连续子数组里面拥有相同度的有如下所示:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 最短连续子数组[2, 2]的长度为2，所以返回2.
 示例 2：

 输入：[1,2,2,3,1,4,2]
 输出：6
  

 提示：

 nums.length 在1到 50,000 区间范围内。
 nums[i] 是一个在 0 到 49,999 范围内的整数。
 */

func findShortestSubArray(_ nums: [Int]) -> Int {
    var m = [Int: (Int, Int, Int)]()
    for (i, v) in nums.enumerated() {
        if var e = m[v] {
            e.0 += 1
            e.2 = i
            m[v] = e
        } else {
            m[v] = (1, i, i)
        }
    }
    
    var ans = 0
    var maxCnt = 0
    for (_, v) in m {
        if maxCnt < v.0 {
            (maxCnt, ans) = (v.0, v.2 - v.1 + 1)
        } else if maxCnt == v.0 {
            ans = min(ans, v.2-v.1+1)
        }
    }
    return ans
}
