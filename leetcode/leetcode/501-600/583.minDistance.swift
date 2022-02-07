//
//  583.minDistance.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/9/25.
//

import Foundation

/*
 583. 两个字符串的删除操作
 难度
 中等
 
 261
 
 
 
 
 
 给定两个单词 word1 和 word2，找到使得 word1 和 word2 相同所需的最小步数，每步可以删除任意一个字符串中的一个字符。
 
 
 
 示例：
 
 输入: "sea", "eat"
 输出: 2
 解释: 第一步将"sea"变为"ea"，第二步将"eat"变为"ea"
 
 
 提示：
 
 给定单词的长度不超过500。
 给定单词中的字符只含有小写字母。
 */

func minDistance(_ word1: String, _ word2: String) -> Int {
    let m = word1.count
    let n = word2.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
    
    for i in 0..<m {
        for j in 0..<n {
            if word1[i] == word2[j] {
                dp[i+1][j+1] = dp[i][j] + 1
            } else {
                dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
            }
        }
    }
    
    return m + n - dp[m][n]*2
}
