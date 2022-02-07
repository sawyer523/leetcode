//
//  1034.colorBorder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/7.
//

import Foundation
/*
 1034. 边界着色
 难度
 中等
 
 42
 
 
 
 
 
 给你一个大小为 m x n 的整数矩阵 grid ，表示一个网格。另给你三个整数 row、col 和 color 。网格中的每个值表示该位置处的网格块的颜色。
 
 当两个网格块的颜色相同，而且在四个方向中任意一个方向上相邻时，它们属于同一 连通分量 。
 
 连通分量的边界 是指连通分量中的所有与不在分量中的网格块相邻（四个方向上）的所有网格块，或者在网格的边界上（第一行/列或最后一行/列）的所有网格块。
 
 请你使用指定颜色 color 为所有包含网格块 grid[row][col] 的 连通分量的边界 进行着色，并返回最终的网格 grid 。
 
 
 
 示例 1：
 
 输入：grid = [[1,1],[1,2]], row = 0, col = 0, color = 3
 输出：[[3,3],[3,2]]
 示例 2：
 
 输入：grid = [[1,2,2],[2,3,2]], row = 0, col = 1, color = 3
 输出：[[1,3,3],[2,3,3]]
 示例 3：
 
 输入：grid = [[1,1,1],[1,1,1],[1,1,1]], row = 1, col = 1, color = 2
 输出：[[2,2,2],[2,1,2],[2,2,2]]
 
 
 提示：
 
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 1 <= grid[i][j], color <= 1000
 0 <= row < m
 0 <= col < n
 */

func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
    let directions = [[-1,0],[1,0],[0,1],[0,-1]], m = grid.count, n = grid[0].count, oriColor = grid[row][col]
    var visited = Array(repeating: Array(repeating: false, count: n), count: m), borders = Set<[Int]>(), grid = grid
    
    dfs(row, col)
    for bd in borders {
        grid[bd[0]][bd[1]] = color
    }
    
    func dfs(_ di: Int, _ dj: Int) {
        visited[di][dj] = true
        for d in directions {
            let i = di+d[0], j = dj+d[1]
            
            if i<0 || j<0 || i>=m || j>=n || grid[i][j] != oriColor {
                borders.insert([di,dj])
            } else if !visited[i][j] {
                dfs(i, j)
            }
        }
    }
    
    return grid
}
