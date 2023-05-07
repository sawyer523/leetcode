//
//  1301.pathsWithMaxScore.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/3.
//

import Foundation

/*
 1301. 最大得分的路径数目
 难度
 困难

 26

 给你一个正方形字符数组 board ，你从数组最右下方的字符 'S' 出发。

 你的目标是到达数组最左上角的字符 'E' ，数组剩余的部分为数字字符 1, 2, ..., 9 或者障碍 'X'。在每一步移动中，你可以向上、向左或者左上方移动，可以移动的前提是到达的格子没有障碍。

 一条路径的 「得分」 定义为：路径上所有数字的和。

 请你返回一个列表，包含两个整数：第一个整数是 「得分」 的最大值，第二个整数是得到最大得分的方案数，请把结果对 10^9 + 7 取余。

 如果没有任何路径可以到达终点，请返回 [0, 0] 。

 示例 1：

 输入：board = ["E23","2X2","12S"]
 输出：[7,1]
 示例 2：

 输入：board = ["E12","1X1","21S"]
 输出：[4,2]
 示例 3：

 输入：board = ["E11","XXX","11S"]
 输出：[0,0]

 提示：

 2 <= board.length == board[i].length <= 100

 */

func pathsWithMaxScore(_ board: [String]) -> [Int] {
    let count = board.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: count + 1), count: count + 1)
    var countDp = [[Int]](repeating: [Int](repeating: 0, count: count + 1), count: count + 1)
    countDp[count][count] = 1
    var tmp = 0
    let mod = 1_000_000_007

    for i in stride(from: count - 1, through: 0, by: -1) {
        for j in stride(from: count - 1, through: 0, by: -1) {
            if board[i][j] == "X" {
                continue
            }

            tmp = max(dp[i + 1][j], dp[i][j + 1], dp[i + 1][j + 1])
            dp[i][j] = (board[i][j].wholeNumberValue ?? 0) + tmp
            countDp[i][j] = dp[i][j + 1] == tmp ? countDp[i][j + 1] : 0
            countDp[i][j] = (countDp[i][j] + (dp[i + 1][j] == tmp ? countDp[i + 1][j] : 0)) % mod
            countDp[i][j] = (countDp[i][j] + (dp[i + 1][j + 1] == tmp ? countDp[i + 1][j + 1] : 0)) % mod
        }
    }

    let maxSum = dp[0][0]
    let maxPathCount = countDp[0][0]
    return [maxPathCount != 0 ? maxSum : 0, maxPathCount]
}
