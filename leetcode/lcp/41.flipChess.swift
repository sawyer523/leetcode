//
//  41.flipChess.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/21.
//

import Foundation

/*
 LCP 41. 黑白翻转棋
 在 n*m 大小的棋盘中，有黑白两种棋子，黑棋记作字母 "X", 白棋记作字母 "O"，空余位置记作 "."。当落下的棋子与其他相同颜色的棋子在行、列或对角线完全包围（中间不存在空白位置）另一种颜色的棋子，则可以翻转这些棋子的颜色。

 1.gif2.gif3.gif

 「力扣挑战赛」黑白翻转棋项目中，将提供给选手一个未形成可翻转棋子的棋盘残局，其状态记作 chessboard。若下一步可放置一枚黑棋，请问选手最多能翻转多少枚白棋。

 注意：

 若翻转白棋成黑棋后，棋盘上仍存在可以翻转的白棋，将可以 继续 翻转白棋
 输入数据保证初始棋盘状态无可以翻转的棋子且存在空余位置
 示例 1：

 输入：chessboard = ["....X.","....X.","XOOO..","......","......"]

 输出：3

 解释：
 可以选择下在 [2,4] 处，能够翻转白方三枚棋子。

 示例 2：

 输入：chessboard = [".X.",".O.","XO."]

 输出：2

 解释：
 可以选择下在 [2,2] 处，能够翻转白方两枚棋子。
 2126c1d21b1b9a9924c639d449cc6e65.gif

 示例 3：

 输入：chessboard = [".......",".......",".......","X......",".O.....","..O....","....OOX"]

 输出：4

 解释：
 可以选择下在 [6,3] 处，能够翻转白方四枚棋子。
 803f2f04098b6174397d6c696f54d709.gif

 提示：

 1 <= chessboard.length, chessboard[i].length <= 8
 chessboard[i] 仅包含 "."、"O" 和 "X"
 */

func flipChess(_ chessboard: [String]) -> Int {
    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
    let m = chessboard.count
    let n = chessboard[0].count
    var chessboard = chessboard.map { Array($0) }

    func judge(_ board: [[Character]], _ x: Int, _ y: Int, _ dx: Int, _ dy: Int) -> Bool {
        var x = x + dx
        var y = y + dy
        while 0 <= x &&
            x < m &&
            0 <= y &&
            y < n {
            if board[x][y] == "X" {
                return true
            } else if board[x][y] == "." {
                return false
            }
            x += dx
            y += dy
        }
        return false
    }

    func bfs(_ px: Int, _ py: Int) -> Int {
        var board = chessboard
        var cnt = 0
        var queue = [(px, py)]
        board[px][py] = "X"
        while !queue.isEmpty {
            var t = queue.removeFirst()
            for i in 0 ..< 8 {
                if judge(board, t.0, t.1, dirs[i].0, dirs[i].1) {
                    var x = t.0 + dirs[i].0
                    var y = t.1 + dirs[i].1
                    while board[x][y] != "X" {
                        queue.append((x, y))
                        board[x][y] = "X"
                        x += dirs[i].0
                        y += dirs[i].1
                        cnt += 1
                    }
                }
            }
        }
        return cnt
    }

    var res = 0
    for i in 0 ..< m {
        for j in 0 ..< n {
            if chessboard[i][j] == "." {
                res = max(res, bfs(i, j))
            }
        }
    }

    return res
}
