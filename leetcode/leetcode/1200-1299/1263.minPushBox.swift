//
//  1263.minPushBox.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/8.
//

import Foundation

/*
  1263. 推箱子
 「推箱子」是一款风靡全球的益智小游戏，玩家需要将箱子推到仓库中的目标位置。

 游戏地图用大小为 m x n 的网格 grid 表示，其中每个元素可以是墙、地板或者是箱子。

 现在你将作为玩家参与游戏，按规则将箱子 'B' 移动到目标位置 'T' ：

 玩家用字符 'S' 表示，只要他在地板上，就可以在网格中向上、下、左、右四个方向移动。
 地板用字符 '.' 表示，意味着可以自由行走。
 墙用字符 '#' 表示，意味着障碍物，不能通行。
 箱子仅有一个，用字符 'B' 表示。相应地，网格上有一个目标位置 'T'。
 玩家需要站在箱子旁边，然后沿着箱子的方向进行移动，此时箱子会被移动到相邻的地板单元格。记作一次「推动」。
 玩家无法越过箱子。
 返回将箱子推到目标位置的最小 推动 次数，如果无法做到，请返回 -1。

 示例 1：

 输入：grid = [["#","#","#","#","#","#"],
              ["#","T","#","#","#","#"],
              ["#",".",".","B",".","#"],
              ["#",".","#","#",".","#"],
              ["#",".",".",".","S","#"],
              ["#","#","#","#","#","#"]]
 输出：3
 解释：我们只需要返回推箱子的次数。
 示例 2：

 输入：grid = [["#","#","#","#","#","#"],
              ["#","T","#","#","#","#"],
              ["#",".",".","B",".","#"],
              ["#","#","#","#",".","#"],
              ["#",".",".",".","S","#"],
              ["#","#","#","#","#","#"]]
 输出：-1
 示例 3：

 输入：grid = [["#","#","#","#","#","#"],
              ["#","T",".",".","#","#"],
              ["#",".","#","B",".","#"],
              ["#",".",".",".",".","#"],
              ["#",".",".",".","S","#"],
              ["#","#","#","#","#","#"]]
 输出：5
 解释：向下、向左、向左、向上再向上。

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 20
 grid 仅包含字符 '.', '#',  'S' , 'T', 以及 'B'。
 grid 中 'S', 'B' 和 'T' 各只能出现一个。
  */

func minPushBox(_ grid: [[Character]]) -> Int {
    let m = grid.count
    let n = grid[0].count
    var sx = 0
    var sy = 0
    var bx = 0
    var by = 0

    for x in 0 ..< m {
        for y in 0 ..< n {
            if grid[x][y] == "S" {
                sx = x
                sy = y
            } else if grid[x][y] == "B" {
                bx = x
                by = y
            }
        }
    }

    func ok(_ x: Int, _ y: Int) -> Bool {
        return 0 <= x && x < m && 0 <= y && y < n && grid[x][y] != "#"
    }

    let d = [0, -1, 0, 1, 0]

    var dp = [[Int]](repeating: [Int](repeating: 0x3F3F_3F3F, count: m * n), count: m * n)
    dp[sx * n + sy][bx * n + by] = 0
    var q = [[sx * n + sy, bx * n + by]]
    while !q.isEmpty {
        var q1: [[Int]] = []
        var i = 0
        while i < q.count {
            let s1 = q[i][0]
            let b1 = q[i][1]
            defer {
                i += 1
            }
            let sx1 = s1 / n
            let sy1 = s1 % n
            let bx1 = b1 / n
            let by1 = b1 % n
            if grid[bx1][by1] == "T" {
                return dp[s1][b1]
            }

            for i in 0 ..< 4 {
                let sx2 = sx1 + d[i]
                let sy2 = sy1 + d[i + 1]
                let s2 = sx2 * n + sy2
                if !ok(sx2, sy2) {
                    continue
                }

                if bx1 == sx2 && by1 == sy2 {
                    let bx2 = bx1 + d[i]
                    let by2 = by1 + d[i + 1]
                    let b2 = bx2 * n + by2
                    if !ok(bx2, by2) || dp[s2][b2] <= dp[s1][b1] + 1 {
                        continue
                    }
                    dp[s2][b2] = dp[s1][b1] + 1
                    q1.append([s2, b2])
                } else {
                    if dp[s2][b1] <= dp[s1][b1] {
                        continue
                    }
                    dp[s2][b1] = dp[s1][b1]
                    q.append([s2, b1])
                }
            }
        }
        q = q1
    }
    return -1
}
