//
//  132.minCut.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/8.
//

import Foundation

/*
 132. 分割回文串 II
 难度
 困难
 
 274
 
 
 
 
 
 给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是回文。
 
 返回符合要求的 最少分割次数 。
 
 
 
 示例 1：
 
 输入：s = "aab"
 输出：1
 解释：只需一次分割就可将 s 分割成 ["aa","b"] 这样两个回文子串。
 示例 2：
 
 输入：s = "a"
 输出：0
 示例 3：
 
 输入：s = "ab"
 输出：1
 
 
 提示：
 
 1 <= s.length <= 2000
 s 仅由小写英文字母组成
 */

func minCut(_ s: String) -> Int {
    let n = s.count
    var g = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var dp = [Int](repeating: 0, count: n)
    let arr = Array(s)
    for i in 0..<s.count {
        var minCount = i
        for j in 0..<i+1 {
            if arr[j] == arr[i] && (i - j < 3 || g[j + 1][i - 1]) {
                g[j][i] = true
                minCount = min(minCount, j == 0 ? 0 : dp[j - 1] + 1)
            }
        }
        dp[i] = minCount
    }
    return dp[n - 1]
}
