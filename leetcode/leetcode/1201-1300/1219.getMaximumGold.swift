//
//  1219.getMaximumGold.swift
//  1219.getMaximumGold
//
//  Created by Xiaonan Chen on 2021/8/19.
//

import Foundation

/*
 1219. 黄金矿工
 难度
 中等
 
 88
 
 
 
 
 
 你要开发一座金矿，地质勘测学家已经探明了这座金矿中的资源分布，并用大小为 m * n 的网格 grid 进行了标注。每个单元格中的整数就表示这一单元格中的黄金数量；如果该单元格是空的，那么就是 0。
 
 为了使收益最大化，矿工需要按以下规则来开采黄金：
 
 每当矿工进入一个单元，就会收集该单元格中的所有黄金。
 矿工每次可以从当前位置向上下左右四个方向走。
 每个单元格只能被开采（进入）一次。
 不得开采（进入）黄金数目为 0 的单元格。
 矿工可以从网格中 任意一个 有黄金的单元格出发或者是停止。
 
 
 示例 1：
 
 输入：grid = [[0,6,0],[5,8,7],[0,9,0]]
 输出：24
 解释：
 [[0,6,0],
 [5,8,7],
 [0,9,0]]
 一种收集最多黄金的路线是：9 -> 8 -> 7。
 示例 2：
 
 输入：grid = [[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]]
 输出：28
 解释：
 [[1,0,7],
 [2,0,6],
 [3,4,5],
 [0,3,0],
 [9,0,20]]
 一种收集最多黄金的路线是：1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7。
 
 
 提示：
 
 1 <= grid.length, grid[i].length <= 15
 0 <= grid[i][j] <= 100
 最多 25 个单元格中有黄金。

 */


func getMaximumGold(_ grid: [[Int]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    
    var grid = grid
    var ans = 0
    
    func backtrack(_ grid: inout [[Int]], _ row: Int, _ col: Int, _ sum: Int) {
        if row == -1 || col == -1 || row == m || col == n {
            return
        }
        let val = grid[row][col]
        if val != 0 {
            grid[row][col] = 0
            backtrack(&grid, row-1, col, sum + val)
            backtrack(&grid, row+1, col, sum + val)
            backtrack(&grid, row, col-1, sum + val)
            backtrack(&grid, row, col+1, sum + val)
            grid[row][col] = val
        } else {
            ans = max(ans, sum)
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            backtrack(&grid, i, j, 0)
        }
    }
    
    return ans
}
