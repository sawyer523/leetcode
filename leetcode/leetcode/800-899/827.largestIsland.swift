//
//  827.largestIsland.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/18.
//

import Foundation

/*
 827. 最大人工岛
 难度
 困难

 272

 给你一个大小为 n x n 二进制矩阵 grid 。最多 只能将一格 0 变成 1 。

 返回执行此操作后，grid 中最大的岛屿面积是多少？

 岛屿 由一组上、下、左、右四个方向相连的 1 形成。

 示例 1:

 输入: grid = [[1, 0], [0, 1]]
 输出: 3
 解释: 将一格0变成1，最终连通两个小岛得到面积为 3 的岛屿。
 示例 2:

 输入: grid = [[1, 1], [1, 0]]
 输出: 4
 解释: 将一格0变成1，岛屿的面积扩大为 4。
 示例 3:

 输入: grid = [[1, 1], [1, 1]]
 输出: 4
 解释: 没有0可以让我们变成1，面积依然为 4。

 提示：

 n == grid.length
 n == grid[i].length
 1 <= n <= 500
 grid[i][j] 为 0 或 1
 */

func largestIsland(_ grid: [[Int]]) -> Int {
    let dir4 = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    let n = grid.count
    var t = 0
    var tag = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var area: [Int: Int] = [:]

    func dfs(_ i: Int, _ j: Int) {
        tag[i][j] = t
        area[t, default: 0] += 1
        for d in dir4 {
            let x = i + d.0
            let y = j + d.1
            if x >= 0 &&
                x < n &&
                y >= 0 &&
                y < n &&
                grid[x][y] > 0 &&
                tag[x][y] == 0 {
                dfs(x, y)
            }
        }
    }

    var ans = 0
    for (i, row) in grid.enumerated() {
        for (j, x) in row.enumerated() {
            if x > 0 &&
                tag[i][j] == 0 {
                t = i * n + j + 1
                dfs(i, j)
                ans = max(ans, area[t, default: 0])
            }
        }
    }

    for (i, row) in grid.enumerated() {
        for (j, x) in row.enumerated() {
            if x == 0 {
                var newArea = 1
                var conn = [0: true]
                for d in dir4 {
                    let x = i + d.0
                    let y = j + d.1
                    if x >= 0 &&
                        x < n &&
                        y >= 0 &&
                        y < n &&
                        !conn[tag[x][y], default: false] {
                        newArea += area[tag[x][y], default: 0]
                        conn[tag[x][y]] = true
                    }
                }
                ans = max(ans, newArea)
            }
        }
    }
    return ans
}
