//
//  1697.distanceLimitedPathsExist.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/14.
//

import Foundation

/*
 1697. 检查边长度限制的路径是否存在
 难度
 困难

 70

 给你一个 n 个点组成的无向图边集 edgeList ，其中 edgeList[i] = [ui, vi, disi] 表示点 ui 和点 vi 之间有一条长度为 disi 的边。请注意，两个点之间可能有 超过一条边 。

 给你一个查询数组queries ，其中 queries[j] = [pj, qj, limitj] ，你的任务是对于每个查询 queries[j] ，判断是否存在从 pj 到 qj 的路径，且这条路径上的每一条边都 严格小于 limitj 。

 请你返回一个 布尔数组 answer ，其中 answer.length == queries.length ，当 queries[j] 的查询结果为 true 时， answer 第 j 个值为 true ，否则为 false 。

 示例 1：

 输入：n = 3, edgeList = [[0,1,2],[1,2,4],[2,0,8],[1,0,16]], queries = [[0,1,2],[0,2,5]]
 输出：[false,true]
 解释：上图为给定的输入数据。注意到 0 和 1 之间有两条重边，分别为 2 和 16 。
 对于第一个查询，0 和 1 之间没有小于 2 的边，所以我们返回 false 。
 对于第二个查询，有一条路径（0 -> 1 -> 2）两条边都小于 5 ，所以这个查询我们返回 true 。
 示例 2：

 输入：n = 5, edgeList = [[0,1,10],[1,2,5],[2,3,9],[3,4,13]], queries = [[0,4,14],[1,4,13]]
 输出：[true,false]
 解释：上图为给定数据。

 提示：

 2 <= n <= 10^5
 1 <= edgeList.length, queries.length <= 10^5
 edgeList[i].length == 3
 queries[j].length == 3
 0 <= ui, vi, pj, qj <= n - 1
 ui != vi
 pj != qj
 1 <= disi, limitj <= 10^9
 两个点之间可能有 多条 边。
 */

func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
    let edgeList = edgeList.sorted { $0[2] < $1[2] }
    var f = [Int](0 ..< n)

    func find(_ x: Int) -> Int {
        if f[x] != x {
            f[x] = find(f[x])
        }
        return f[x]
    }

    func merge(_ from: Int, _ to: Int) {
        f[find(from)] = find(to)
    }

    var queries = queries
    for i in 0 ..< queries.count {
        queries[i].append(i)
    }

    queries.sort { $0[2] < $1[2] }

    var ans = [Bool](repeating: false, count: queries.count)
    var k = 0
    for query in queries {
        while k < edgeList.count, edgeList[k][2] < query[2] {
            merge(edgeList[k][0], edgeList[k][1])
            k += 1
        }
        ans[query[3]] = find(query[0]) == find(query[1])
    }
    return ans
}
