//
//  1489.findCriticalAndPseudoCriticalEdges.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/21.
//

import Foundation

/*
 1489. 找到最小生成树里的关键边和伪关键边
 难度
 困难

 31

 给你一个 n 个点的带权无向连通图，节点编号为 0 到 n-1 ，同时还有一个数组 edges ，其中 edges[i] = [fromi, toi, weighti] 表示在 fromi 和 toi 节点之间有一条带权无向边。最小生成树 (MST) 是给定图中边的一个子集，它连接了所有节点且没有环，而且这些边的权值和最小。

 请你找到给定图中最小生成树的所有关键边和伪关键边。如果从图中删去某条边，会导致最小生成树的权值和增加，那么我们就说它是一条关键边。伪关键边则是可能会出现在某些最小生成树中但不会出现在所有最小生成树中的边。

 请注意，你可以分别以任意顺序返回关键边的下标和伪关键边的下标。

 示例 1：

 输入：n = 5, edges = [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]]
 输出：[[0,1],[2,3,4,5]]
 解释：上图描述了给定图。
 下图是所有的最小生成树。

 注意到第 0 条边和第 1 条边出现在了所有最小生成树中，所以它们是关键边，我们将这两个下标作为输出的第一个列表。
 边 2，3，4 和 5 是所有 MST 的剩余边，所以它们是伪关键边。我们将它们作为输出的第二个列表。
 示例 2 ：

 输入：n = 4, edges = [[0,1,1],[1,2,1],[2,3,1],[0,3,1]]
 输出：[[],[0,1,2,3]]
 解释：可以观察到 4 条边都有相同的权值，任选它们中的 3 条可以形成一棵 MST 。所以 4 条边都是伪关键边。

 提示：

 2 <= n <= 100
 1 <= edges.length <= min(200, n * (n - 1) / 2)
 edges[i].length == 3
 0 <= fromi < toi < n
 1 <= weighti <= 1000
 所有 (fromi, toi) 数对都是互不相同的。
 */

func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
    struct Edges: Hashable {
        var firstNode: Int
        var weight: Int
        var secondNode: Int
    }

    // nodes, edges (ordered), chosen edge, exclude
    func dist(n: Int, edges: [[Int]], edge: Int, exclude: Int) -> Int {
        var parents: [Int] = Array(0 ... n)
        var cost = 0
        var count = 0
        if edge != -1 {
            let pick = edges[edge]
            parents[pick[0]] = parents[pick[1]]
            cost += pick[2]
            count += 1
        }

        // for each edge
        for i in 0 ..< edges.count {
            // do not take into account the excluded edge
            if i == exclude {
                continue
            }
            let root1 = find(p: parents, j: edges[i][0])
            let root2 = find(p: parents, j: edges[i][1])
            if root1 != root2 {
                parents[root1] = root2
                count += 1
                // the cost if the node is not part of the network
                cost += edges[i][2]
            }
        }
        if count == n - 1 {
            return cost
        } else {
            return Int.max
        }
    }

    // basic union find
    func find(p: [Int], j: Int) -> Int {
        if p[j] != j {
            return find(p: p, j: p[j])
        }
        return j
    }

    // ascending edge weight to find the minumum overall weight
    let sortedEdges = edges.sorted { a, b in
        a[2] < b[2]
    }

    var positionDictionary: [Edges: Int] = [:]

    // indicies must be returned in the initial order, so we store these edges and their order
    for e in 0 ..< edges.count {
        positionDictionary[Edges(firstNode: edges[e][0], weight: edges[e][1], secondNode: edges[e][2])] = e
    }

    // Calculate MST
    let minWeight = dist(n: n, edges: sortedEdges, edge: -1, exclude: -1)
    // Output Array
    var output: [[Int]] = [[], []]

    // for each edge
    for e in 0 ..< sortedEdges.count {
        // we use the original (sorted index(
        let index = positionDictionary[Edges(firstNode: sortedEdges[e][0], weight: sortedEdges[e][1], secondNode: sortedEdges[e][2])]!
        if dist(n: n, edges: sortedEdges, edge: -1, exclude: e) > minWeight {
            output[0].append(index)
        } else {
            if dist(n: n, edges: sortedEdges, edge: e, exclude: -1) == minWeight {
                output[1].append(index)
            }
        }
    }
    return output
}
