//
//  304.numMatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/2.
//

import Foundation

/*
 304. 二维区域和检索 - 矩阵不可变
 难度
 中等

 208

 收藏

 分享
 切换为英文
 接收动态
 反馈
 给定一个二维矩阵，计算其子矩形范围内元素的总和，该子矩阵的左上角为 (row1, col1) ，右下角为 (row2, col2) 。

 Range Sum Query 2D
 上图子矩阵左上角 (row1, col1) = (2, 1) ，右下角(row2, col2) = (4, 3)，该子矩形内元素的总和为 8。

 示例：

 给定 matrix = [
   [3, 0, 1, 4, 2],
   [5, 6, 3, 2, 1],
   [1, 2, 0, 1, 5],
   [4, 1, 0, 1, 7],
   [1, 0, 3, 0, 5]
 ]

 sumRegion(2, 1, 4, 3) -> 8
 sumRegion(1, 1, 2, 2) -> 11
 sumRegion(1, 2, 2, 4) -> 12

 提示：

 你可以假设矩阵不可变。
 会多次调用 sumRegion 方法。
 你可以假设 row1 ≤ row2 且 col1 ≤ col2 。
 */

class NumMatrix {
    private var sums: [[Int]]
    init(_ matrix: [[Int]]) {
        sums = [[Int]](repeating: [], count: matrix.count)
        for (i, row) in matrix.enumerated() {
            sums[i] = [Int](repeating: 0, count: row.count + 1)
            for (j, v) in row.enumerated() {
                sums[i][j + 1] = sums[i][j] + v
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = 0
        for i in row1 ... row2 {
            sum += sums[i][col2 + 1] - sums[i][col1]
        }
        return sum
    }
}
