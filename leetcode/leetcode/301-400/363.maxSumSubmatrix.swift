//
//  363.maxSumSubmatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/22.
//

import Foundation

/*
 363. 矩形区域不超过 K 的最大数值和
 难度
 困难

 195





 给你一个 m x n 的矩阵 matrix 和一个整数 k ，找出并返回矩阵内部矩形区域的不超过 k 的最大数值和。

 题目数据保证总会存在一个数值和不超过 k 的矩形区域。

  

 示例 1：


 输入：matrix = [[1,0,1],[0,-2,3]], k = 2
 输出：2
 解释：蓝色边框圈出来的矩形区域 [[0, 1], [-2, 3]] 的数值和是 2，且 2 是不超过 k 的最大数字（k = 2）。
 示例 2：

 输入：matrix = [[2,2,-1]], k = 3
 输出：3
  

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -100 <= matrix[i][j] <= 100
 -105 <= k <= 105
  

 进阶：如果行数远大于列数，该如何设计解决方案？
 */

func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
    func countSubarraysSmallerThenK(_ arr: [Int], _ k: Int) -> Int {
        var res = Int.min
        
        for i in 0..<arr.count {
            var sum = 0
            for j in i..<arr.count {
                sum += arr[j]
                if sum > res && sum <= k {
                    res = sum
                }
            }
        }
        
        return res
    }
    var res = Int.min
    let m = matrix.count
    let n = matrix[0].count
    
    
    for left in 0..<n {
        var rowsSum = [Int](repeating: 0, count: m)
        for right in left..<n {
            for row in 0..<m {
                rowsSum[row] += matrix[row][right]
            }
            res = max(countSubarraysSmallerThenK(rowsSum, k), res)
        }
    }
    
    return res
}
