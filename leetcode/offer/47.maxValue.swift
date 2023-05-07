//
//  47.maxValue.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/8.
//

import Foundation

/*
 剑指 Offer 47. 礼物的最大价值
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物

 提示：

 0 < grid.length <= 200
 0 < grid[0].length <= 200
 */

func maxValue(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)

    for i in 0 ..< m {
        let pos = i % 2
        for j in 0 ..< n {
            dp[pos][j] = 0
            if 0 < i {
                dp[pos][j] = max(dp[pos][j], dp[1 - pos][j])
            }
            if 0 < j {
                dp[pos][j] = max(dp[pos][j], dp[pos][j - 1])
            }
            dp[pos][j] += grid[i][j]
        }
    }

    return dp[(m - 1) % 2][n - 1]
}
