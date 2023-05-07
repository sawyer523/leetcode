//
//  882.reachableNodes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/11/26.
//

import Foundation

/*
 882. 细分图中的可到达节点
 难度
 困难

 126

 给你一个无向图（原始图），图中有 n 个节点，编号从 0 到 n - 1 。你决定将图中的每条边 细分 为一条节点链，每条边之间的新节点数各不相同。

 图用由边组成的二维数组 edges 表示，其中 edges[i] = [ui, vi, cnti] 表示原始图中节点 ui 和 vi 之间存在一条边，cnti 是将边 细分 后的新节点总数。注意，cnti == 0 表示边不可细分。

 要 细分 边 [ui, vi] ，需要将其替换为 (cnti + 1) 条新边，和 cnti 个新节点。新节点为 x1, x2, ..., xcnti ，新边为 [ui, x1], [x1, x2], [x2, x3], ..., [xcnti+1, xcnti], [xcnti, vi] 。

 现在得到一个 新的细分图 ，请你计算从节点 0 出发，可以到达多少个节点？如果节点间距离是 maxMoves 或更少，则视为 可以到达 。

 给你原始图和 maxMoves ，返回 新的细分图中从节点 0 出发 可到达的节点数 。

 示例 1：

 输入：edges = [[0,1,10],[0,2,1],[1,2,2]], maxMoves = 6, n = 3
 输出：13
 解释：边的细分情况如上图所示。
 可以到达的节点已经用黄色标注出来。
 示例 2：

 输入：edges = [[0,1,4],[1,2,6],[0,2,8],[1,3,1]], maxMoves = 10, n = 4
 输出：23
 示例 3：

 输入：edges = [[1,2,4],[1,4,5],[1,3,1],[2,3,4],[3,4,5]], maxMoves = 17, n = 5
 输出：1
 解释：节点 0 与图的其余部分没有连通，所以只有节点 0 可以到达。

 提示：

 0 <= edges.length <= min(n * (n - 1) / 2, 10^4)
 edges[i].length == 3
 0 <= ui < vi < n
 图中 不存在平行边
 0 <= cnti <= 10^4
 0 <= maxMoves <= 10^9
 1 <= n <= 3000
 */

func reachableNodes(_ edges: [[Int]], _ maxMoves: Int, _ n: Int) -> Int {
    class MinHeap {
        private var nodes: [[Int]] = []
        init() {}
        var isEmpty: Bool {
            return nodes.isEmpty
        }

        func push(_ val: [Int]) {
            nodes.append(val)
            nodes.sort { $0[0] < $1[0] }
        }

        func pop() -> [Int] {
            if nodes.isEmpty {
                return []
            }

            if nodes.count == 1 {
                return nodes.removeLast()
            }

            let ret = nodes[0]
            nodes[0] = nodes.removeLast()
            nodes.sort { $0[0] < $1[0] }
            return ret
        }

        func peek() -> [Int]? {
            return nodes.first
        }
    }

    var adList: [Int: [[Int]]] = [:]
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        let nodes = edge[2]
        adList[u, default: []].append([v, nodes])
        adList[v, default: []].append([u, nodes])
    }

    var used: [Int: Int] = [:]
    var visited: [Int: Bool] = [:]
    var reachableNodes = 0
    let pq = MinHeap()
    pq.push([0, 0])

    while !pq.isEmpty && pq.peek()![0] <= maxMoves {
        let p = pq.pop()
        let step = p[0]
        let u = p[1]
        if visited[u, default: false] {
            continue
        }
        visited[u] = true
        reachableNodes += 1
        for q in adList[u, default: []] {
            let v = q[0]
            let nodes = q[1]
            if nodes + step + 1 <= maxMoves &&
                !visited[v, default: false] {
                pq.push([nodes + step + 1, v])
            }
            used[u * n + v] = min(nodes, maxMoves - step)
        }
    }

    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        let nodes = edge[2]
        reachableNodes += min(nodes, used[u * n + v, default: 0] + used[v * n + u, default: 0])
    }
    return reachableNodes
}
