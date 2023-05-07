//
//  1815.maxHappyGroups.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/22.
//

import Foundation

/*
 1815. 得到新鲜甜甜圈的最多组数
 难度
 困难

 83

 有一个甜甜圈商店，每批次都烤 batchSize 个甜甜圈。这个店铺有个规则，就是在烤一批新的甜甜圈时，之前 所有 甜甜圈都必须已经全部销售完毕。给你一个整数 batchSize 和一个整数数组 groups ，数组中的每个整数都代表一批前来购买甜甜圈的顾客，其中 groups[i] 表示这一批顾客的人数。每一位顾客都恰好只要一个甜甜圈。

 当有一批顾客来到商店时，他们所有人都必须在下一批顾客来之前购买完甜甜圈。如果一批顾客中第一位顾客得到的甜甜圈不是上一组剩下的，那么这一组人都会很开心。

 你可以随意安排每批顾客到来的顺序。请你返回在此前提下，最多 有多少组人会感到开心。

 示例 1：

 输入：batchSize = 3, groups = [1,2,3,4,5,6]
 输出：4
 解释：你可以将这些批次的顾客顺序安排为 [6,2,4,5,1,3] 。那么第 1，2，4，6 组都会感到开心。
 示例 2：

 输入：batchSize = 4, groups = [1,3,2,5,2,2,1,6]
 输出：4

 提示：

 1 <= batchSize <= 9
 1 <= groups.length <= 30
 1 <= groups[i] <= 10^9
 */

func maxHappyGroups(_ batchSize: Int, _ groups: [Int]) -> Int {
    let kWidth = 5
    let kWidthMask = 1 << kWidth - 1

    var cnt = [Int](repeating: 0, count: batchSize)
    for group in groups {
        cnt[group % batchSize] += 1
    }

    var start = 0
    for i in stride(from: batchSize - 1, to: 0, by: -1) {
        start = start << kWidth | cnt[i]
    }

    var memo: [Int: Int] = [:]
    func dfs(_ mask: Int) -> Int {
        if mask == 0 {
            return 0
        }

        if let res = memo[mask] {
            return res
        }

        var total = 0
        for i in 1 ..< batchSize {
            total += i * (mask >> ((i - 1) * kWidth) & kWidthMask)
        }

        var best = 0
        for i in 1 ..< batchSize {
            let amount = mask >> ((i - 1) * kWidth) & kWidthMask
            if amount > 0 {
                var result = dfs(mask - 1 << ((i - 1) * kWidth))
                if (total - i) % batchSize == 0 {
                    result += 1
                }
                best = max(best, result)
            }
        }

        memo[mask] = best
        return best
    }

    return dfs(start) + cnt[0]
}
