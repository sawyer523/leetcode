//
//  339.calcEquation.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/6.
//

import Foundation

/*
 399. 除法求值
 难度
 中等

 341





 给你一个变量对数组 equations 和一个实数值数组 values 作为已知条件，其中 equations[i] = [Ai, Bi] 和 values[i] 共同表示等式 Ai / Bi = values[i] 。每个 Ai 或 Bi 是一个表示单个变量的字符串。

 另有一些以数组 queries 表示的问题，其中 queries[j] = [Cj, Dj] 表示第 j 个问题，请你根据已知条件找出 Cj / Dj = ? 的结果作为答案。

 返回 所有问题的答案 。如果存在某个无法确定的答案，则用 -1.0 替代这个答案。

  

 注意：输入总是有效的。你可以假设除法运算中不会出现除数为 0 的情况，且不存在任何矛盾的结果。

  

 示例 1：

 输入：equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
 输出：[6.00000,0.50000,-1.00000,1.00000,-1.00000]
 解释：
 条件：a / b = 2.0, b / c = 3.0
 问题：a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
 结果：[6.0, 0.5, -1.0, 1.0, -1.0 ]
 示例 2：

 输入：equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
 输出：[3.75000,0.40000,5.00000,0.20000]
 示例 3：

 输入：equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
 输出：[0.50000,2.00000,-1.00000,-1.00000]
  

 提示：

 1 <= equations.length <= 20
 equations[i].length == 2
 1 <= Ai.length, Bi.length <= 5
 values.length == equations.length
 0.0 < values[i] <= 20.0
 1 <= queries.length <= 20
 queries[i].length == 2
 1 <= Cj.length, Dj.length <= 5
 Ai, Bi, Cj, Dj 由小写英文字母与数字组成
 */

class Solution339 {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var map = [String: Node]()
        for i in 0..<equations.count {
            let k1 = equations[i][0]
            let k2 = equations[i][1]
            let value = values[i]
            map[k1] = map[k1] ?? Node()
            map[k2] = map[k2] ?? Node(value)
            union(map[k1]!, map[k2]!, value, map: map)
        }
        var ans = [Double]()
        for q in queries {
            guard
                let n1 = map[q[0]],
                let n2 = map[q[1]],
                find(n1) === find(n2)
            else {
                ans.append(-1)
                continue
            }
            ans.append(n1.value / n2.value)
        }
        return ans
    }

    class Node {
        var parent: Node!
        var value: Double
        init(_ value: Double = 1) {
            self.value = value
            parent = self
        }
    }

    func find(_ node: Node) -> Node {
        var node = node
        repeat {
            node = node.parent
        } while node !== node.parent
        return node
    }

    func union(_ n1: Node, _ n2: Node, _ num: Double, map: [String: Node]) {
        let r1 = find(n1)
        let r2 = find(n2)
        if r1 === r2 {
            return
        }
        let ratio = n2.value * num / n1.value
        map.values.filter { find($0) === r1 }.forEach { $0.value *= ratio }
        r1.parent = r2
    }
}
