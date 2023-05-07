//
//  1000.mergeStones.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/4.
//

import Foundation

/*
 1000. 合并石头的最低成本
 有 N 堆石头排成一排，第 i 堆中有 stones[i] 块石头。

 每次移动（move）需要将连续的 K 堆石头合并为一堆，而这个移动的成本为这 K 堆石头的总数。

 找出把所有石头合并成一堆的最低成本。如果不可能，返回 -1 。

 示例 1：

 输入：stones = [3,2,4,1], K = 2
 输出：20
 解释：
 从 [3, 2, 4, 1] 开始。
 合并 [3, 2]，成本为 5，剩下 [5, 4, 1]。
 合并 [4, 1]，成本为 5，剩下 [5, 5]。
 合并 [5, 5]，成本为 10，剩下 [10]。
 总成本 20，这是可能的最小值。
 示例 2：

 输入：stones = [3,2,4,1], K = 3
 输出：-1
 解释：任何合并操作后，都会剩下 2 堆，我们无法再进行合并。所以这项任务是不可能完成的。.
 示例 3：

 输入：stones = [3,5,1,2,6], K = 3
 输出：25
 解释：
 从 [3, 5, 1, 2, 6] 开始。
 合并 [5, 1, 2]，成本为 8，剩下 [3, 8, 6]。
 合并 [3, 8, 6]，成本为 17，剩下 [17]。
 总成本 25，这是可能的最小值。

 提示：

 1 <= stones.length <= 30
 2 <= K <= 30
 1 <= stones[i] <= 100
 */

func mergeStones(_ stones: [Int], _ k: Int) -> Int {
    let n = stones.count
    if (n - 1) % (k - 1) != 0 {
        return -1
    }

    var dp = [[Int]](repeating: [Int](repeating: Int(1e9), count: n), count: n)
    var sum = [Int](repeating: 0, count: n + 1)
    var s = 0
    for i in 0 ..< n {
        dp[i][i] = 0
        s += stones[i]
        sum[i + 1] = s
    }

    for len in 2 ... n {
        for l in 0 ..< n where l + len - 1 < n {
            let r = l + len - 1
            for p in stride(from: l, to: r, by: k - 1) {
                dp[l][r] = min(dp[l][r], dp[l][p] + dp[p + 1][r])
            }

            if (r - l) % (k - 1) == 0 {
                dp[l][r] += sum[r + 1] - sum[l]
            }
        }
    }

    return dp[0][n - 1]
}
