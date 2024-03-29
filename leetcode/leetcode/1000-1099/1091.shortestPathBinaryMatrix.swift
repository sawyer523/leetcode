//
//  1091.shortestPathBinaryMatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/26.
//

import Foundation

/*
 1091. 二进制矩阵中的最短路径
 给你一个 n x n 的二进制矩阵 grid 中，返回矩阵中最短 畅通路径 的长度。如果不存在这样的路径，返回 -1 。

 二进制矩阵中的 畅通路径 是一条从 左上角 单元格（即，(0, 0)）到 右下角 单元格（即，(n - 1, n - 1)）的路径，该路径同时满足下述要求：

 路径途经的所有单元格都的值都是 0 。
 路径中所有相邻的单元格应当在 8 个方向之一 上连通（即，相邻两单元之间彼此不同且共享一条边或者一个角）。
 畅通路径的长度 是该路径途经的单元格总数。

 示例 1：

 输入：grid = [[0,1],[1,0]]
 输出：2
 示例 2：

 输入：grid = [[0,0,0],[1,1,0],[1,1,0]]
 输出：4
 示例 3：

 输入：grid = [[1,0,0],[1,1,0],[1,1,0]]
 输出：-1

 提示：

 n == grid.length
 n == grid[i].length
 1 <= n <= 100
 grid[i][j] 为 0 或 1
 */

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    if grid[0][0] == 1 {
        return -1
    }

    let n = grid.count
    var dist = [[Int]](repeating: [Int](repeating: 0x3F3F_3F3F, count: n), count: n)

    var q = [(0, 0)]
    dist[0][0] = 1
    while !q.isEmpty {
        let x = q.first!.0
        let y = q.first!.1
        q.removeFirst()
        if x == n - 1 && y == n - 1 {
            return dist[x][y]
        }

        for dx in -1 ... 1 {
            for dy in -1 ... 1 {
                if x + dx < 0 ||
                    n <= x + dx ||
                    y + dy < 0 ||
                    n <= y + dy {
                    continue
                }

                if grid[x + dx][y + dy] == 1 ||
                    dist[x + dx][y + dy] <= dist[x][y] + 1 {
                    continue
                }

                dist[x + dx][y + dy] = dist[x][y] + 1
                q.append((x + dx, y + dy))
            }
        }
    }
    return -1
}
