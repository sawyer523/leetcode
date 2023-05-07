//
//  13.movingCount.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/24.
//

import Foundation

/*
 面试题13. 机器人的运动范围
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

 示例 1：

 输入：m = 2, n = 3, k = 1
 输出：3
 示例 2：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20
 */

func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
    func get(_ x: Int) -> Int {
        var res = 0
        var x = x
        while x != 0 {
            res += x % 10
            x /= 10
        }
        return res
    }

    if k == 0 {
        return 1
    }

    var vis = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    var ans = 1
    vis[0][0] = 1
    for i in 0 ..< m {
        for j in 0 ..< n {
            if i == 0 && j == 0 ||
                k < get(i) + get(j) {
                continue
            }

            if 0 <= i - 1 {
                vis[i][j] |= vis[i - 1][j]
            }

            if 0 <= j - 1 {
                vis[i][j] |= vis[i][j - 1]
            }

            ans += vis[i][j]
        }
    }

    return ans
}
