//
//  2319.checkXMatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/31.
//

import Foundation

/*
 2319. 判断矩阵是否是一个 X 矩阵
 难度
 简单

 17

 如果一个正方形矩阵满足下述 全部 条件，则称之为一个 X 矩阵 ：

 矩阵对角线上的所有元素都 不是 0
 矩阵中所有其他元素都是 0
 给你一个大小为 n x n 的二维整数数组 grid ，表示一个正方形矩阵。如果 grid 是一个 X 矩阵 ，返回 true ；否则，返回 false 。

 示例 1：

 输入：grid = [[2,0,0,1],[0,3,1,0],[0,5,2,0],[4,0,0,2]]
 输出：true
 解释：矩阵如上图所示。
 X 矩阵应该满足：绿色元素（对角线上）都不是 0 ，红色元素都是 0 。
 因此，grid 是一个 X 矩阵。
 示例 2：

 输入：grid = [[5,7,0],[0,3,1],[0,5,0]]
 输出：false
 解释：矩阵如上图所示。
 X 矩阵应该满足：绿色元素（对角线上）都不是 0 ，红色元素都是 0 。
 因此，grid 不是一个 X 矩阵。

 提示：

 n == grid.length == grid[i].length
 3 <= n <= 100
 0 <= grid[i][j] <= 10^5
 */

func checkXMatrix(_ grid: [[Int]]) -> Bool {
    for (i, row) in grid.enumerated() {
        for (j, x) in row.enumerated() {
            if i == j || (i + j) == grid.count - 1 {
                if x == 0 {
                    return false
                }
            } else if x != 0 {
                return false
            }
        }
    }
    return true
}