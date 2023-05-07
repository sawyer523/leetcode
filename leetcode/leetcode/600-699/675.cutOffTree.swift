//
//  675.cutOffTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/23.
//

import Foundation

/*
 675. 为高尔夫比赛砍树
 难度
 困难

 123

 你被请来给一个要举办高尔夫比赛的树林砍树。树林由一个 m x n 的矩阵表示， 在这个矩阵中：

 0 表示障碍，无法触碰
 1 表示地面，可以行走
 比 1 大的数 表示有树的单元格，可以行走，数值表示树的高度
 每一步，你都可以向上、下、左、右四个方向之一移动一个单位，如果你站的地方有一棵树，那么你可以决定是否要砍倒它。

 你需要按照树的高度从低向高砍掉所有的树，每砍过一颗树，该单元格的值变为 1（即变为地面）。

 你将从 (0, 0) 点开始工作，返回你砍完所有树需要走的最小步数。 如果你无法砍完所有的树，返回 -1 。

 可以保证的是，没有两棵树的高度是相同的，并且你至少需要砍倒一棵树。

 示例 1：

 输入：forest = [[1,2,3],[0,0,4],[7,6,5]]
 输出：6
 解释：沿着上面的路径，你可以用 6 步，按从最矮到最高的顺序砍掉这些树。
 示例 2：

 输入：forest = [[1,2,3],[0,0,0],[7,6,5]]
 输出：-1
 解释：由于中间一行被障碍阻塞，无法访问最下面一行中的树。
 示例 3：

 输入：forest = [[2,3,4],[0,0,5],[8,7,6]]
 输出：6
 解释：可以按与示例 1 相同的路径来砍掉所有的树。
 (0,0) 位置的树，可以直接砍去，不用算步数。

 提示：

 m == forest.length
 n == forest[i].length
 1 <= m, n <= 50
 0 <= forest[i][j] <= 10^9
 */

func cutOffTree(_ forest: [[Int]]) -> Int {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    func bfs(_ m: Int, _ n: Int, _ startX: Int, _ startY: Int, _ endX: Int, _ endY: Int) -> Int {
        if startX == endX && startY == endY {
            return 0
        }

        var steps = 0
        var queue = [(Int, Int)]()
        var visited = [[Bool]](repeatElement([Bool](repeatElement(false, count: n)), count: m))

        queue.append((startX, startY))
        visited[startX][startY] = true

        while !queue.isEmpty {
            let count = queue.count
            steps += 1
            for _ in 0 ..< count {
                let (x, y) = queue.removeFirst()
                for i in 0 ..< dirs.count {
                    let nextX = x + dirs[i].0
                    let nextY = y + dirs[i].1
                    if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n && forest[nextX][nextY] > 0 && !visited[nextX][nextY] {
                        if nextX == endX && nextY == endY {
                            return steps
                        }
                        visited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }

        return -1
    }

    if forest.isEmpty || forest[0].isEmpty {
        return -1
    }

    let m = forest.count
    let n = forest[0].count
    var result = 0
    var startX = 0
    var startY = 0
    var heights = [(Int, (Int, Int))]()

    for i in 0 ..< m {
        for j in 0 ..< n {
            if forest[i][j] > 1 {
                heights.append((forest[i][j], (i, j)))
            }
        }
    }
    heights.sort { (height1: (Int, (Int, Int)), height2: (Int, (Int, Int))) -> Bool in
        height1.0 < height2.0
    }

    for i in 0 ..< heights.count {
        let endX = heights[i].1.0
        let endY = heights[i].1.1
        let steps = bfs(m, n, startX, startY, endX, endY)
        if steps == -1 {
            return -1
        }
        result += steps
        startX = endX
        startY = endY
    }

    return result
}
