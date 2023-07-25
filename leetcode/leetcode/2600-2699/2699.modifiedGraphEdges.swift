//
//  2699.modifiedGraphEdges.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/9.
//

import Foundation

/*
 2699. 修改图中的边权
 给你一个 n 个节点的 无向带权连通 图，节点编号为 0 到 n - 1 ，再给你一个整数数组 edges ，其中 edges[i] = [ai, bi, wi] 表示节点 ai 和 bi 之间有一条边权为 wi 的边。

 部分边的边权为 -1（wi = -1），其他边的边权都为 正 数（wi > 0）。

 你需要将所有边权为 -1 的边都修改为范围 [1, 2 * 109] 中的 正整数 ，使得从节点 source 到节点 destination 的 最短距离 为整数 target 。如果有 多种 修改方案可以使 source 和 destination 之间的最短距离等于 target ，你可以返回任意一种方案。

 如果存在使 source 到 destination 最短距离为 target 的方案，请你按任意顺序返回包含所有边的数组（包括未修改边权的边）。如果不存在这样的方案，请你返回一个 空数组 。

 注意：你不能修改一开始边权为正数的边。

 示例 1：

 输入：n = 5, edges = [[4,1,-1],[2,0,-1],[0,3,-1],[4,3,-1]], source = 0, destination = 1, target = 5
 输出：[[4,1,1],[2,0,1],[0,3,3],[4,3,1]]
 解释：上图展示了一个满足题意的修改方案，从 0 到 1 的最短距离为 5 。
 示例 2：

 输入：n = 3, edges = [[0,1,-1],[0,2,5]], source = 0, destination = 2, target = 6
 输出：[]
 解释：上图是一开始的图。没有办法通过修改边权为 -1 的边，使得 0 到 2 的最短距离等于 6 ，所以返回一个空数组。
 示例 3：

 输入：n = 4, edges = [[1,0,4],[1,2,3],[2,3,5],[0,3,-1]], source = 0, destination = 2, target = 6
 输出：[[1,0,4],[1,2,3],[2,3,5],[0,3,1]]
 解释：上图展示了一个满足题意的修改方案，从 0 到 2 的最短距离为 6 。

 提示：

 1 <= n <= 100
 1 <= edges.length <= n * (n - 1) / 2
 edges[i].length == 3
 0 <= ai, bi < n
 wi = -1 或者 1 <= wi <= 10^7
 ai != bi
 0 <= source, destination < n
 source != destination
 1 <= target <= 10^9
 输入的图是连通图，且没有自环和重边。
 */

func modifiedGraphEdges(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int, _ target: Int) -> [[Int]] {
    var edges = edges
    var adjMatrix = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    for (i, edge) in edges.enumerated() {
        let u = edge[0]
        let v = edge[1]
        adjMatrix[u][v] = i
        adjMatrix[v][u] = i
    }

    func dijkstra(_ op: Int, _ source: Int, _ fromDestination: [Int64]) -> [Int64] {
        let n = adjMatrix.count
        var dist = [Int64](repeating: 0x3F_3F3F_3F3F, count: n)
        var used = [Bool](repeating: false, count: n)
        dist[source] = 0
        for _ in 0 ..< n - 1 {
            var u = -1
            for i in 0 ..< n {
                if !used[i],
                   u == -1 || dist[i] < dist[u] {
                    u = i
                }
            }

            used[u] = true
            for v in 0 ..< n {
                if !used[v],
                   adjMatrix[u][v] != -1 {
                    let i = adjMatrix[u][v]
                    if edges[i][2] != -1 {
                        dist[v] = min(dist[v], dist[u] + Int64(edges[i][2]))
                    } else {
                        if op == 0 {
                            dist[v] = min(dist[v], dist[u] + 1)
                        } else {
                            let modify = Int64(target) - dist[u] - fromDestination[v]
                            if 0 < modify {
                                dist[v] = min(dist[v], dist[u] + modify)
                                edges[i][2] = Int(modify)
                            } else {
                                edges[i][2] = target
                            }
                        }
                    }
                }
            }
        }
        return dist
    }

    let fromDestination = dijkstra(0, destination, [])
    if Int64(target) < fromDestination[source] {
        return []
    }

    let fromSource = dijkstra(1, source, fromDestination)
    if fromSource[destination] != Int64(target) {
        return []
    }
    return edges
}
