//
//  498.findDiagonalOrder.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/14.
//

import Foundation

/*
 498. 对角线遍历
 难度
 中等

 313





 给你一个大小为 m x n 的矩阵 mat ，请以对角线遍历的顺序，用一个数组返回这个矩阵中的所有元素。

  

 示例 1：


 输入：mat = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,4,7,5,3,6,8,9]
 示例 2：

 输入：mat = [[1,2],[3,4]]
 输出：[1,2,3,4]
  

 提示：

 m == mat.length
 n == mat[i].length
 1 <= m, n <= 10^4
 1 <= m * n <= 10^4
 -10^5 <= mat[i][j] <= 10^5
 */

func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
    let m = mat.count
    let n = mat[0].count
    var ans: [Int] = []
    
    for i in 0..<m+n-1 {
        if i & 1 == 1 {
            var x = max(i-n+1, 0)
            var y = min(i, n-1)
            while x < m &&
                    0 <= y {
                ans.append(mat[x][y])
                x += 1
                y -= 1
            }
        } else {
            var x = min(i, m-1)
            var y = max(i-m+1, 0)
            while 0 <= x &&
                    y < n {
                ans.append(mat[x][y])
                x -= 1
                y += 1
            }
        }
    }
    
    return ans
}
