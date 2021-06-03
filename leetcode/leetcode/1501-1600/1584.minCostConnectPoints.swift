//
//  1584.minCostConnectPoints.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/19.
//

import Foundation

/*
 1584. 连接所有点的最小费用
 难度
 中等

 49





 给你一个points 数组，表示 2D 平面上的一些点，其中 points[i] = [xi, yi] 。

 连接点 [xi, yi] 和点 [xj, yj] 的费用为它们之间的 曼哈顿距离 ：|xi - xj| + |yi - yj| ，其中 |val| 表示 val 的绝对值。

 请你返回将所有点连接的最小总费用。只有任意两点之间 有且仅有 一条简单路径时，才认为所有点都已连接。

  

 示例 1：



 输入：points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
 输出：20
 解释：

 我们可以按照上图所示连接所有点得到最小总费用，总费用为 20 。
 注意到任意两个点之间只有唯一一条路径互相到达。
 示例 2：

 输入：points = [[3,12],[-2,5],[-4,1]]
 输出：18
 示例 3：

 输入：points = [[0,0],[1,1],[1,0],[-1,1]]
 输出：4
 示例 4：

 输入：points = [[-1000000,-1000000],[1000000,1000000]]
 输出：4000000
 示例 5：

 输入：points = [[0,0]]
 输出：0
  

 提示：

 1 <= points.length <= 1000
 -106 <= xi, yi <= 106
 所有点 (xi, yi) 两两不同。
 */

func minCostConnectPoints(_ points: [[Int]]) -> Int {
    var parentIndex = [Int]()

    func findSet(_ vi: Int) -> Int {
        if parentIndex[vi] != vi {  // path compression; return root of the set
            parentIndex[vi] = findSet(parentIndex[vi])
            return parentIndex[vi]
        } else {
            return vi // root
        }
    }

    var edges = [(v1i: Int, v2i: Int, w: Int)]()

    parentIndex = Array(0...points.count-1)

    for i in 0 ..< points.count - 1 {
        let p1 = points[i]
        let p1x = p1[0], p1y = p1[1]
        for j in i + 1 ..< points.count {
            let p2 = points[j]
            edges.append((i, j, abs(p1x - p2[0]) + abs(p1y - p2[1])))
        }
    }
    edges.sort { (a, b) -> Bool in
        if a.w < b.w { return true }
        return false
    }
    var minCost = 0

    for edge in edges {
        let rp1 = findSet(edge.v1i) // returns root index
        let rp2 = findSet(edge.v2i) // returns root index

        if rp1 != rp2 {  // Sets are separate, join them
            minCost += edge.w
            parentIndex[rp2] = rp1 // Union
        }
    }
    return minCost
}
