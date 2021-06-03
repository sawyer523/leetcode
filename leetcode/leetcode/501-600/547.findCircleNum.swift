//
//  547.findCircleNum.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/7.
//

import Foundation

/*
 547. 省份数量
 难度
 中等

 414





 有 n 个城市，其中一些彼此相连，另一些没有相连。如果城市 a 与城市 b 直接相连，且城市 b 与城市 c 直接相连，那么城市 a 与城市 c 间接相连。

 省份 是一组直接或间接相连的城市，组内不含其他没有相连的城市。

 给你一个 n x n 的矩阵 isConnected ，其中 isConnected[i][j] = 1 表示第 i 个城市和第 j 个城市直接相连，而 isConnected[i][j] = 0 表示二者不直接相连。

 返回矩阵中 省份 的数量。

  

 示例 1：
 imageLiteral(resourceName: "graph1.jpg")
 输入：isConnected = [[1,1,0],[1,1,0],[0,0,1]]
 输出：2
 
 
 示例 2：
 imageLiteral(resourceName: "graph2.jpg")
 输入：isConnected = [[1,0,0],[0,1,0],[0,0,1]]
 输出：3
  

 提示：

 1 <= n <= 200
 n == isConnected.length
 n == isConnected[i].length
 isConnected[i][j] 为 1 或 0
 isConnected[i][i] == 1
 isConnected[i][j] == isConnected[j][i]
 */

class Solution547 {
   func findCircleNum(_ M: [[Int]]) -> Int {
    if M.isEmpty || M[0].isEmpty {
        return 0
    }

    let uf = UnionFind(grid: M)
    let m = M.count
    let n = M[0].count

    for i in 0..<m {
        for j in 0..<n {
            if i == j {
                continue
            }
            if M[i][j] == 1 {
                uf.union(x: i, y: j)
            }

        }
    }

    let arr = uf.parent
    var count = 0
    for i in 0..<m {
        if arr[i] == -1 {
            count += 1
        }
    }

    return count
}
}

class UnionFind {
    var parent: [Int]
    var rank: [Int]
    init(grid: [[Int]]) {
        let m = grid.count
        self.parent = [Int](repeating: -1, count: m)
        self.rank = [Int](repeating: 0, count: m)
    }

    func find(i: Int) -> Int {
        if parent[i] == -1 {
            return i
        }
        if parent[i] != i {
            parent[i] = find(i: parent[i])
        }
        return parent[i]
    }

    func union(x: Int, y: Int) {
        let rootx = find(i: x)
        let rooty = find(i: y)
        if rootx != rooty {
            if rank[rootx] > rank[rooty] {
                parent[rooty] = rootx
            } else if rank[rootx] < rank[rooty] {
                parent[rootx] = rooty
            } else {
                parent[rooty] = rootx
                rank[rootx] += 1
            }
        }
    }
}
