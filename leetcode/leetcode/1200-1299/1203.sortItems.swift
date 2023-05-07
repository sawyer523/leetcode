//
//  1203.sortItems.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/12.
//

import Foundation

/*
 1203. 项目管理
 难度
 困难

 66

 公司共有 n 个项目和  m 个小组，每个项目要不无人接手，要不就由 m 个小组之一负责。

 group[i] 表示第 i 个项目所属的小组，如果这个项目目前无人接手，那么 group[i] 就等于 -1。（项目和小组都是从零开始编号的）小组可能存在没有接手任何项目的情况。

 请你帮忙按要求安排这些项目的进度，并返回排序后的项目列表：

 同一小组的项目，排序后在列表中彼此相邻。
 项目之间存在一定的依赖关系，我们用一个列表 beforeItems 来表示，其中 beforeItems[i] 表示在进行第 i 个项目前（位于第 i 个项目左侧）应该完成的所有项目。
 如果存在多个解决方案，只需要返回其中任意一个即可。如果没有合适的解决方案，就请返回一个 空列表 。

 示例 1：

 https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2019/09/22/1359_ex1.png
 输入：n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3,6],[],[],[]]
 输出：[6,3,4,1,5,2,0,7]
 示例 2：

 输入：n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3],[],[4],[]]
 输出：[]
 解释：与示例 1 大致相同，但是在排序后的列表中，4 必须放在 6 的前面。

 提示：

 1 <= m <= n <= 3 * 104
 group.length == beforeItems.length == n
 -1 <= group[i] <= m - 1
 0 <= beforeItems[i].length <= n - 1
 0 <= beforeItems[i][j] <= n - 1
 i != beforeItems[i][j]
 beforeItems[i] 不含重复元素
 */

func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
    func topSort(_ graph: [[Int]], _ deg: inout [Int], _ items: [Int]) -> [Int] {
        var q: [Int] = []
        for i in items {
            if deg[i] == 0 {
                q.append(i)
            }
        }

        var ans: [Int] = []
        while !q.isEmpty {
            let from = q.first!
            q.removeFirst()
            ans.append(from)
            for to in graph[from] {
                deg[to] -= 1
                if deg[to] == 0 {
                    q.append(to)
                }
            }
        }

        return ans
    }

    var group = group
    var groupItems = [[Int]](repeating: [], count: m + n)
    for i in 0 ..< group.count {
        if group[i] == -1 {
            group[i] = m + i
        }
        groupItems[group[i]].append(i)
    }

    var groupGraph = [[Int]](repeating: [], count: m + n)
    var groupDegree = [Int](repeating: 0, count: m + n)
    var itemGraph = [[Int]](repeating: [], count: n)
    var itemDegree = [Int](repeating: 0, count: n)
    for (cur, items) in beforeItems.enumerated() {
        let curGroupID = group[cur]
        for pre in items {
            let preGroupID = group[pre]
            if preGroupID != curGroupID {
                groupGraph[preGroupID].append(curGroupID)
                groupDegree[curGroupID] += 1
            } else {
                itemGraph[pre].append(cur)
                itemDegree[cur] += 1
            }
        }
    }

    var items = [Int](0 ..< m + n)
    for i in 0 ..< m + n {
        items[i] = i
    }

    let groupOrders = topSort(groupGraph, &groupDegree, items)
    if groupOrders.count < items.count {
        return []
    }

    var ans: [Int] = []
    for groupID in groupOrders {
        let items = groupItems[groupID]
        let orders = topSort(itemGraph, &itemDegree, items)
        if orders.count < items.count {
            return []
        }
        ans.append(contentsOf: orders)
    }
    return ans
}
