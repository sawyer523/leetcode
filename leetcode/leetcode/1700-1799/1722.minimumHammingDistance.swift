//
//  1722.minimumHammingDistance.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/28.
//

import Foundation

/*
 1722. 执行交换操作后的最小汉明距离
 难度
 中等

 38

 给你两个整数数组 source 和 target ，长度都是 n 。还有一个数组 allowedSwaps ，其中每个 allowedSwaps[i] = [ai, bi] 表示你可以交换数组 source 中下标为 ai 和 bi（下标从 0 开始）的两个元素。注意，你可以按 任意 顺序 多次 交换一对特定下标指向的元素。

 相同长度的两个数组 source 和 target 间的 汉明距离 是元素不同的下标数量。形式上，其值等于满足 source[i] != target[i] （下标从 0 开始）的下标 i（0 <= i <= n-1）的数量。

 在对数组 source 执行 任意 数量的交换操作后，返回 source 和 target 间的 最小汉明距离 。

 示例 1：

 输入：source = [1,2,3,4], target = [2,1,4,5], allowedSwaps = [[0,1],[2,3]]
 输出：1
 解释：source 可以按下述方式转换：
 - 交换下标 0 和 1 指向的元素：source = [2,1,3,4]
 - 交换下标 2 和 3 指向的元素：source = [2,1,4,3]
 source 和 target 间的汉明距离是 1 ，二者有 1 处元素不同，在下标 3 。
 示例 2：

 输入：source = [1,2,3,4], target = [1,3,2,4], allowedSwaps = []
 输出：2
 解释：不能对 source 执行交换操作。
 source 和 target 间的汉明距离是 2 ，二者有 2 处元素不同，在下标 1 和下标 2 。
 示例 3：

 输入：source = [5,1,2,4,3], target = [1,5,4,2,3], allowedSwaps = [[0,4],[4,2],[1,3],[1,4]]
 输出：0

 提示：

 n == source.length == target.length
 1 <= n <= 10^5
 1 <= source[i], target[i] <= 10^5
 0 <= allowedSwaps.length <= 10^5
 allowedSwaps[i].length == 2
 0 <= ai, bi <= n - 1
 ai != bi
 */

func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
    let c = min(source.count, target.count)
    var graph = [Int: [Int]](), graphComponentValues = [Int: [Int: Int]](), index2Component = [Int](repeating: -1, count: c), result = 0
    // build graph
    for swap in allowedSwaps {
        graph[swap[0], default: [Int]()].append(swap[1])
        graph[swap[1], default: [Int]()].append(swap[0])
    }
    // build graph components
    for i in 0 ..< c where index2Component[i] == -1 {
        var queue = [i]
        while !queue.isEmpty {
            let nextQueue = queue
            queue = []
            for index in nextQueue where index2Component[index] == -1 {
                index2Component[index] = i
                graphComponentValues[i, default: [Int: Int]()][source[index], default: Int(0)] += 1
                queue += graph[index, default: [Int]()]
            }
        }
    }
    // find Hamming distance
    for i in 0 ..< c {
        if graphComponentValues[index2Component[i], default: [Int: Int]()][target[i], default: Int(0)] == 0 {
            result += 1
        } else {
            graphComponentValues[index2Component[i], default: [Int: Int]()][target[i], default: Int(0)] -= 1
        }
    }
    return result

    /*
     var tree = [Int:Set<Int>]()
     for edge in allowedSwaps {
     tree[edge[0], default: []].insert(edge[1])
     tree[edge[1], default: []].insert(edge[0])
     }
     let N = source.count
     var visited = Array<Bool>(repeating: false, count: N)

     func dfs(_ node: Int, _ indices: inout [Int]) {
     visited[node] = true
     indices.append(node)
     guard let children = tree[node] else {
     return
     }
     for next in children {
     guard !visited[next] else {
     continue
     }
     dfs(next, &indices)
     }
     }
     var ans = 0
     for i in 0..<N {
     guard !visited[i] else {
     continue
     }
     var indices = [Int]()
     dfs(i, &indices)
     var counter = [Int:Int]()
     for idx in indices {
     counter[source[idx], default: 0 ] += 1
     counter[target[idx],default: 0 ] -= 1
     }
     ans += (counter.values.reduce(0, {$0 + abs($1)}) >> 1)
     }
     return ans
     */
}