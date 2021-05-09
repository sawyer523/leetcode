//
//  1473.minCost.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/4.
//

import Foundation

/*
 1473. 粉刷房子 III
 难度
 困难
 
 107
 
 
 
 
 
 在一个小城市里，有 m 个房子排成一排，你需要给每个房子涂上 n 种颜色之一（颜色编号为 1 到 n ）。有的房子去年夏天已经涂过颜色了，所以这些房子不需要被重新涂色。
 
 我们将连续相同颜色尽可能多的房子称为一个街区。（比方说 houses = [1,2,2,3,3,2,1,1] ，它包含 5 个街区  [{1}, {2,2}, {3,3}, {2}, {1,1}] 。）
 
 给你一个数组 houses ，一个 m * n 的矩阵 cost 和一个整数 target ，其中：
 
 houses[i]：是第 i 个房子的颜色，0 表示这个房子还没有被涂色。
 cost[i][j]：是将第 i 个房子涂成颜色 j+1 的花费。
 请你返回房子涂色方案的最小总花费，使得每个房子都被涂色后，恰好组成 target 个街区。如果没有可用的涂色方案，请返回 -1 。
 
 
 
 示例 1：
 
 输入：houses = [0,0,0,0,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
 输出：9
 解释：房子涂色方案为 [1,2,2,1,1]
 此方案包含 target = 3 个街区，分别是 [{1}, {2,2}, {1,1}]。
 涂色的总花费为 (1 + 1 + 1 + 1 + 5) = 9。
 示例 2：
 
 输入：houses = [0,2,1,2,0], cost = [[1,10],[10,1],[10,1],[1,10],[5,1]], m = 5, n = 2, target = 3
 输出：11
 解释：有的房子已经被涂色了，在此基础上涂色方案为 [2,2,1,2,2]
 此方案包含 target = 3 个街区，分别是 [{2,2}, {1}, {2,2}]。
 给第一个和最后一个房子涂色的花费为 (10 + 1) = 11。
 示例 3：
 
 输入：houses = [0,0,0,0,0], cost = [[1,10],[10,1],[1,10],[10,1],[1,10]], m = 5, n = 2, target = 5
 输出：5
 示例 4：
 
 输入：houses = [3,1,2,3], cost = [[1,1,1],[1,1,1],[1,1,1],[1,1,1]], m = 4, n = 3, target = 3
 输出：-1
 解释：房子已经被涂色并组成了 4 个街区，分别是 [{3},{1},{2},{3}] ，无法形成 target = 3 个街区。
 
 
 提示：
 
 m == houses.length == cost.length
 n == cost[i].length
 1 <= m <= 100
 1 <= n <= 20
 1 <= target <= m
 0 <= houses[i] <= n
 1 <= cost[i][j] <= 10^4

 */


func minCost(_ houses: [Int], _ cost: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
    let inf = Int.max / 2
    var houses = houses
    for i in 0..<houses.count {
        houses[i] -= 1
    }
    
    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: inf, count: target), count: n), count: m)
    var best = [[(Int, Int, Int)]](repeating: [(Int, Int, Int)](repeating: (inf, -1, inf), count: target), count: m)
    
    for i in 0..<m {
        for j in 0..<n {
            if houses[i] != -1 && houses[i] != j {
                continue
            }
            
            for k in 0..<target {
                if i == 0 {
                    if k == 0 {
                        dp[i][j][k] = 0
                    }
                } else {
                    dp[i][j][k] = dp[i-1][j][k]
                    if 0 < k {
                        let b = best[i-1][k-1]
                        dp[i][j][k] = min(dp[i][j][k], j == b.1 ? b.2 : b.0)
                    }
                }
                
                if dp[i][j][k] != inf && houses[i] == -1 {
                    dp[i][j][k] += cost[i][j]
                }
                
                var b = best[i][k]
                if dp[i][j][k] < b.0 {
                    (b.2, b.0, b.1) = (b.0, dp[i][j][k], j)
                } else if dp[i][j][k] < b.2 {
                    b.2 = dp[i][j][k]
                }
                best[i][k] = b
            }
        }
    }
    
    var ans = inf
    for res in dp[m-1] {
        ans = min(ans, res[target-1])
    }
    
    return ans == inf ? -1 : ans
}
