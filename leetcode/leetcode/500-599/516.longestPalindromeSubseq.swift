//
//  516.longestPalindromeSubseq.swift
//  516.longestPalindromeSubseq
//
//  Created by Xiaonan Chen on 2021/8/12.
//

import Foundation

/*
 516. 最长回文子序列
 难度
 中等

 528

 给你一个字符串 s ，找出其中最长的回文子序列，并返回该序列的长度。

 子序列定义为：不改变剩余字符顺序的情况下，删除某些字符或者不删除任何字符形成的一个序列。

 示例 1：

 输入：s = "bbbab"
 输出：4
 解释：一个可能的最长回文子序列为 "bbbb" 。
 示例 2：

 输入：s = "cbbd"
 输出：2
 解释：一个可能的最长回文子序列为 "bb" 。

 提示：

 1 <= s.length <= 1000
 s 仅由小写英文字母组成
 */

func longestPalindromeSubseq(_ s: String) -> Int {
    let n = s.count
//    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//
//    for i in stride(from: n-1, through: 0, by: -1) {
//        dp[i][i] = 1
//        for j in i+1..<n {
//            if s[i] == s[j] {
//               dp[i][j] = dp[i+1][j-1] + 2
//            } else {
//                dp[i][j] = max(dp[i+1][j], dp[i][j-1])
//            }
//        }
//    }
//
//    return dp[0][n-1]

    var dp = [Int](repeating: 1, count: n)
    for i in stride(from: n - 1, through: 0, by: -1) {
        var maxLen = 0
        for j in i + 1 ..< n {
            let prev = maxLen
            maxLen = max(dp[j], maxLen)
            if s[i] == s[j] {
                dp[j] = prev + 2
            }
        }
    }
    return dp.max()!
}
