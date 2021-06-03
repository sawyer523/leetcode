//
//  959.regionsBySlashes.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/25.
//

import Foundation

/*
 959. 由斜杠划分区域
 难度
 中等

 141





 在由 1 x 1 方格组成的 N x N 网格 grid 中，每个 1 x 1 方块由 /、\ 或空格构成。这些字符会将方块划分为一些共边的区域。

 （请注意，反斜杠字符是转义的，因此 \ 用 "\\" 表示。）。

 返回区域的数目。

  

 示例 1：

 输入：
 [
   " /",
   "/ "
 ]
 输出：2
 解释：2x2 网格如下：

 示例 2：

 输入：
 [
   " /",
   "  "
 ]
 输出：1
 解释：2x2 网格如下：

 示例 3：

 输入：
 [
   "\\/",
   "/\\"
 ]
 输出：4
 解释：（回想一下，因为 \ 字符是转义的，所以 "\\/" 表示 \/，而 "/\\" 表示 /\。）
 2x2 网格如下：

 示例 4：

 输入：
 [
   "/\\",
   "\\/"
 ]
 输出：5
 解释：（回想一下，因为 \ 字符是转义的，所以 "/\\" 表示 /\，而 "\\/" 表示 \/。）
 2x2 网格如下：

 示例 5：

 输入：
 [
   "//",
   "/ "
 ]
 输出：3
 解释：2x2 网格如下：

  

 提示：

 1 <= grid.length == grid[0].length <= 30
 grid[i][j] 是 '/'、'\'、或 ' '。
 */

func regionsBySlashes(_ grid: [String]) -> Int {
    let n = grid.count
    var setCount = n * n * 4
    var parent = [Int](0..<(n*n*4))
    var size = [Int](repeating: 0, count: n*n*4)

    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    func union(_ x: Int, _ y: Int) {
        var fx = find(x)
        var fy = find(y)
        if fx == fy {
            return
        }
        if size[fx] < size[fy] {
            (fx, fy) = (fy, fx)
        }
        size[fx] = size[fy]
        parent[fy] = fx
        setCount -= 1
    }

    for i in 0..<n {
        let tempS = grid[i]
        let tempArr = Array(tempS)
        for j in 0..<n {
            let idx = i*n + j
            if i < n-1 {
                let bottom = idx+n
                union(idx*4+2, bottom*4)
            }
            if j < n-1 {
                let right = idx + 1
                union(idx*4+1, right*4+3)
            }
            if tempArr[j] == "/" {
                union(idx*4, idx*4+3)
                union(idx*4+1, idx*4+2)
            } else if tempArr[j] == "\\" {
                union(idx*4, idx*4+1)
                union(idx*4+2, idx*4+3)
            } else {
                union(idx*4, idx*4+1)
                union(idx*4+1, idx*4+2)
                union(idx*4+2, idx*4+3)
            }
        }
    }
    return setCount
}
