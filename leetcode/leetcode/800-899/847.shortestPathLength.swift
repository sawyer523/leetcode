//
//  847.shortestPathLength.swift
//  847.shortestPathLength
//
//  Created by Xiaonan Chen on 2021/8/6.
//

import Foundation

/*
 847. 访问所有节点的最短路径
 难度
 困难

 173

 存在一个由 n 个节点组成的无向连通图，图中的节点按从 0 到 n - 1 编号。

 给你一个数组 graph 表示这个图。其中，graph[i] 是一个列表，由所有与节点 i 直接相连的节点组成。

 返回能够访问所有节点的最短路径的长度。你可以在任一节点开始和停止，也可以多次重访节点，并且可以重用边。

 示例 1：

 输入：graph = [[1,2,3],[0],[0],[0]]
 输出：4
 解释：一种可能的路径为 [1,0,2,0,3]
 示例 2：

 输入：graph = [[1],[0,2,4],[1,3,4],[2],[1,2]]
 输出：4
 解释：一种可能的路径为 [0,1,4,2,3]

 提示：

 n == graph.length
 1 <= n <= 12
 0 <= graph[i].length < n
 graph[i] 不包含 i
 如果 graph[a] 包含 b ，那么 graph[b] 也包含 a
 输入的图总是连通图
 */

func shortestPathLength(_ graph: [[Int]]) -> Int {
    let n = graph.count
    var queue: [(Int, Int, Int)] = []
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: 1 << n), count: n)
    for i in 0 ..< n {
        seen[i][1 << i] = true
        queue.append((i, 1 << i, 0))
    }

    while !queue.isEmpty {
        let t = queue.removeFirst()
        if t.1 == 1 << n - 1 {
            return t.2
        }

        for v in graph[t.0] {
            let maskV = t.1 | 1 << v
            if !seen[v][maskV] {
                queue.append((v, maskV, t.2 + 1))
                seen[v][maskV] = true
            }
        }
    }

    return 0
}
