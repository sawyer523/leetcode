//
//  643.findMaxAverage.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/4.
//

import Foundation

/*
 643. 子数组最大平均数 I
 难度
 简单

 160





 给定 n 个整数，找出平均数最大且长度为 k 的连续子数组，并输出该最大平均数。

  

 示例：

 输入：[1,12,-5,-6,50,3], k = 4
 输出：12.75
 解释：最大平均数 (12-5-6+50)/4 = 51/4 = 12.75
  

 提示：

 1 <= k <= n <= 30,000。
 所给数据范围 [-10,000，10,000]。
 */

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var sum = 0
    var pre = Int.min
    for (i, v) in nums.enumerated() {
        if i < k {
            sum += v
            pre = sum
        } else {
            sum = sum - nums[i-k] + v
            pre = max(sum, pre)
        }
    }

    return Double(pre)/Double(k)
}
