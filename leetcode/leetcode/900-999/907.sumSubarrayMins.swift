//
//  907.sumSubarrayMins.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/28.
//

import Foundation

/*
 907. 子数组的最小值之和
 难度
 中等

 448

 给定一个整数数组 arr，找到 min(b) 的总和，其中 b 的范围为 arr 的每个（连续）子数组。

 由于答案可能很大，因此 返回答案模 10^9 + 7 。

 示例 1：

 输入：arr = [3,1,2,4]
 输出：17
 解释：
 子数组为 [3]，[1]，[2]，[4]，[3,1]，[1,2]，[2,4]，[3,1,2]，[1,2,4]，[3,1,2,4]。
 最小值为 3，1，2，4，1，1，2，1，1，1，和为 17。
 示例 2：

 输入：arr = [11,81,94,43,3]
 输出：444

 提示：

 1 <= arr.length <= 3 * 10^4
 1 <= arr[i] <= 3 * 10^4
 */

func sumSubarrayMins(_ arr: [Int]) -> Int {
    let mod = Int(1e9) + 7
    let n = arr.count
    var monoStack: [Int] = []
    var dp = [Int](repeating: 0, count: n)
    var ans = 0
    for i in 0 ..< n {
        while !monoStack.isEmpty && arr[i] < arr[monoStack.last!] {
            _ = monoStack.popLast()
        }
        var k = i + 1
        if !monoStack.isEmpty {
            k = i - monoStack.last!
        }

        dp[i] = k * arr[i]
        if !monoStack.isEmpty {
            dp[i] += dp[i - k]
        }

        ans = (ans + dp[i]) % mod
        monoStack.append(i)
    }
    return ans
}
