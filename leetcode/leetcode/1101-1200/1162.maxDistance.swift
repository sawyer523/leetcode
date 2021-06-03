//
//  1162.maxDistance.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/7.
//

import Foundation

/*
 1162. 地图分析
 难度
 中等
 
 194
 
 
 
 
 
 你现在手里有一份大小为 N x N 的 网格 grid，上面的每个 单元格 都用 0 和 1 标记好了。其中 0 代表海洋，1 代表陆地，请你找出一个海洋单元格，这个海洋单元格到离它最近的陆地单元格的距离是最大的。
 
 我们这里说的距离是「曼哈顿距离」（ Manhattan Distance）：(x0, y0) 和 (x1, y1) 这两个单元格之间的距离是 |x0 - x1| + |y0 - y1| 。
 
 如果网格上只有陆地或者海洋，请返回 -1。
 
 
 
 示例 1：
 
 
 
 输入：[[1,0,1],[0,0,0],[1,0,1]]
 输出：2
 解释：
 海洋单元格 (1, 1) 和所有陆地单元格之间的距离都达到最大，最大距离为 2。
 示例 2：
 
 
 
 输入：[[1,0,0],[0,0,0],[0,0,0]]
 输出：4
 解释：
 海洋单元格 (2, 2) 和所有陆地单元格之间的距离都达到最大，最大距离为 4。
 
 
 提示：
 
 1 <= grid.length == grid[0].length <= 100
 grid[i][j] 不是 0 就是 1
 */

func maxDistance(_ grid: [[Int]]) -> Int {
    let m = grid.count

    var dp = [[Int]](repeating: [Int](repeating: Int.max/2, count: m), count: m)
    var count = 0
    for i in 0..<m {
        for j in 0..<m {
            if grid[i][j] == 1 {
                dp[i][j] = 0
                count += 1
            }
        }
    }

    if count == 0 || count == m*m {
        return -1
    }

    for i in 0..<m {
        for j in 0..<m {
            if 0 <= i-1 {
                dp[i][j] = min(dp[i][j], dp[i-1][j] + 1)
            }

            if 0 <= j-1 {
                dp[i][j] = min(dp[i][j], dp[i][j-1] + 1)
            }
        }
    }

    for i in stride(from: m-1, through: 0, by: -1) {
        for j in stride(from: m-1, through: 0, by: -1) {
            if i + 1 < m {
                dp[i][j] = min(dp[i][j], dp[i+1][j] + 1)
            }
            if j + 1 < m {
                dp[i][j] = min(dp[i][j], dp[i][j+1] + 1)
            }
        }
    }

    var res = 0
    for i in 0..<m {
        for j in 0..<m {
            res = max(res, dp[i][j])
        }
    }

    return res
}
