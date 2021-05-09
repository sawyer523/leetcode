//
//  74.searchMatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/30.
//

import Foundation

/*
 74. 搜索二维矩阵
 难度
 中等

 362





 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。
  

 示例 1：


 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 输出：true
 示例 2：


 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 输出：false
  

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -10^4 <= matrix[i][j], target <= 10^4
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    let n = matrix[0].count
    var left = 0
    var right = m*n - 1
    while left <= right {
        let mid = (right - left) / 2 + left
        let x = matrix[mid/n][mid%n]
        if x == target {
            return true
        } else if x < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
}
