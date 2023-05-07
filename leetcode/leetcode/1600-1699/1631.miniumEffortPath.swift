//
//  1631.miniumEffortPath.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/1/29.
//

import Foundation

/*
 1631. 最小体力消耗路径
 难度
 中等

 95

 你准备参加一场远足活动。给你一个二维 rows x columns 的地图 heights ，其中 heights[row][col] 表示格子 (row, col) 的高度。一开始你在最左上角的格子 (0, 0) ，且你希望去最右下角的格子 (rows-1, columns-1) （注意下标从 0 开始编号）。你每次可以往 上，下，左，右 四个方向之一移动，你想要找到耗费 体力 最小的一条路径。

 一条路径耗费的 体力值 是路径上相邻格子之间 高度差绝对值 的 最大值 决定的。

 请你返回从左上角走到右下角的最小 体力消耗值 。

 示例 1：

 输入：heights = [[1,2,2],[3,8,2],[5,3,5]]
 输出：2
 解释：路径 [1,3,5,3,5] 连续格子的差值绝对值最大为 2 。
 这条路径比路径 [1,2,2,2,5] 更优，因为另一条路径差值最大值为 3 。
 示例 2：

 输入：heights = [[1,2,3],[3,8,4],[5,3,5]]
 输出：1
 解释：路径 [1,2,3,4,5] 的相邻格子差值绝对值最大为 1 ，比路径 [1,3,5,3,5] 更优。
 示例 3：

 输入：heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
 输出：0
 解释：上图所示路径不需要消耗任何体力。

 提示：

 rows == heights.length
 columns == heights[i].length
 1 <= rows, columns <= 100
 1 <= heights[i][j] <= 106

 */

func minimumEffortPath(_ heights: [[Int]]) -> Int {
    let n = heights.count
    let m = heights[0].count
    var parent = [Int](0 ..< m * n)
    var size = [Int](repeating: 1, count: m * n)

    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    func union(_ x: Int, _ y: Int) {
        var fx = find(x)
        var fy = find(y)
        if fx == fy {
            return
        }

        if size[fx] < size[fy] {
            (fx, fy) = (fy, fx)
        }

        size[fx] += size[fy]
        parent[fy] = fx
    }

    func isSameSet(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }

    struct edge {
        var v: Int
        var w: Int
        var diff: Int
    }

    var edges = [edge]()
    for (i, row) in heights.enumerated() {
        for (j, h) in row.enumerated() {
            let id = i * m + j
            if i > 0 {
                edges.append(edge(v: id - m, w: id, diff: abs(h - heights[i - 1][j])))
            }

            if j > 0 {
                edges.append(edge(v: id - 1, w: id, diff: abs(h - heights[i][j - 1])))
            }
        }
    }

    edges.sort { e1, e2 -> Bool in
        e1.diff < e2.diff
    }

    for e in edges {
        union(e.v, e.w)
        if isSameSet(0, n * m - 1) {
            return e.diff
        }
    }

    return 0
}
