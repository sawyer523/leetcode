//
//  834.sumOfDistancesInTree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/16.
//

import Foundation

/*
 834. 树中距离之和
 给定一个无向、连通的树。树中有 n 个标记为 0...n-1 的节点以及 n-1 条边 。

 给定整数 n 和数组 edges ， edges[i] = [ai, bi]表示树中的节点 ai 和 bi 之间有一条边。

 返回长度为 n 的数组 answer ，其中 answer[i] 是树中第 i 个节点与所有其他节点之间的距离之和。

 示例 1:

 输入: n = 6, edges = [[0,1],[0,2],[2,3],[2,4],[2,5]]
 输出: [8,12,6,10,10,10]
 解释: 树如图所示。
 我们可以计算出 dist(0,1) + dist(0,2) + dist(0,3) + dist(0,4) + dist(0,5)
 也就是 1 + 1 + 2 + 2 + 2 = 8。 因此，answer[0] = 8，以此类推。
 示例 2:

 输入: n = 1, edges = []
 输出: [0]
 示例 3:

 输入: n = 2, edges = [[1,0]]
 输出: [1,1]

 提示:

 1 <= n <= 3 * 10^4
 edges.length == n - 1
 edges[i].length == 2
 0 <= ai, bi < n
 ai != bi
 给定的输入保证为有效的树
 */

func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var graph = [[Int]](repeating: [], count: n)
    for edge in edges {
        let u = edge[0]
        let v = edge[1]
        graph[u].append(v)
        graph[v].append(u)
    }

    var sz = [Int](repeating: 0, count: n)
    var dp = [Int](repeating: 0, count: n)
    func dfs(_ u: Int, _ f: Int) {
        sz[u] = 1
        for v in graph[u] {
            if v == f {
                continue
            }
            dfs(v, u)
            dp[u] += dp[v] + sz[v]
            sz[u] += sz[v]
        }
    }

    dfs(0, -1)

    var ans = [Int](repeating: 0, count: n)
    func dfs2(_ u: Int, _ f: Int) {
        ans[u] = dp[u]
        for v in graph[u] {
            if v == f {
                continue
            }

            let pu = dp[u]
            let pv = dp[v]
            let su = sz[u]
            let sv = sz[v]

            dp[u] -= dp[v] + sz[v]
            sz[u] -= sz[v]
            dp[v] += dp[u] + sz[u]
            sz[v] += sz[u]

            dfs2(v, u)

            dp[u] = pu
            dp[v] = pv
            sz[u] = su
            sz[v] = sv
        }
    }
    dfs2(0, -1)
    return ans
}