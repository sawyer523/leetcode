//
//  1137.tribonacci.swift
//  1137.tribonacci
//
//  Created by Xiaonan Chen on 2021/8/8.
//

import Foundation

/*
 1137. 第 N 个泰波那契数
 难度
 简单

 92

 泰波那契序列 Tn 定义如下：

 T0 = 0, T1 = 1, T2 = 1, 且在 n >= 0 的条件下 Tn+3 = Tn + Tn+1 + Tn+2

 给你整数 n，请返回第 n 个泰波那契数 Tn 的值。

 示例 1：

 输入：n = 4
 输出：4
 解释：
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 示例 2：

 输入：n = 25
 输出：1389537

 提示：

 0 <= n <= 37
 答案保证是一个 32 位整数，即 answer <= 2^31 - 1。
 */

func tribonacci(_ n: Int) -> Int {
    if n < 3 {
        return n == 0 ? 0 : 1
    }

//    var p = 0
//    var q = 0
//    var r = 1
//    var s = 1
//    for _ in 3...n {
//        p = q
//        q = r
//        r = s
//        s = p + q + r
//    }
//
//    return s
    func pow(_ matrix: [[Int]], _ n: Int) -> [[Int]] {
        var ret = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
        var n = n
        var matrix = matrix
        while n > 0 {
            if n & 1 == 1 {
                ret = multiply(ret, matrix)
            }
            n >>= 1
            matrix = multiply(matrix, matrix)
        }
        return ret
    }

    func multiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
        var c = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j]
            }
        }
        return c
    }

    let q = [[1, 1, 1], [1, 0, 0], [0, 1, 0]]
    let res = pow(q, n)
    return res[0][2]
}
