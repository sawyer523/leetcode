//
//  1380.luckyNumbers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/15.
//

import Foundation

/*
 1380. 矩阵中的幸运数
 难度
 简单
 
 67
 
 
 
 
 
 给你一个 m * n 的矩阵，矩阵中的数字 各不相同 。请你按 任意 顺序返回矩阵中的所有幸运数。
 
 幸运数是指矩阵中满足同时下列两个条件的元素：
 
 在同一行的所有元素中最小
 在同一列的所有元素中最大
 
 
 示例 1：
 
 输入：matrix = [[3,7,8],[9,11,13],[15,16,17]]
 输出：[15]
 解释：15 是唯一的幸运数，因为它是其所在行中的最小值，也是所在列中的最大值。
 示例 2：
 
 输入：matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
 输出：[12]
 解释：12 是唯一的幸运数，因为它是其所在行中的最小值，也是所在列中的最大值。
 示例 3：
 
 输入：matrix = [[7,8],[1,2]]
 输出：[7]
 
 
 提示：
 
 m == mat.length
 n == mat[i].length
 1 <= n, m <= 50
 1 <= matrix[i][j] <= 10^5
 矩阵中的所有元素都是不同的
 */

func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix[0].count
    var minRow = [Int](repeating: 0, count: m)
    var maxCol = [Int](repeating: 0, count: n)
    for i in 0..<m{
        minRow[i] = matrix[i][0]
        for j in 0..<n {
            minRow[i] = min(minRow[i], matrix[i][j])
            maxCol[j] = max(maxCol[j], matrix[i][j])
        }
    }
    
    var ans: [Int] = []
    for i in 0..<m {
        for j in 0..<n {
            if matrix[i][j] == minRow[i] && maxCol[j] == matrix[i][j] {
                ans.append(matrix[i][j])
            }
        }
    }
    
    return ans
}
