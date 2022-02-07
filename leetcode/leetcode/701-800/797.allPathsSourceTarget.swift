//
//  797.allPathsSourceTarget.swift
//  797.allPathsSourceTarget
//
//  Created by Xiaonan Chen on 2021/8/25.
//

import Foundation

/*
 797. 所有可能的路径
 难度
 中等
 
 155
 
 
 
 
 
 给你一个有 n 个节点的 有向无环图（DAG），请你找出所有从节点 0 到节点 n-1 的路径并输出（不要求按特定顺序）
 
 二维数组的第 i 个数组中的单元都表示有向图中 i 号节点所能到达的下一些节点，空就是没有下一个结点了。
 
 译者注：有向图是有方向的，即规定了 a→b 你就不能从 b→a 。
 
 
 
 示例 1：
 
 
 
 输入：graph = [[1,2],[3],[3],[]]
 输出：[[0,1,3],[0,2,3]]
 解释：有两条路径 0 -> 1 -> 3 和 0 -> 2 -> 3
 示例 2：
 
 
 
 输入：graph = [[4,3,1],[3,2,4],[3],[4],[]]
 输出：[[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
 示例 3：
 
 输入：graph = [[1],[]]
 输出：[[0,1]]
 示例 4：
 
 输入：graph = [[1,2,3],[2],[3],[]]
 输出：[[0,1,2,3],[0,2,3],[0,3]]
 示例 5：
 
 输入：graph = [[1,3],[2],[3],[]]
 输出：[[0,1,2,3],[0,3]]
 */

func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var stack = [0]
    let n = graph.count - 1
    var ans: [[Int]] = []
    func dfs(_ x: Int) {
        if x == n {
            ans.append(stack)
            return
        }
        
        for g in graph[x] {
            stack.append(g)
            dfs(g)
            stack.removeLast()
        }
    }
    dfs(0)
    return ans
}
