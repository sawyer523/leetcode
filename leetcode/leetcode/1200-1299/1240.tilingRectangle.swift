//
//  1240.tilingRectangle.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/8.
//

import Foundation

/*
 1240. 铺瓷砖
 你是一位施工队的工长，根据设计师的要求准备为一套设计风格独特的房子进行室内装修。

 房子的客厅大小为 n x m，为保持极简的风格，需要使用尽可能少的 正方形 瓷砖来铺盖地面。

 假设正方形瓷砖的规格不限，边长都是整数。

 请你帮设计师计算一下，最少需要用到多少块方形瓷砖？

 示例 1：

 输入：n = 2, m = 3
 输出：3
 解释：3 块地砖就可以铺满卧室。
      2 块 1x1 地砖
      1 块 2x2 地砖
 示例 2：

 输入：n = 5, m = 8
 输出：5
 示例 3：

 输入：n = 11, m = 13
 输出：6

 提示：

 1 <= n <= 13
 1 <= m <= 13
 */

func tilingRectangle(_ n: Int, _ m: Int) -> Int {
    var ans = max(n, m)
    var rect = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

    func isAvailable(_ x: Int, _ y: Int, _ k: Int) -> Bool {
        for i in 0 ..< k {
            for j in 0 ..< k {
                if rect[x + i][y + j] {
                    return false
                }
            }
        }
        return true
    }

    func fillUp(_ x: Int, _ y: Int, _ k: Int, _ val: Bool) {
        for i in 0 ..< k {
            for j in 0 ..< k {
                rect[x + i][y + j] = val
            }
        }
    }

    func dfs(_ x: Int, _ y: Int, _ cnt: Int) {
        if ans <= cnt {
            return
        }

        if n <= x {
            ans = cnt
            return
        }

        if m <= y {
            dfs(x + 1, 0, cnt)
            return
        }

        if rect[x][y] {
            dfs(x, y + 1, cnt)
            return
        }

        for k in stride(from: min(n - x, m - y), through: 1, by: -1) where isAvailable(x, y, k) {
            fillUp(x, y, k, true)
            dfs(x, y + k, cnt + 1)
            fillUp(x, y, k, false)
        }
    }

    dfs(0, 0, 0)
    return ans
}
