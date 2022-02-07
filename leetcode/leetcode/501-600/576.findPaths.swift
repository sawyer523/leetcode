//
//  576.findPaths.swift
//  576.findPaths
//
//  Created by Xiaonan Chen on 2021/8/15.
//

import Foundation

/*
 576. 出界的路径数
 难度
 中等
 
 150
 
 
 
 
 
 给你一个大小为 m x n 的网格和一个球。球的起始坐标为 [startRow, startColumn] 。你可以将球移到在四个方向上相邻的单元格内（可以穿过网格边界到达网格之外）。你 最多 可以移动 maxMove 次球。
 
 给你五个整数 m、n、maxMove、startRow 以及 startColumn ，找出并返回可以将球移出边界的路径数量。因为答案可能非常大，返回对 109 + 7 取余 后的结果。
 
 
 
 示例 1：
 
 
 输入：m = 2, n = 2, maxMove = 2, startRow = 0, startColumn = 0
 输出：6
 示例 2：
 
 
 输入：m = 1, n = 3, maxMove = 3, startRow = 0, startColumn = 1
 输出：12
 
 
 提示：
 
 1 <= m, n <= 50
 0 <= maxMove <= 50
 0 <= startRow < m
 0 <= startColumn < n
 */

func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
    let dirs = [(-1, 0), (1, 0), (0, 1), (0, -1)]
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    let mod = Int(1e9 + 7)
    dp[startRow][startColumn] = 1
    var ans = 0
    
    for _ in 0..<maxMove {
        var dpS = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for j in 0..<m {
            for k in 0..<n {
                let count = dp[j][k]
                if 0 < count {
                    for dir in dirs {
                        let j1 = dir.0 + j
                        let k1 = dir.1 + k
                        if 0 <= j1 && j1 < m && 0 <= k1 && k1 < n {
                            dpS[j1][k1] = (dpS[j1][k1] + count) % mod
                        } else {
                            ans = (ans + count) % mod
                        }
                    }
                }
            }
        }
        dp = dpS
    }
    
    return ans
}
