//
//  913.catMouseGame.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/4.
//

import Foundation

/*
 913. 猫和老鼠
 难度
 困难

 122

 两位玩家分别扮演猫和老鼠，在一张 无向 图上进行游戏，两人轮流行动。

 图的形式是：graph[a] 是一个列表，由满足 ab 是图中的一条边的所有节点 b 组成。

 老鼠从节点 1 开始，第一个出发；猫从节点 2 开始，第二个出发。在节点 0 处有一个洞。

 在每个玩家的行动中，他们 必须 沿着图中与所在当前位置连通的一条边移动。例如，如果老鼠在节点 1 ，那么它必须移动到 graph[1] 中的任一节点。

 此外，猫无法移动到洞中（节点 0）。

 然后，游戏在出现以下三种情形之一时结束：

 如果猫和老鼠出现在同一个节点，猫获胜。
 如果老鼠到达洞中，老鼠获胜。
 如果某一位置重复出现（即，玩家的位置和移动顺序都与上一次行动相同），游戏平局。
 给你一张图 graph ，并假设两位玩家都都以最佳状态参与游戏：

 如果老鼠获胜，则返回 1；
 如果猫获胜，则返回 2；
 如果平局，则返回 0 。

 示例 1：

 输入：graph = [[2,5],[3],[0,4,5],[1,4,5],[2,3],[0,2,3]]
 输出：0
 示例 2：

 输入：graph = [[1,3],[0],[3],[0,2]]
 输出：1

 提示：

 3 <= graph.length <= 50
 1 <= graph[i].length < graph.length
 0 <= graph[i][j] < graph.length
 graph[i][j] != i
 graph[i] 互不相同
 猫和老鼠在游戏中总是移动
 */

func catMouseGame(_ graph: [[Int]]) -> Int {
    enum winType: Int {
        case draw = 0
        case mouse
        case cat
    }
    let n = graph.count
    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 2 * n), count: n), count: n)

    func getResult(_ mouse: Int, _ cat: Int, _ turns: Int) -> Int {
        if turns == n * 2 {
            return winType.draw.rawValue
        }

        var res = dp[mouse][cat][turns]
        if res != -1 {
            return res
        }

        if mouse == 0 {
            res = winType.mouse.rawValue
        } else if cat == mouse {
            res = winType.cat.rawValue
        } else {
            res = getNextResult(mouse, cat, turns)
        }

        dp[mouse][cat][turns] = res
        return res
    }

    func getNextResult(_ mouse: Int, _ cat: Int, _ turns: Int) -> Int {
        var curMove = mouse
        if turns & 1 == 1 {
            curMove = cat
        }

        var defaultRes = winType.mouse.rawValue
        if curMove == mouse {
            defaultRes = winType.cat.rawValue
        }

        var res = defaultRes
        for next in graph[curMove] {
            if curMove == cat && next == 0 {
                continue
            }

            var nextMouse = mouse
            var nextCat = cat
            if curMove == mouse {
                nextMouse = next
            } else if curMove == cat {
                nextCat = next
            }

            let nextRes = getResult(nextMouse, nextCat, turns + 1)
            if nextRes != defaultRes {
                res = nextRes
                if res != winType.draw.rawValue {
                    break
                }
            }
        }

        return res
    }

    return getResult(1, 2, 0)
}
