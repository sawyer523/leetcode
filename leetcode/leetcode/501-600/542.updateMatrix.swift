//
//  542.updateMatrix.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/7.
//

import Foundation

/*
 542. 01 矩阵
 难度
 中等
 
 418
 
 
 
 
 
 给定一个由 0 和 1 组成的矩阵，找出每个元素到最近的 0 的距离。
 
 两个相邻元素间的距离为 1 。
 
 
 
 示例 1：
 
 输入：
 [[0,0,0],
 [0,1,0],
 [0,0,0]]
 
 输出：
 [[0,0,0],
 [0,1,0],
 [0,0,0]]
 示例 2：
 
 输入：
 [[0,0,0],
 [0,1,0],
 [1,1,1]]
 
 输出：
 [[0,0,0],
 [0,1,0],
 [1,2,1]]
 
 
 提示：
 
 给定矩阵的元素个数不超过 10000。
 给定矩阵中至少有一个元素是 0。
 矩阵中的元素只在四个方向上相邻: 上、下、左、右。
 */

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    let m = mat.count
    let n = mat[0].count
    
    var dp = [[Int]](repeating: [Int](repeating: Int.max/2, count: n), count: m)
    
    for i in 0..<m {
        for j in 0..<n {
            if mat[i][j] == 0 {
                dp[i][j] = 0
            }
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if 0 <= i-1 {
                dp[i][j] = min(dp[i][j], dp[i-1][j] + 1)
            }
            
            if 0 <= j-1 {
                dp[i][j] = min(dp[i][j], dp[i][j-1] + 1)
            }
        }
    }
    
    for i in stride(from: m-1, through: 0, by: -1) {
        for j in stride(from: n-1, through: 0, by: -1) {
            if i + 1 < m {
                dp[i][j] = min(dp[i][j], dp[i+1][j] + 1)
            }
            if j + 1 < n {
                dp[i][j] = min(dp[i][j], dp[i][j+1] + 1)
            }
        }
    }
    
    return dp
}
