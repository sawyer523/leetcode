//
//  1728.canMouseWin.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/10.
//

import Foundation

/*
 1728. 猫和老鼠 II
 难度
 困难

 47

 收藏

 分享
 切换为英文
 接收动态
 反馈
 一只猫和一只老鼠在玩一个叫做猫和老鼠的游戏。

 它们所处的环境设定是一个 rows x cols 的方格 grid ，其中每个格子可能是一堵墙、一块地板、一位玩家（猫或者老鼠）或者食物。

 玩家由字符 'C' （代表猫）和 'M' （代表老鼠）表示。
 地板由字符 '.' 表示，玩家可以通过这个格子。
 墙用字符 '#' 表示，玩家不能通过这个格子。
 食物用字符 'F' 表示，玩家可以通过这个格子。
 字符 'C' ， 'M' 和 'F' 在 grid 中都只会出现一次。
 猫和老鼠按照如下规则移动：

 老鼠 先移动 ，然后两名玩家轮流移动。
 每一次操作时，猫和老鼠可以跳到上下左右四个方向之一的格子，他们不能跳过墙也不能跳出 grid 。
 catJump 和 mouseJump 是猫和老鼠分别跳一次能到达的最远距离，它们也可以跳小于最大距离的长度。
 它们可以停留在原地。
 老鼠可以跳跃过猫的位置。
 游戏有 4 种方式会结束：

 如果猫跟老鼠处在相同的位置，那么猫获胜。
 如果猫先到达食物，那么猫获胜。
 如果老鼠先到达食物，那么老鼠获胜。
 如果老鼠不能在 1000 次操作以内到达食物，那么猫获胜。
 给你 rows x cols 的矩阵 grid 和两个整数 catJump 和 mouseJump ，双方都采取最优策略，如果老鼠获胜，那么请你返回 true ，否则返回 false 。

 示例 1：

 输入：grid = ["####F","#C...","M...."], catJump = 1, mouseJump = 2
 输出：true
 解释：猫无法抓到老鼠，也没法比老鼠先到达食物。
 示例 2：

 输入：grid = ["M.C...F"], catJump = 1, mouseJump = 4
 输出：true
 示例 3：

 输入：grid = ["M.C...F"], catJump = 1, mouseJump = 3
 输出：false
 示例 4：

 输入：grid = ["C...#","...#F","....#","M...."], catJump = 2, mouseJump = 5
 输出：false
 示例 5：

 输入：grid = [".M...","..#..","#..#.","C#.#.","...#F"], catJump = 3, mouseJump = 1
 输出：true

 提示：

 rows == grid.length
 cols = grid[i].length
 1 <= rows, cols <= 8
 grid[i][j] 只包含字符 'C' ，'M' ，'F' ，'.' 和 '#' 。
 grid 中只包含一个 'C' ，'M' 和 'F' 。
 1 <= catJump, mouseJump <= 8
 */

