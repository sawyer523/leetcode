//
//  488.findMinStep.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/9.
//

import Foundation

/*
 488. 祖玛游戏
 难度
 困难

 119

 你正在参与祖玛游戏的一个变种。

 在这个祖玛游戏变体中，桌面上有 一排 彩球，每个球的颜色可能是：红色 'R'、黄色 'Y'、蓝色 'B'、绿色 'G' 或白色 'W' 。你的手中也有一些彩球。

 你的目标是 清空 桌面上所有的球。每一回合：

 从你手上的彩球中选出 任意一颗 ，然后将其插入桌面上那一排球中：两球之间或这一排球的任一端。
 接着，如果有出现 三个或者三个以上 且 颜色相同 的球相连的话，就把它们移除掉。
 如果这种移除操作同样导致出现三个或者三个以上且颜色相同的球相连，则可以继续移除这些球，直到不再满足移除条件。
 如果桌面上所有球都被移除，则认为你赢得本场游戏。
 重复这个过程，直到你赢了游戏或者手中没有更多的球。
 给你一个字符串 board ，表示桌面上最开始的那排球。另给你一个字符串 hand ，表示手里的彩球。请你按上述操作步骤移除掉桌上所有球，计算并返回所需的 最少 球数。如果不能移除桌上所有的球，返回 -1 。

 示例 1：

 输入：board = "WRRBBW", hand = "RB"
 输出：-1
 解释：无法移除桌面上的所有球。可以得到的最好局面是：
 - 插入一个 'R' ，使桌面变为 WRRRBBW 。WRRRBBW -> WBBW
 - 插入一个 'B' ，使桌面变为 WBBBW 。WBBBW -> WW
 桌面上还剩着球，没有其他球可以插入。
 示例 2：

 输入：board = "WWRRBBWW", hand = "WRBRW"
 输出：2
 解释：要想清空桌面上的球，可以按下述步骤：
 - 插入一个 'R' ，使桌面变为 WWRRRBBWW 。WWRRRBBWW -> WWBBWW
 - 插入一个 'B' ，使桌面变为 WWBBBWW 。WWBBBWW -> WWWW -> empty
 只需从手中出 2 个球就可以清空桌面。
 示例 3：

 输入：board = "G", hand = "GGGGG"
 输出：2
 解释：要想清空桌面上的球，可以按下述步骤：
 - 插入一个 'G' ，使桌面变为 GG 。
 - 插入一个 'G' ，使桌面变为 GGG 。GGG -> empty
 只需从手中出 2 个球就可以清空桌面。
 示例 4：

 输入：board = "RBYYBBRRB", hand = "YRBGB"
 输出：3
 解释：要想清空桌面上的球，可以按下述步骤：
 - 插入一个 'Y' ，使桌面变为 RBYYYBBRRB 。RBYYYBBRRB -> RBBBRRB -> RRRB -> B
 - 插入一个 'B' ，使桌面变为 BB 。
 - 插入一个 'B' ，使桌面变为 BBB 。BBB -> empty
 只需从手中出 3 个球就可以清空桌面。

 提示：

 1 <= board.length <= 16
 1 <= hand.length <= 5
 board 和 hand 由字符 'R'、'Y'、'B'、'G' 和 'W' 组成
 桌面上一开始的球中，不会有三个及三个以上颜色相同且连着的球

 */

func findMinStep(_ board: String, _ hand: String) -> Int {
    var dp: [String: Int] = [:]
    func clean(_ b: [Character]) -> [Character] {
        var st: [(Character, Int)] = []
        for c in b {
            while !st.isEmpty && c != st.last!.0 && st.last!.1 >= 3 {
                st.removeLast()
            }
            if st.isEmpty || c != st.last!.0 {
                st.append((c, 1))
            } else {
                var t = st.removeLast()
                t.1 += 1
                st.append(t)
            }
        }

        if !st.isEmpty && st.last!.1 >= 3 {
            st.removeLast()
        }

        var res: [Character] = []
        for i in st.indices {
            for _ in 0 ..< st[i].1 {
                res.append(st[i].0)
            }
        }
        return res
    }

    func dfs(_ board: [Character], _ hand: [Character]) -> Int {
        if board.isEmpty {
            return 0
        }

        if let d = dp[String(board) + " " + String(hand)] {
            return d
        }

        var res = 6
        for j in hand.indices {
            if j > 0 && hand[j] == hand[j - 1] {
                continue
            }

            for i in 0 ... board.count {
                if i > 0 && board[i - 1] == hand[j] {
                    continue
                }

                var choose = false

                if i < board.count && board[i] == hand[j] {
                    choose = true
                }

                if i > 0 && i < board.count && board[i - 1] == board[i] && board[i] != hand[j] {
                    choose = true
                }

                if choose {
                    var b = board
                    b.insert(hand[j], at: i)
                    let newBoard = clean(b)
                    var h = hand
                    h.remove(at: j)
                    res = min(res, dfs(newBoard, h) + 1)
                }
            }
        }
        dp[String(board) + " " + String(hand)] = res
        return res
    }

    let hand = Array(hand).sorted()
    let ans = dfs(Array(board), hand)
    return ans <= 5 ? ans : -1
}
