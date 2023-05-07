//
//  934.shortestBridge.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/25.
//

import Foundation

/*
 934. 最短的桥
 难度
 中等

 292

 给你一个大小为 n x n 的二元矩阵 grid ，其中 1 表示陆地，0 表示水域。

 岛 是由四面相连的 1 形成的一个最大组，即不会与非组内的任何其他 1 相连。grid 中 恰好存在两座岛 。

 你可以将任意数量的 0 变为 1 ，以使两座岛连接起来，变成 一座岛 。

 返回必须翻转的 0 的最小数目。

 示例 1：

 输入：grid = [[0,1],[1,0]]
 输出：1
 示例 2：

 输入：grid = [[0,1,0],[0,0,0],[0,0,1]]
 输出：2
 示例 3：

 输入：grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
 输出：1

 提示：

 n == grid.length == grid[i].length
 2 <= n <= 100
 grid[i][j] 为 0 或 1
 grid 中恰有两个岛
 */

func shortestBridge(_ grid: [[Int]]) -> Int {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    let n = grid.count
    var grid = grid
    var step = 0
    for (i, row) in grid.enumerated() {
        for (j, v) in row.enumerated() {
            if v != 1 {
                continue
            }

            var island: [(Int, Int)] = []
            grid[i][j] = -1
            var q = [(i, j)]
            while !q.isEmpty {
                let p = q.removeFirst()
                island.append(p)
                for d in dirs {
                    let x = p.0 + d.0
                    let y = p.1 + d.1
                    if x >= 0 && x < n && y >= 0 && y < n && grid[x][y] == 1 {
                        grid[x][y] = -1
                        q.append((x, y))
                    }
                }
            }

            q = island
            while true {
                let tmp = q
                q = []
                for p in tmp {
                    for d in dirs {
                        let x = p.0 + d.0
                        let y = p.1 + d.1
                        if x >= 0 && x < n && y >= 0 && y < n {
                            if grid[x][y] == 1 {
                                return step
                            }
                            if grid[x][y] == 0 {
                                grid[x][y] = -1
                                q.append((x, y))
                            }
                        }
                    }
                }
                step += 1
            }
        }
    }
    return step
}
