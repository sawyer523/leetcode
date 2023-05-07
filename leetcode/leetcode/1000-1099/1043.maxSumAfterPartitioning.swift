//
//  1043.maxSumAfterPartitioning.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/19.
//

import Foundation

/*
 1043. 分隔数组以得到最大和
 给你一个整数数组 arr，请你将该数组分隔为长度 最多 为 k 的一些（连续）子数组。分隔完成后，每个子数组的中的所有值都会变为该子数组中的最大值。

 返回将数组分隔变换后能够得到的元素最大和。本题所用到的测试用例会确保答案是一个 32 位整数。

 示例 1：

 输入：arr = [1,15,7,9,2,5,10], k = 3
 输出：84
 解释：数组变为 [15,15,15,9,10,10,10]
 示例 2：

 输入：arr = [1,4,1,5,7,3,6,1,9,9,3], k = 4
 输出：83
 示例 3：

 输入：arr = [1], k = 1
 输出：1

 提示：

 1 <= arr.length <= 500
 0 <= arr[i] <= 10^9
 1 <= k <= arr.length

 */

func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
    let n = arr.count
    var dp = [Int](repeating: 0, count: n)
    for i in 1 ... k {
        dp[i - 1] = arr[0 ... i - 1].max()! * i
    }

    for i in k ..< n {
        for j in 1 ... k {
            dp[i] = max(dp[i], dp[i - j] + arr[i - j + 1 ... i].max()! * j)
        }
    }

    return dp.last!
}
