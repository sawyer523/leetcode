//
//  1092.shortestCommonSupersequence.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/28.
//

import Foundation

/*
 1092. 最短公共超序列
 给出两个字符串 str1 和 str2，返回同时以 str1 和 str2 作为子序列的最短字符串。如果答案不止一个，则可以返回满足条件的任意一个答案。

 （如果从字符串 T 中删除一些字符（也可能不删除，并且选出的这些字符可以位于 T 中的 任意位置），可以得到字符串 S，那么 S 就是 T 的子序列）

 示例：

 输入：str1 = "abac", str2 = "cab"
 输出："cabac"
 解释：
 str1 = "abac" 是 "cabac" 的一个子串，因为我们可以删去 "cabac" 的第一个 "c"得到 "abac"。
 str2 = "cab" 是 "cabac" 的一个子串，因为我们可以删去 "cabac" 末尾的 "ac" 得到 "cab"。
 最终我们给出的答案是满足上述属性的最短字符串。

 提示：

 1 <= str1.length, str2.length <= 1000
 str1 和 str2 都由小写英文字母组成。
 */

func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
    let n = str1.count
    let m = str2.count
    let str1 = Array(str1)
    let str2 = Array(str2)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
    for i in 0 ..< n {
        dp[i][m] = n - i
    }

    for i in 0 ..< m {
        dp[n][i] = m - i
    }

    for i in stride(from: n - 1, through: 0, by: -1) {
        for j in stride(from: m - 1, through: 0, by: -1) {
            if str1[i] == str2[j] {
                dp[i][j] = dp[i + 1][j + 1] + 1
            } else {
                dp[i][j] = min(dp[i + 1][j], dp[i][j + 1]) + 1
            }
        }
    }

    var res = ""
    var t1 = 0
    var t2 = 0
    while t1 < n, t2 < m {
        if str1[t1] == str2[t2] {
            res += String(str1[t1])
            t1 += 1
            t2 += 1
        } else if dp[t1 + 1][t2] == dp[t1][t2] - 1 {
            res += String(str1[t1])
            t1 += 1
        } else if dp[t1][t2 + 1] == dp[t1][t2] - 1 {
            res += String(str2[t2])
            t2 += 1
        }
    }

    if t1 < n {
        res += String(str1[t1...])
    } else if t2 < m {
        res += String(str2[t2...])
    }

    return res
}
