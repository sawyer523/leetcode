//
//  63.uniquePathsWithObstacles.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/27.
//

import Foundation

/*
63. 不同路径 II
难度
中等

464




 https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/22/robot_maze.png
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？



网格中的障碍物和空位置分别用 1 和 0 来表示。

 

示例 1：
 https://assets.leetcode.com/uploads/2020/11/04/robot1.jpg

输入：obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
输出：2
解释：
3x3 网格的正中间有一个障碍物。
从左上角到右下角一共有 2 条不同的路径：
1. 向右 -> 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右 -> 向右
示例 2：
 https://assets.leetcode.com/uploads/2020/11/04/robot2.jpg

输入：obstacleGrid = [[0,1],[0,0]]
输出：1
 

提示：

m == obstacleGrid.length
n == obstacleGrid[i].length
1 <= m, n <= 100
obstacleGrid[i][j] 为 0 或 1
*/

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    if obstacleGrid[0][0] == 1 {
        return 0
    }

    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    var dp = [Int](repeating: 0, count: n)
    dp[0] = 1
    for i in 0..<m {
        for j in 0..<n {
            if obstacleGrid[i][j] == 1 {
                dp[j] = 0
                continue
            }
            if 0<=j-1 && obstacleGrid[i][j-1] == 0 {
                dp[j] += dp[j-1]
            }
        }
    }

    return dp[n-1]
}
