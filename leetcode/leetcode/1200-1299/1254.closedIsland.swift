//
//  1254.closedIsland.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/18.
//

import Foundation

/*
 1254. 统计封闭岛屿的数目
 二维矩阵 grid 由 0 （土地）和 1 （水）组成。岛是由最大的4个方向连通的 0 组成的群，封闭岛是一个 完全 由1包围（左、上、右、下）的岛。

 请返回 封闭岛屿 的数目。

 示例 1：

 输入：grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
 输出：2
 解释：
 灰色区域的岛屿是封闭岛屿，因为这座岛屿完全被水域包围（即被 1 区域包围）。
 示例 2：

 输入：grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
 输出：1
 示例 3：

 输入：grid = [[1,1,1,1,1,1,1],
              [1,0,0,0,0,0,1],
              [1,0,1,1,1,0,1],
              [1,0,1,0,1,0,1],
              [1,0,1,1,1,0,1],
              [1,0,0,0,0,0,1],
              [1,1,1,1,1,1,1]]
 输出：2

 提示：

 1 <= grid.length, grid[0].length <= 100
 0 <= grid[i][j] <=1
 */

func closedIsland(_ grid: [[Int]]) -> Int {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    let m = grid.count
    let n = grid[0].count
    var ans = 0
    var grid = grid
    for i in 0 ..< m {
        for j in 0 ..< n {
            if grid[i][j] == 0 {
                var qu = [(i, j)]
                grid[i][j] = 1
                var closed = true

                while !qu.isEmpty {
                    let cx = qu[0].0
                    let cy = qu[0].1
                    qu.removeFirst()
                    if cx == 0 ||
                        cy == 0 ||
                        cx == m - 1 ||
                        cy == n - 1 {
                        closed = false
                    }

                    for dir in dirs {
                        let nx = cx + dir.0
                        let ny = cy + dir.1
                        if 0 <= nx &&
                            nx < m &&
                            0 <= ny &&
                            ny < n &&
                            grid[nx][ny] == 0 {
                            grid[nx][ny] = 1
                            qu.append((nx, ny))
                        }
                    }
                }

                if closed {
                    ans += 1
                }
            }
        }
    }

    return ans
}
