//
//  59.generateMatrix.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 59. 螺旋矩阵 II
 难度
 中等

 279





 给定一个正整数 n，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。

 示例:

 输入: 3
 输出:
 [
  [ 1, 2, 3 ],
  [ 8, 9, 4 ],
  [ 7, 6, 5 ]
 ]
 
 提示：

 1 <= n <= 20
 */

func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var index = 1
    var left = 0, right = n - 1, top = 0, bottom = n - 1
    while left <= right && top <= bottom {
        for cloumn in left...right {
            matrix[top][cloumn] = index
            index += 1
        }
        if top + 1 <= bottom {
            for row in top+1...bottom {
                matrix[row][right] = index
                index += 1
            }
        }
        if left < right && top < bottom {
            if left+1 <= right-1 {
                for column in (left+1...right-1).reversed() {
                    matrix[bottom][column] = index
                    index += 1
                }
            }
            
            for row in (top+1...bottom).reversed() {
                matrix[row][left] = index
                index += 1
            }
        }
        left += 1
        right -= 1
        top += 1
        bottom -= 1
    }
    return matrix
}
