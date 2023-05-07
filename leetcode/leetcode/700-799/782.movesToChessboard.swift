//
//  782.movesToChessboard.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/8/23.
//

import Foundation

/*
 782. 变为棋盘
 难度
 困难

 70

 一个 n x n 的二维网络 board 仅由 0 和 1 组成 。每次移动，你能任意交换两列或是两行的位置。

 返回 将这个矩阵变为  “棋盘”  所需的最小移动次数 。如果不存在可行的变换，输出 -1。

 “棋盘” 是指任意一格的上下左右四个方向的值均与本身不同的矩阵。

 示例 1:

 输入: board = [[0,1,1,0],[0,1,1,0],[1,0,0,1],[1,0,0,1]]
 输出: 2
 解释:一种可行的变换方式如下，从左到右：
 第一次移动交换了第一列和第二列。
 第二次移动交换了第二行和第三行。
 示例 2:

 输入: board = [[0, 1], [1, 0]]
 输出: 0
 解释: 注意左上角的格值为0时也是合法的棋盘，也是合法的棋盘.
 示例 3:

 输入: board = [[1, 0], [1, 0]]
 输出: -1
 解释: 任意的变换都不能使这个输入变为合法的棋盘。

 提示：

 n == board.length
 n == board[i].length
 2 <= n <= 30
 board[i][j] 将只包含 0或 1
 */

func movesToChessboard(_ board: [[Int]]) -> Int {
    func getMove(_ mask: UInt, _ count: Int, _ n: Int) -> Int {
        let ones = mask.nonzeroBitCount
        if n & 1 > 0 {
            if abs(n - 2 * ones) != 1 ||
                abs(n - 2 * count) != 1 {
                return -1
            }
            if ones == n >> 1 {
                return n / 2 - (mask & 0xAAAA_AAAA).nonzeroBitCount
            } else {
                return (n + 1) / 2 - (mask & 0x5555_5555).nonzeroBitCount
            }
        } else {
            if ones != n >> 1 ||
                count != n >> 1 {
                return -1
            }
            let count1 = n / 2 - (mask & 0xAAAA_AAAA).nonzeroBitCount
            let count2 = n / 2 - (mask & 0x5555_5555).nonzeroBitCount
            return min(count1, count2)
        }
    }

    let n = board.count
    var rowMask = 0
    var colMask = 0
    for i in 0 ..< n {
        rowMask |= board[0][i] << i
        colMask |= board[i][0] << i
    }

    let reverseRowMask = 1 << n - 1 ^ rowMask
    let reverseColMask = 1 << n - 1 ^ colMask
    var rowCnt = 0
    var colCnt = 0
    for i in 0 ..< n {
        var currRowMask = 0
        var currColMask = 0
        for j in 0 ..< n {
            currRowMask |= board[i][j] << j
            currColMask |= board[j][i] << j
        }

        if currRowMask != rowMask && currRowMask != reverseRowMask ||
            currColMask != colMask && currColMask != reverseColMask {
            return -1
        }
        if currRowMask == rowMask {
            rowCnt += 1
        }
        if currColMask == colMask {
            colCnt += 1
        }
    }

    let rowMoves = getMove(UInt(rowMask), rowCnt, n)
    let colMoves = getMove(UInt(colMask), colCnt, n)
    if rowMoves == -1 ||
        colMoves == -1 {
        return -1
    }
    return rowMoves + colMoves
}