func canMouseWin(_ grid: [String], _ catJump: Int, _ mouseJump: Int) -> Bool {
    let mouseTurn = 0
    let catTurn = 1
    let unknown = 0
    let mouseWin = 1
    let catWin = 2
    let maxMoves = 1000
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    let rows = grid.count
    let cols = grid[0].count

    func getPos(_ row: Int, _ col: Int) -> Int {
        return row * cols + col
    }

    var startMouse = 0
    var startCat = 0
    var food = 0

    for i in 0 ..< rows {
        for (j, ch) in grid[i].enumerated() {
            switch ch {
            case "M":
                startMouse = getPos(i, j)
            case "C":
                startCat = getPos(i, j)
            case "F":
                food = getPos(i, j)
            default:
                break
            }
        }
    }

    let total = rows * cols
    var degrees = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 2), count: 64), count: 64)

    for mouse in 0 ..< total {
        let mouseRow = mouse / cols
        let mouseCol = mouse % cols
        if grid[mouseRow][mouseCol] == "#" {
            continue
        }
        for cat in 0 ..< total {
            let catRow = cat / cols
            let catCol = cat % cols
            if grid[catRow][catCol] == "#" {
                continue
            }

            degrees[mouse][cat][mouseTurn] += 1
            degrees[mouse][cat][catTurn] += 1

            for dir in dirs {
                var row = mouseRow + dir.0
                var col = mouseCol + dir.1
                var jump = 1
                while row >= 0 &&
                    row < rows &&
                    col >= 0 &&
                    col < cols &&
                    grid[row][col] != "#" &&
                    jump <= mouseJump {
                    let nextMouse = getPos(row, col)
                    let nextCat = getPos(catRow, catCol)
                    degrees[nextMouse][nextCat][mouseTurn] += 1
                    row += dir.0
                    col += dir.1
                    jump += 1
                }

                row = catRow + dir.0
                col = catCol + dir.1
                jump = 1
                while row >= 0 &&
                    row < rows &&
                    col >= 0 &&
                    col < cols &&
                    grid[row][col] != "#" &&
                    jump <= catJump {
                    let nextMouse = getPos(mouseRow, mouseCol)
                    let nextCat = getPos(row, col)
                    degrees[nextMouse][nextCat][catTurn] += 1
                    row += dir.0
                    col += dir.1
                    jump += 1
                }
            }
        }
    }

    var results = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2), count: 64), count: 64)
    var q: [(Int, Int, Int)] = []

    for pos in 0 ..< total {
        let row = pos / cols
        let col = pos % cols
        if grid[row][col] == "#" {
            continue
        }
        results[pos][pos][mouseTurn][0] = catWin
        results[pos][pos][mouseTurn][1] = 0
        results[pos][pos][catTurn][0] = catWin
        results[pos][pos][catTurn][1] = 0
        q.append((pos, pos, mouseTurn))
        q.append((pos, pos, catTurn))
    }

    for mouse in 0 ..< total {
        let mouseRow = mouse / cols
        let mouseCol = mouse % cols
        if grid[mouseRow][mouseCol] == "#" ||
            mouse == food {
            continue
        }

        results[mouse][food][mouseTurn][0] = catWin
        results[mouse][food][mouseTurn][1] = 0
        results[mouse][food][catTurn][0] = catWin
        results[mouse][food][catTurn][1] = 0
        q.append((mouse, food, mouseTurn))
        q.append((mouse, food, catTurn))
    }

    for cat in 0 ..< total {
        let catRow = cat / cols
        let catCol = cat % cols
        if grid[catRow][catCol] == "#" ||
            cat == food {
            continue
        }

        results[food][cat][mouseTurn][0] = mouseWin
        results[food][cat][mouseTurn][1] = 0
        results[food][cat][catTurn][0] = mouseWin
        results[food][cat][catTurn][1] = 0
        q.append((food, cat, mouseTurn))
        q.append((food, cat, catTurn))
    }

    func getPrevStates(_ mouse: Int, _ cat: Int, _ turn: Int) -> [(Int, Int, Int)] {
        let mouseRow = mouse / cols
        let mouseCol = mouse % cols
        let catRow = cat / cols
        let catCol = cat % cols
        var prevTurn = mouseTurn
        if turn == mouseTurn {
            prevTurn = catTurn
        }

        var maxJump = catJump
        var startRow = catRow
        var startCol = catCol
        if prevTurn == mouseTurn {
            maxJump = mouseJump
            startRow = mouseRow
            startCol = mouseCol
        }

        var prevStates = [(mouse, cat, prevTurn)]
        for dir in dirs {
            var i = startRow + dir.0
            var j = startCol + dir.1
            var jump = 1
            while i >= 0 &&
                i < rows &&
                j >= 0 &&
                j < cols &&
                grid[i][j] != "#" &&
                jump <= maxJump {
                var prevMouseRow = mouseRow
                var prevMouseCol = mouseCol
                var prevCatRow = i
                var prevCatCol = j
                if prevTurn == mouseTurn {
                    prevMouseRow = i
                    prevMouseCol = j
                    prevCatRow = catRow
                    prevCatCol = catCol
                }
                let prevMouse = getPos(prevMouseRow, prevMouseCol)
                let prevCat = getPos(prevCatRow, prevCatCol)
                prevStates.append((prevMouse, prevCat, prevTurn))
                i += dir.0
                j += dir.1

                jump += 1
            }
        }

        return prevStates
    }

    while !q.isEmpty {
        let s = q.removeFirst()
        let mouse = s.0
        let cat = s.1
        let turn = s.2
        let result = results[mouse][cat][turn][0]
        let moves = results[mouse][cat][turn][1]

        for s in getPrevStates(mouse, cat, turn) {
            let prevMouse = s.0
            let prevCat = s.1
            let prevTurn = s.2
            if results[prevMouse][prevCat][prevTurn][0] == unknown {
                let catwin = result == mouseWin &&
                    prevTurn == mouseTurn ||
                    result == catWin &&
                    prevTurn == catTurn
                if catwin {
                    results[prevMouse][prevCat][prevTurn][0] = result
                    results[prevMouse][prevCat][prevTurn][1] = moves + 1
                    q.append((prevMouse, prevCat, prevTurn))
                } else {
                    degrees[prevMouse][prevCat][prevTurn] -= 1
                    if degrees[prevMouse][prevCat][prevTurn] == 0 {
                        var loseResult = mouseWin
                        if prevTurn == mouseTurn {
                            loseResult = catWin
                        }
                        results[prevMouse][prevCat][prevTurn][0] = loseResult
                        results[prevMouse][prevCat][prevTurn][1] = moves + 1
                        q.append((prevMouse, prevCat, prevTurn))
                    }
                }
            }
        }
    }

    return results[startMouse][startCat][mouseTurn][0] == mouseWin && results[startMouse][startCat][mouseTurn][1] <= maxMoves
}
