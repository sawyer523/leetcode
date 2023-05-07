//
//  79.exist.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/24.
//

import Foundation

/*
 79. 单词搜索
 给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

 示例 1：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 示例 2：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 输出：true
 示例 3：

 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 输出：false

 提示：

 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board 和 word 仅由大小写英文字母组成
 */

func exist2(_ board: [[Character]], _ word: String) -> Bool {
    let m = board.count
    let n = board[0].count
    var vis = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    let word = Array(word)
    let dirs = [(1, 0), (-1, 0), (0, -1), (0, 1)]

    func check(_ i: Int, _ j: Int, _ k: Int) -> Bool {
        if board[i][j] != word[k] {
            return false
        }

        if k == word.count - 1 {
            return true
        }

        vis[i][j] = true
        defer {
            vis[i][j] = false
        }

        for dir in dirs {
            let newI = dir.0 + i
            let newJ = dir.1 + j
            if 0 <= newI, newI < m,
               0 <= newJ, newJ < n,
               !vis[newI][newJ] {
                if check(newI, newJ, k + 1) {
                    return true
                }
            }
        }
        return false
    }

    for i in 0 ..< m {
        for j in 0 ..< n {
            if check(i, j, 0) {
                return true
            }
        }
    }

    return false
}
