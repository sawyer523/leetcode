//
//  1579.maxNumEdgesToRemove.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/1/27.
//

import Foundation

/*
 1579. 保证图可完全遍历
 难度
 困难

 58





 Alice 和 Bob 共有一个无向图，其中包含 n 个节点和 3  种类型的边：

 类型 1：只能由 Alice 遍历。
 类型 2：只能由 Bob 遍历。
 类型 3：Alice 和 Bob 都可以遍历。
 给你一个数组 edges ，其中 edges[i] = [typei, ui, vi] 表示节点 ui 和 vi 之间存在类型为 typei 的双向边。请你在保证图仍能够被 Alice和 Bob 完全遍历的前提下，找出可以删除的最大边数。如果从任何节点开始，Alice 和 Bob 都可以到达所有其他节点，则认为图是可以完全遍历的。

 返回可以删除的最大边数，如果 Alice 和 Bob 无法完全遍历图，则返回 -1 。

  

 示例 1：



 输入：n = 4, edges = [[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]]
 输出：2
 解释：如果删除 [1,1,2] 和 [1,1,3] 这两条边，Alice 和 Bob 仍然可以完全遍历这个图。再删除任何其他的边都无法保证图可以完全遍历。所以可以删除的最大边数是 2 。
 示例 2：



 输入：n = 4, edges = [[3,1,2],[3,2,3],[1,1,4],[2,1,4]]
 输出：0
 解释：注意，删除任何一条边都会使 Alice 和 Bob 无法完全遍历这个图。
 示例 3：



 输入：n = 4, edges = [[3,2,3],[1,1,2],[2,3,4]]
 输出：-1
 解释：在当前图中，Alice 无法从其他节点到达节点 4 。类似地，Bob 也不能达到节点 1 。因此，图无法完全遍历。
  

 提示：

 1 <= n <= 10^5
 1 <= edges.length <= min(10^5, 3 * n * (n-1) / 2)
 edges[i].length == 3
 1 <= edges[i][0] <= 3
 1 <= edges[i][1] < edges[i][2] <= n
 所有元组 (typei, ui, vi) 互不相同
 */

func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
    class UnionFind {
        var parent: [Int]
        var size: [Int]
        var setCount: Int
        
        init(_ n: Int) {
            self.parent = [Int](0..<n)
            self.size = [Int](repeating: 1, count: n)
            self.setCount = n
        }
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) -> Bool {
            var fx = find(x)
            var fy = find(y)
            if fx == fy {
                return false
            }
            if size[fx] < size[fy] {
                (fx, fy) = (fy, fx)
            }
            parent[fy] = fx
            size[fx] += size[fy]
            setCount -= 1
            return true
        }
        
        func isSameSet(_ x: Int, _ y: Int) -> Bool {
            return find(x) == find(y)
        }
    }
    var ans = edges.count
    let alice = UnionFind(n)
    let bob = UnionFind(n)
    
    for e in edges {
        let x = e[1]-1
        let y = e[2]-1
        if e[0] == 3 &&
            (!alice.isSameSet(x, y) ||
            !bob.isSameSet(x, y)) {
            alice.union(x, y)
            bob.union(x, y)
            ans -= 1
        }
    }
    
    let uf = [alice, bob]
    for e in edges {
        let tp = e[0]
        if tp < 3 && uf[tp-1].union(e[1]-1, e[2]-1) {
            ans -= 1
        }
    }
    
    if 1 < uf[0].setCount || 1 < uf[1].setCount {
        return -1
    }
    
    return ans
}
