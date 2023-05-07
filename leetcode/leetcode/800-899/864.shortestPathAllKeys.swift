//
//  864.shortestPathAllKeys.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/11/10.
//

import Foundation

/*
 864. 获取所有钥匙的最短路径
 难度
 困难

 131

 给定一个二维网格 grid ，其中：

 '.' 代表一个空房间
 '#' 代表一堵
 '@' 是起点
 小写字母代表钥匙
 大写字母代表锁
 我们从起点开始出发，一次移动是指向四个基本方向之一行走一个单位空间。我们不能在网格外面行走，也无法穿过一堵墙。如果途经一个钥匙，我们就把它捡起来。除非我们手里有对应的钥匙，否则无法通过锁。

 假设 k 为 钥匙/锁 的个数，且满足 1 <= k <= 6，字母表中的前 k 个字母在网格中都有自己对应的一个小写和一个大写字母。换言之，每个锁有唯一对应的钥匙，每个钥匙也有唯一对应的锁。另外，代表钥匙和锁的字母互为大小写并按字母顺序排列。

 返回获取所有钥匙所需要的移动的最少次数。如果无法获取所有钥匙，返回 -1 。

 示例 1：

 输入：grid = ["@.a.#","###.#","b.A.B"]
 输出：8
 解释：目标是获得所有钥匙，而不是打开所有锁。
 示例 2：

 输入：grid = ["@..aA","..B#.","....b"]
 输出：6
 示例 3:

 输入: grid = ["@Aa"]
 输出: -1

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 30
 grid[i][j] 只含有 '.', '#', '@', 'a'-'f' 以及 'A'-'F'
 钥匙的数目范围是 [1, 6]
 每个钥匙都对应一个 不同 的字母
 每个钥匙正好打开一个对应的锁
 */

func shortestPathAllKeys(_ grid: [String]) -> Int {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var sx = 0
    var sy = 0
    let m = grid.count
    let n = grid[0].count
    var keyToIDx: [Character: Int] = [:]
    var grids: [[Character]] = []
    for (i, row) in grid.enumerated() {
        grids.append(Array(row))
        for (j, c) in row.enumerated() {
            if c == "@" {
                sx = i
                sy = j
            } else if c.isLowercase {
                if keyToIDx[c] == nil {
                    keyToIDx[c] = keyToIDx.count
                }
            }
        }
    }

    var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 1 << keyToIDx.count), count: n), count: m)
    dist[sx][sy][0] = 0
    var q = [[sx, sy, 0]]
    var i = 0
    while i < q.count {
        let p = q[i]
        i += 1
        let x = p[0]
        let y = p[1]
        let mask = p[2]

        for d in dirs {
            let nx = x + d.0
            let ny = y + d.1
            if nx >= 0 && nx < m && ny >= 0 && ny < n && grids[nx][ny] != "#" {
                let c = grids[nx][ny]
                if c == "." || c == "@" {
                    if dist[nx][ny][mask] == -1 {
                        dist[nx][ny][mask] = dist[x][y][mask] + 1
                        q.append([nx, ny, mask])
                    }
                } else if c.isLowercase {
                    let t = mask | 1 << keyToIDx[c, default: 0]
                    if dist[nx][ny][t] == -1 {
                        dist[nx][ny][t] = dist[x][y][mask] + 1
                        if t == 1 << keyToIDx.count - 1 {
                            return dist[nx][ny][t]
                        }
                        q.append([nx, ny, t])
                    }
                } else {
                    let idx = keyToIDx[Character(c.lowercased()), default: 0]
                    if mask >> idx & 1 > 0 &&
                        dist[nx][ny][mask] == -1 {
                        dist[nx][ny][mask] = dist[x][y][mask] + 1
                        q.append([nx, ny, mask])
                    }
                }
            }
        }
    }

    return -1
}
