//
//  1494.minNumberOfSemesters.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/16.
//

import Foundation

/*
 1494. 并行课程 II
 给你一个整数 n 表示某所大学里课程的数目，编号为 1 到 n ，数组 relations 中， relations[i] = [xi, yi]  表示一个先修课的关系，也就是课程 xi 必须在课程 yi 之前上。同时你还有一个整数 k 。

 在一个学期中，你 最多 可以同时上 k 门课，前提是这些课的先修课在之前的学期里已经上过了。

 请你返回上完所有课最少需要多少个学期。题目保证一定存在一种上完所有课的方式。

 示例 1：

 输入：n = 4, relations = [[2,1],[3,1],[1,4]], k = 2
 输出：3
 解释：上图展示了题目输入的图。在第一个学期中，我们可以上课程 2 和课程 3 。然后第二个学期上课程 1 ，第三个学期上课程 4 。
 示例 2：

 输入：n = 5, relations = [[2,1],[3,1],[4,1],[1,5]], k = 2
 输出：4
 解释：上图展示了题目输入的图。一个最优方案是：第一学期上课程 2 和 3，第二学期上课程 4 ，第三学期上课程 1 ，第四学期上课程 5 。
 示例 3：

 输入：n = 11, relations = [], k = 2
 输出：6

 提示：

 1 <= n <= 15
 1 <= k <= n
 0 <= relations.length <= n * (n-1) / 2
 relations[i].length == 2
 1 <= xi, yi <= n
 xi != yi
 所有先修关系都是不同的，也就是说 relations[i] != relations[j] 。
 题目输入的图是个有向无环图。
 */

func minNumberOfSemesters(_ n: Int, _ relations: [[Int]], _ k: Int) -> Int {
    var dp = [Int](repeating: Int.max, count: 1 << n)
    var need = [Int](repeating: 0, count: 1 << n)
    for edge in relations {
        need[1 << (edge[1] - 1)] |= 1 << (edge[0] - 1)
    }
    dp[0] = 0
    for i in 1 ..< 1 << n {
        need[i] = need[i & (i - 1)] | need[i & -i]
        if (need[i] | i) != i {
            continue
        }

        let valid = i ^ need[i]
        if valid.nonzeroBitCount <= k {
            dp[i] = min(dp[i], dp[i ^ valid] + 1)
        } else {
            var sub = valid
            while 0 < sub {
                if sub.nonzeroBitCount <= k {
                    dp[i] = min(dp[i], dp[i ^ sub] + 1)
                }
                sub = (sub - 1) & valid
            }
        }
    }
    return dp[(1 << n) - 1]
}
