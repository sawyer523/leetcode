//
//  1139.largest1BorderedSquare.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/2/17.
//

import Foundation

/*
 1139. 最大的以 1 为边界的正方形
 难度
 中等

 117

 给你一个由若干 0 和 1 组成的二维网格 grid，请你找出边界全部由 1 组成的最大 正方形 子网格，并返回该子网格中的元素数量。如果不存在，则返回 0。

 示例 1：

 输入：grid = [[1,1,1],[1,0,1],[1,1,1]]
 输出：9
 示例 2：

 输入：grid = [[1,1,0,0]]
 输出：1

 提示：

 1 <= grid.length <= 100
 1 <= grid[0].length <= 100
 grid[i][j] 为 0 或 1
 */

func largest1BorderedSquare(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var left = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    var up = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    var maxBorder = 0

    for i in 1 ... m {
        for j in 1 ... n {
            if grid[i - 1][j - 1] == 1 {
                left[i][j] = left[i][j - 1] + 1
                up[i][j] = up[i - 1][j] + 1
                var border = min(left[i][j], up[i][j])
                while left[i - border + 1][j] < border ||
                    up[i][j - border + 1] < border {
                    border -= 1
                }
                maxBorder = max(maxBorder, border)
            }
        }
    }
    return maxBorder * maxBorder
}
