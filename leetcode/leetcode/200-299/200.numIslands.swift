//
//  200.numIslands.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/19.
//

import Foundation

/*
 200. 岛屿数量
 难度
 中等

 940

 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

 此外，你可以假设该网格的四条边均被水包围。

 示例 1：

 输入：grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 输出：1
 示例 2：

 输入：grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 输出：3

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] 的值为 '0' 或 '1'
 */

func numIslands(_ grid: [[Character]]) -> Int {
    if grid.isEmpty || grid[0].isEmpty {
        return 0
    }

    let uf = UnionFind(grid)
    let directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]
    let m = grid.count
    let n = grid[0].count
    for i in 0 ..< m {
        for j in 0 ..< n {
            if grid[i][j] == "0" {
                continue
            }
            for d in directions {
                let nr = i + d.0
                let nc = j + d.1
                if nr >= 0 &&
                    nc >= 0 &&
                    nr < m &&
                    nc < n &&
                    grid[nr][nc] == "1" {
                    uf.union(i * n + j, nr * n + nc)
                }
            }
        }
    }

    class UnionFind {
        private var parent: [Int]
        private var rank: [Int]
        var count = 0
        init(_ grid: [[Character]]) {
            let m = grid.count
            let n = grid[0].count
            self.parent = [Int](repeating: -1, count: m * n)
            self.rank = [Int](repeating: 0, count: m * n)
            for i in 0 ..< m {
                for j in 0 ..< n {
                    if grid[i][j] == "1" {
                        self.parent[i * n + j] = i * n + j
                        self.count += 1
                    }
                }
            }
        }

        func find(_ x: Int) -> Int {
            if self.parent[x] != x {
                self.parent[x] = find(x)
            }
            return self.parent[x]
        }

        func union(_ x: Int, _ y: Int) {
            let xRoot = find(x)
            let yRoot = find(y)
            if xRoot != yRoot {
                if rank[yRoot] < rank[xRoot] {
                    parent[yRoot] = xRoot
                } else if rank[xRoot] < rank[yRoot] {
                    parent[xRoot] = yRoot
                } else {
                    parent[xRoot] = yRoot
                    rank[xRoot] += 1
                }
                self.count -= 1
            }
        }
    }

    return uf.count
}
