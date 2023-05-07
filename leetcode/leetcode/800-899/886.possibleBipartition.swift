//
//  886.possibleBipartition.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/16.
//

import Foundation

/*
 886. 可能的二分法
 难度
 中等

 240

 给定一组 n 人（编号为 1, 2, ..., n）， 我们想把每个人分进任意大小的两组。每个人都可能不喜欢其他人，那么他们不应该属于同一组。

 给定整数 n 和数组 dislikes ，其中 dislikes[i] = [ai, bi] ，表示不允许将编号为 ai 和  bi的人归入同一组。当可以用这种方法将所有人分进两组时，返回 true；否则返回 false。

 示例 1：

 输入：n = 4, dislikes = [[1,2],[1,3],[2,4]]
 输出：true
 解释：group1 [1,4], group2 [2,3]
 示例 2：

 输入：n = 3, dislikes = [[1,2],[1,3],[2,3]]
 输出：false
 示例 3：

 输入：n = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 输出：false

 提示：

 1 <= n <= 2000
 0 <= dislikes.length <= 10^4
 dislikes[i].length == 2
 1 <= dislikes[i][j] <= n
 ai < bi
 dislikes 中每一组都 不同
 */

func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
    class UnionFind {
        private var parent: [Int]
        private var rank: [Int]
        init(_ n: Int) {
            self.parent = Array(0 ..< n)
            self.rank = [Int](repeating: 0, count: n)
        }

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func union(_ x: Int, _ y: Int) {
            let x1 = find(x)
            let y1 = find(y)
            if x1 == y1 {
                return
            }

            if rank[y1] < rank[x1] {
                parent[y1] = x1
            } else if rank[x1] < rank[y1] {
                parent[x1] = y1
            } else {
                parent[y1] = x1
                rank[x1] += 1
            }
        }

        func isConnected(_ x: Int, _ y: Int) -> Bool {
            return find(x) == find(y)
        }
    }

    var g = [[Int]](repeating: [Int](), count: n)
    for d in dislikes {
        let x = d[0] - 1
        let y = d[1] - 1
        g[x].append(y)
        g[y].append(x)
    }

    let uf = UnionFind(n)
    for (x, nodes) in g.enumerated() {
        for y in nodes {
            uf.union(nodes[0], y)
            if uf.isConnected(x, y) {
                return false
            }
        }
    }
    return true
}
