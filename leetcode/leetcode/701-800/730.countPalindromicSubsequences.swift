//
//  730.countPalindromicSubsequences.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/10.
//

import Foundation

/*
 730. 统计不同回文子序列
 难度
 困难

 237





 给定一个字符串 s，返回 s 中不同的非空「回文子序列」个数 。

 通过从 s 中删除 0 个或多个字符来获得子序列。

 如果一个字符序列与它反转后的字符序列一致，那么它是「回文字符序列」。

 如果有某个 i , 满足 ai != bi ，则两个序列 a1, a2, ... 和 b1, b2, ... 不同。

 注意：

 结果可能很大，你需要对 109 + 7 取模 。
  

 示例 1：

 输入：s = 'bccb'
 输出：6
 解释：6 个不同的非空回文子字符序列分别为：'b', 'c', 'bb', 'cc', 'bcb', 'bccb'。
 注意：'bcb' 虽然出现两次但仅计数一次。
 示例 2：

 输入：s = 'abcdabcdabcdabcdabcdabcdabcdabcddcbadcbadcbadcbadcbadcbadcbadcba'
 输出：104860361
 解释：共有 3104860382 个不同的非空回文子序列，104860361 对 109 + 7 取模后的值。
  

 提示：

 1 <= s.length <= 1000
 s[i] 仅包含 'a', 'b', 'c' 或 'd'
 */

func countPalindromicSubsequences(_ s: String) -> Int {
    let s = Array(s)
    let mod = Int(1e9 + 7)
    let n = s.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var next = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n)
    var pre = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n)
    for i in 0..<n {
        dp[i][i] = 1
    }
    
    var pos = [Int](repeating: -1, count: 4)
    let aAscii = Character("a").asciiValue!
    for i in pre.indices {
        for c in 0..<4 {
            pre[i][c] = pos[c]
        }
        pos[Int(s[i].asciiValue! - aAscii)] = i
    }
    
    for i in 0..<4 {
        pos[i] = n
    }
    
    for i in next.indices.reversed() {
        for c in 0..<4 {
            next[i][c] = pos[c]
        }
        pos[Int(s[i].asciiValue! - aAscii)] = i
    }
    
    if 1 < n {
        for sz in 2...n {
            var i = 0
            var j = sz - 1
            while j < n {
                if s[i] == s[j] {
                    let low = next[i][Int(s[i].asciiValue! - aAscii)]
                    let high = pre[j][Int(s[i].asciiValue! - aAscii)]
                    if high < low {
                        dp[i][j] = (2 + dp[i+1][j-1]*2) % mod
                    } else if low == high {
                        dp[i][j] = (1 + dp[i+1][j-1]*2) % mod
                    } else {
                        dp[i][j] = (dp[i+1][j-1]*2 - dp[low+1][high-1] + mod) % mod
                    }
                } else {
                    dp[i][j] = (dp[i+1][j] + dp[i][j-1] - dp[i+1][j-1] + mod) % mod
                }
                
                i += 1
                j += 1
            }
        }
    }
    return dp[0][n-1]
}
