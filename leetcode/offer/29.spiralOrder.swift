//
//  29.spiralOrder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/4.
//

import Foundation

/*
 剑指 Offer 29. 顺时针打印矩阵
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]

 限制：

 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 */

func spiralOrder2(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty {
        return []
    }

    let (rows, columns) = (matrix.count, matrix[0].count)
    var order = [Int](repeating: 0, count: rows * columns)
    var index = 0
    var (left, right, top, bottom) = (0, columns - 1, 0, rows - 1)

    while left <= right, top <= bottom {
        for column in left ... right {
            order[index] = matrix[top][column]
            index += 1
        }
        if top + 1 <= bottom {
            for row in top + 1 ... bottom {
                order[index] = matrix[row][right]
                index += 1
            }
        }
        if left < right, top < bottom {
            if left + 1 <= right - 1 {
                for column in (left + 1 ... right - 1).reversed() {
                    order[index] = matrix[bottom][column]
                    index += 1
                }
            }
            for row in (top + 1 ... bottom).reversed() {
                order[index] = matrix[row][left]
                index += 1
            }
        }
        left += 1
        right -= 1
        top += 1
        bottom -= 1
    }
    return order
}
