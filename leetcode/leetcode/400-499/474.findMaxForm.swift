//
//  474.findMaxForm.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/6.
//

import Foundation

/*
 474. 一和零
 难度
 中等

 437

 给你一个二进制字符串数组 strs 和两个整数 m 和 n 。

 请你找出并返回 strs 的最大子集的大小，该子集中 最多 有 m 个 0 和 n 个 1 。

 如果 x 的所有元素也是 y 的元素，集合 x 是集合 y 的 子集 。

 示例 1：

 输入：strs = ["10", "0001", "111001", "1", "0"], m = 5, n = 3
 输出：4
 解释：最多有 5 个 0 和 3 个 1 的最大子集是 {"10","0001","1","0"} ，因此答案是 4 。
 其他满足题意但较小的子集包括 {"0001","1"} 和 {"10","1","0"} 。{"111001"} 不满足题意，因为它含 4 个 1 ，大于 n 的值 3 。
 示例 2：

 输入：strs = ["10", "0", "1"], m = 1, n = 1
 输出：2
 解释：最大的子集是 {"0", "1"} ，所以答案是 2 。

 提示：

 1 <= strs.length <= 600
 1 <= strs[i].length <= 100
 strs[i] 仅由 '0' 和 '1' 组成
 1 <= m, n <= 100
 */

func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

    func getCounts(_ str: String) -> [String: Int] {
        var res: [String: Int] = [:]
        for c in str {
            res[String(c), default: 0] += 1
        }
        return res
    }

    for s in strs {
        let count = getCounts(s)
        let zeros = count["0"] ?? 0
        let ones = count["1"] ?? 0

        for j in stride(from: m, through: zeros, by: -1) {
            for k in stride(from: n, through: ones, by: -1) {
                dp[j][k] = max(dp[j][k], dp[j - zeros][k - ones] + 1)
            }
        }
    }
    return dp[m][n]
}
