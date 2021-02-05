//
//  803.hitBricks.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/16.
//

import Foundation

/*
 803. 打砖块
 难度
 困难

 135





 有一个 m x n 的二元网格，其中 1 表示砖块，0 表示空白。砖块 稳定（不会掉落）的前提是：

 一块砖直接连接到网格的顶部，或者
 至少有一块相邻（4 个方向之一）砖块 稳定 不会掉落时
 给你一个数组 hits ，这是需要依次消除砖块的位置。每当消除 hits[i] = (rowi, coli) 位置上的砖块时，对应位置的砖块（若存在）会消失，然后其他的砖块可能因为这一消除操作而掉落。一旦砖块掉落，它会立即从网格中消失（即，它不会落在其他稳定的砖块上）。

 返回一个数组 result ，其中 result[i] 表示第 i 次消除操作对应掉落的砖块数目。

 注意，消除可能指向是没有砖块的空白位置，如果发生这种情况，则没有砖块掉落。

  

 示例 1：

 输入：grid = [[1,0,0,0],[1,1,1,0]], hits = [[1,0]]
 输出：[2]
 解释：
 网格开始为：
 [[1,0,0,0]，
  [1,1,1,0]]
 消除 (1,0) 处加粗的砖块，得到网格：
 [[1,0,0,0]
  [0,1,1,0]]
 两个加粗的砖不再稳定，因为它们不再与顶部相连，也不再与另一个稳定的砖相邻，因此它们将掉落。得到网格：
 [[1,0,0,0],
  [0,0,0,0]]
 因此，结果为 [2] 。
 示例 2：

 输入：grid = [[1,0,0,0],[1,1,0,0]], hits = [[1,1],[1,0]]
 输出：[0,0]
 解释：
 网格开始为：
 [[1,0,0,0],
  [1,1,0,0]]
 消除 (1,1) 处加粗的砖块，得到网格：
 [[1,0,0,0],
  [1,0,0,0]]
 剩下的砖都很稳定，所以不会掉落。网格保持不变：
 [[1,0,0,0],
  [1,0,0,0]]
 接下来消除 (1,0) 处加粗的砖块，得到网格：
 [[1,0,0,0],
  [0,0,0,0]]
 剩下的砖块仍然是稳定的，所以不会有砖块掉落。
 因此，结果为 [0,0] 。
  

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 200
 grid[i][j] 为 0 或 1
 1 <= hits.length <= 4 * 104
 hits[i].length == 2
 0 <= xi <= m - 1
 0 <= yi <= n - 1
 所有 (xi, yi) 互不相同
 */

//func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
//
//    }
class Solution803 {
    private var rows: Int = 0
    private var cols: Int = 0
    
    let DIRECTIONS = [[0, 1], [1, 0], [-1, 0], [0, -1]]

    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        rows = grid.count
        cols = grid[0].count
        
        /// 1.将grid中的hits的砖头全部击碎
        var copy = Array.init(repeating: Array.init(repeating: 0, count: cols), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                copy[i][j] = grid[i][j]
            }
        }
        
        for hit in hits {
            copy[hit[0]][hit[1]] = 0
        }
        
        /// 2.建图
        let size = rows * cols
        let unionFind = UnionFind(size + 1)
        
        /// 2.1 将第0行与屋顶相连
        for j in 0..<cols {
            if copy[0][j] == 1 {
                unionFind.union(x: j, y: size)
            }
        }
        
        /// 2.2 其他网格
        for i in 1..<rows {
            for j in 0..<cols {
                if copy[i][j] == 1 {
                    if copy[i - 1][j] == 1 {
                        unionFind.union(x: getIndex(x: i - 1, y: j), y: getIndex(x: i, y: j))
                    }
                    
                    if j > 0 && copy[i][j - 1] == 1 {
                        unionFind.union(x: getIndex(x: i, y: j - 1), y: getIndex(x: i, y: j))
                    }
                }
            }
        }
        
        /// 3.按照hits逆序补回砖块，并记录每一次补回石块与屋顶砖块的增量
        let hitsLen = hits.count
        var result = Array.init(repeating: 0, count: hitsLen)
        for i in stride(from: hitsLen - 1, through: 0, by: -1) {
            let x = hits[i][0]
            let y = hits[i][1]
            // 这里不能用 copy，语义上表示，如果原来在 grid 中，这一块是空白，这一步不会产生任何砖块掉落
            // 逆向补回的时候，与屋顶相连的砖块数量也肯定不会增加
            if grid[x][y] == 0 {
                continue
            }
            
            // 补回之前与屋顶相连的砖块数
            let origin = unionFind.getSize(x: size)
            
            // 如果补回的是第0行，需先与屋顶合并
            if x == 0 {
                // unionFind.union(x: getIndex(x: x, y: y), y: size)
                unionFind.union(x: y, y: size)
            }
            
            // 4个方向上对比合并
            for item in DIRECTIONS {
                let newX = x + item[0]
                let newY = y + item[1]
                
                if inArea(x: newX, y: newY) && copy[newX][newY] == 1 {
                    unionFind.union(x: getIndex(x: newX, y: newY), y: getIndex(x: x, y: y))
                }
            }
            
            // 补回之后与屋顶相连的砖块数
            let current = unionFind.getSize(x: size)
            // 可能没有变化所以与0做对比
            result[i] = max(0, current - origin - 1)
            
            // 补回砖块
            copy[x][y] = 1
        }
        return result
    }

    /// 判断二维坐标是否越界
    private func inArea(x: Int, y: Int) -> Bool {
        return x >= 0 && x < rows && y >= 0 && y < cols
    }
    /// 二维坐标转换为一维坐标
    private func getIndex(x: Int, y: Int) -> Int {
        return x * cols + y
    }
    
    class UnionFind {
        /// 当前结点的父结点
        private var parent: [Int]
        /// 以当前结点为根结点的子树的结点总数
        private var size: [Int]
        
        init(_ count:Int) {
            parent = Array.init(repeating: 0, count: count)
            size = Array.init(repeating: 0, count: count)
            for i in 0..<count {
                parent[i] = i
                size[i] = 1
            }
        }
        /// 寻找根节点
        func find(x: Int) -> Int {
            if x != parent[x] {
                parent[x] = find(x: parent[x])
            }
            return parent[x]
        }
        /// 合并集合
        func union(x: Int, y: Int) {
            let rootX = find(x: x)
            let rootY = find(x: y)
            if rootX == rootY {
                return
            }
            parent[rootX] = rootY
            //  -------------------- 合并时维护数组size --------------------
            size[rootY] += size[rootX]
        }
        /// 获取根节点下的节点数
        func getSize(x: Int) -> Int {
            let root = find(x: x)
            return size[root]
        }
    }
}



