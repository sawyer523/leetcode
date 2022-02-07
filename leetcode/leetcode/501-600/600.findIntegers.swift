//
//  600.findIntegers.swift
//  600.findIntegers
//
//  Created by Xiaonan Chen on 2021/9/11.
//

import Foundation

/*
 600. 不含连续1的非负整数
 难度
 困难
 
 139
 
 
 
 
 
 给定一个正整数 n，找出小于或等于 n 的非负整数中，其二进制表示不包含 连续的1 的个数。
 
 示例 1:
 
 输入: 5
 输出: 5
 解释:
 下面是带有相应二进制表示的非负整数<= 5：
 0 : 0
 1 : 1
 2 : 10
 3 : 11
 4 : 100
 5 : 101
 其中，只有整数3违反规则（有两个连续的1），其他5个满足规则。
 说明: 1 <= n <= 10^9
 

 */

func findIntegers(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: 31)
    dp[0] = 1
    dp[1] = 1
    
    for i in 2..<31 {
        dp[i] = dp[i-1] + dp[i-2]
    }
    
    var n = n
    var ans = 0
    var pre = 0
    for i in stride(from: 29, through: 0, by: -1) {
        let val = 1 << i
        if 0 < n&val {
            n ^= val
            ans += dp[i+1]
            if pre == 1 {
                break
            }
            pre = 1
        } else {
            pre = 0
        }
        
        if i == 0 {
            ans += 1
        }
    }
    
    return ans
}

