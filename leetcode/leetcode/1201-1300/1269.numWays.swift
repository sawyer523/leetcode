//
//  1269.numWays.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/13.
//

import Foundation

/*
 1269. 停在原地的方案数
 难度
 困难
 
 96
 
 
 
 
 
 有一个长度为 arrLen 的数组，开始有一个指针在索引 0 处。
 
 每一步操作中，你可以将指针向左或向右移动 1 步，或者停在原地（指针不能被移动到数组范围外）。
 
 给你两个整数 steps 和 arrLen ，请你计算并返回：在恰好执行 steps 次操作以后，指针仍然指向索引 0 处的方案数。
 
 由于答案可能会很大，请返回方案数 模 10^9 + 7 后的结果。
 
 
 
 示例 1：
 
 输入：steps = 3, arrLen = 2
 输出：4
 解释：3 步后，总共有 4 种不同的方法可以停在索引 0 处。
 向右，向左，不动
 不动，向右，向左
 向右，不动，向左
 不动，不动，不动
 示例  2：
 
 输入：steps = 2, arrLen = 4
 输出：2
 解释：2 步后，总共有 2 种不同的方法可以停在索引 0 处。
 向右，向左
 不动，不动
 示例 3：
 
 输入：steps = 4, arrLen = 2
 输出：8
 
 
 提示：
 
 1 <= steps <= 500
 1 <= arrLen <= 10^6
 */

func numWays(_ steps: Int, _ arrLen: Int) -> Int {
    let mod = Int(1e9 + 7)
    let columns = min(steps, arrLen-1)
//    var dp = [[Int]](repeating: [Int](repeating: 0, count: columns+1), count: steps+1)
    var dp = [Int](repeating: 0, count: columns+1)
    dp[0] = 1
    for i in 1...steps {
        var dpNext = [Int](repeating: 0, count: columns+1)
        for j in 0...columns {
            dpNext[j] = dp[j]
            if 0 <= j-1 {
                dpNext[j] = (dpNext[j] + dp[j-1]) % mod
            }
            if j+1 <= columns {
                dpNext[j] = (dpNext[j] + dp[j+1]) % mod
            }
        }
        dp = dpNext
    }
    return dp[0]
}
