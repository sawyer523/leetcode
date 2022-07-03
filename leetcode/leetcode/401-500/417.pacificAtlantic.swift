//
//  417.pacificAtlantic.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/27.
//

import Foundation

/*
 417. 太平洋大西洋水流问题
 难度
 中等

 379





 有一个 m × n 的矩形岛屿，与 太平洋 和 大西洋 相邻。 “太平洋” 处于大陆的左边界和上边界，而 “大西洋” 处于大陆的右边界和下边界。

 这个岛被分割成一个由若干方形单元格组成的网格。给定一个 m x n 的整数矩阵 heights ， heights[r][c] 表示坐标 (r, c) 上单元格 高于海平面的高度 。

 岛上雨水较多，如果相邻单元格的高度 小于或等于 当前单元格的高度，雨水可以直接向北、南、东、西流向相邻单元格。水可以从海洋附近的任何单元格流入海洋。

 返回 网格坐标 result 的 2D列表 ，其中 result[i] = [ri, ci] 表示雨水可以从单元格 (ri, ci) 流向 太平洋和大西洋 。

  

 示例 1：



 输入: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
 输出: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
 示例 2：

 输入: heights = [[2,1],[1,2]]
 输出: [[0,0],[0,1],[1,0],[1,1]]
  

 提示：

 m == heights.length
 n == heights[r].length
 1 <= m, n <= 200
 0 <= heights[r][c] <= 10^5
 */

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    let m = heights.count
    let n = heights[0].count
    var pacific = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    var atlantic = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    
    func dfs(_ x: Int, _ y: Int, _ ocean: inout [[Bool]]) {
        if ocean[x][y] {
            return
        }
        
        ocean[x][y] = true
        for dir in dirs {
            let nx = x + dir.0
            let ny = y + dir.1
            if 0 <= nx &&
                nx < m &&
                0 <= ny &&
                ny < n &&
                heights[x][y] <= heights[nx][ny] {
                dfs(nx, ny, &ocean)
            }
        }
    }
    
    for i in 0..<m {
        dfs(i, 0, &pacific)
    }
    
    for i in 1..<n {
        dfs(0, i, &pacific)
    }
    
    for i in 0..<m {
        dfs(i, n-1, &atlantic)
    }
    
    for j in 0..<n-1 {
        dfs(m-1, j, &atlantic)
    }
    
    var ans: [[Int]] = []
    for i in pacific.indices {
        for j in pacific[i].indices {
            if pacific[i][j] && atlantic[i][j] {
                ans.append([i, j])
            }
        }
    }
    
    return ans
}
