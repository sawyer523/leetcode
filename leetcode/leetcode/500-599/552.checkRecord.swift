//
//  552.checkRecord.swift
//  552.checkRecord
//
//  Created by Xiaonan Chen on 2021/8/18.
//

import Foundation

/*
 552. 学生出勤记录 II
 难度
 困难

 160

 可以用字符串表示一个学生的出勤记录，其中的每个字符用来标记当天的出勤情况（缺勤、迟到、到场）。记录中只含下面三种字符：
 'A'：Absent，缺勤
 'L'：Late，迟到
 'P'：Present，到场
 如果学生能够 同时 满足下面两个条件，则可以获得出勤奖励：

 按 总出勤 计，学生缺勤（'A'）严格 少于两天。
 学生 不会 存在 连续 3 天或 连续 3 天以上的迟到（'L'）记录。
 给你一个整数 n ，表示出勤记录的长度（次数）。请你返回记录长度为 n 时，可能获得出勤奖励的记录情况 数量 。答案可能很大，所以返回对 109 + 7 取余 的结果。

 示例 1：

 输入：n = 2
 输出：8
 解释：
 有 8 种长度为 2 的记录将被视为可奖励：
 "PP" , "AP", "PA", "LP", "PL", "AL", "LA", "LL"
 只有"AA"不会被视为可奖励，因为缺勤次数为 2 次（需要少于 2 次）。
 示例 2：

 输入：n = 1
 输出：3
 示例 3：

 输入：n = 10101
 输出：183236316

 提示：

 1 <= n <= 105
 */

func checkRecord(_ n: Int) -> Int {
    /* 超时
     let mod = Int(1e9 + 7)
     var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2)
     dp[0][0] = 1
     for _ in 1...n {
         var dpN = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 2)
         for j in 0...1 {
             for k in 0...2 {
                 dpN[j][0] = (dpN[j][0] + dp[j][k]) % mod
             }
         }

         for k in 0...2 {
             dpN[1][0] = (dpN[1][0] + dp[0][k]) % mod
         }

         for j in 0...1 {
             for k in 1...2 {
                 dpN[j][k] = (dpN[j][k] + dp[j][k-1]) % mod
             }
         }

         dp = dpN
     }

     var ans = 0
     for j in 0...1 {
         for k in 0...2 {
             ans = (ans + dp[j][k]) % mod
         }
     }
     return ans
      */
    let mod = Int(1e9 + 7)

    func pow(_ m: [[Int]], _ n: Int) -> [[Int]] {
        var m = m
        var res = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 6)
        for i in 0 ..< 6 {
            res[i][i] = 1
        }
        var n = n
        while n > 0 {
            if 1 & n > 0 {
                res = mul(res, m)
            }
            n >>= 1
            m = mul(m, m)
        }
        return res
    }

    func mul(_ m: [[Int]], _ b: [[Int]]) -> [[Int]] {
        var c = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 6)
        for i in 0 ..< m.count {
            for j in 0 ..< b[0].count {
                for k in 0 ..< b.count {
                    c[i][j] = (c[i][j] + m[i][k] * b[k][j]) % mod
                }
            }
        }
        return c
    }

    let m = [[1, 1, 0, 1, 0, 0],
             [1, 0, 1, 1, 0, 0],
             [1, 0, 0, 1, 0, 0],
             [0, 0, 0, 1, 1, 0],
             [0, 0, 0, 1, 0, 1],
             [0, 0, 0, 1, 0, 0]]

    return pow(m, n)[0].reduce(0, +) % mod
}
