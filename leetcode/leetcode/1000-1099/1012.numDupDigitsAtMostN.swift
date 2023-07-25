//
//  1012.numDupDigitsAtMostN.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/20.
//

import Foundation

/*
 1012. 至少有 1 位重复的数字
 给定正整数 n，返回在 [1, n] 范围内具有 至少 1 位 重复数字的正整数的个数。

 示例 1：

 输入：n = 20
 输出：1
 解释：具有至少 1 位重复数字的正数（<= 20）只有 11 。
 示例 2：

 输入：n = 100
 输出：10
 解释：具有至少 1 位重复数字的正数（<= 100）有 11，22，33，44，55，66，77，88，99 和 100 。
 示例 3：

 输入：n = 1000
 输出：262

 提示：

 1 <= n <= 10^9
 */

func numDupDigitsAtMostN(_ n: Int) -> Int {
    let s = Array("\(n)")
    let m = s.count
    var dp = [[Int]](repeating: [Int](repeating: -1, count: 1 << 10), count: m)

    func f(_ i: Int, _ mask: Int, _ isLimit: Bool, _ isNum: Bool) -> Int {
        if i == m {
            return isNum ? 1 : 0
        }

        if !isLimit, isNum, dp[i][mask] != -1 {
            return dp[i][mask]
        }

        var res = 0
        if !isNum {
            res = f(i + 1, mask, false, false)
        }

        let up = isLimit ? Int(s[i].asciiValue! - Character("0").asciiValue!) : 9
        let start = isNum ? 0 : 1
        for d in start ... up {
            if mask >> d & 1 == 0 {
                res += f(i + 1, mask | (1 << d), isLimit && d == up, true)
            }
        }

        if !isLimit, isNum {
            dp[i][mask] = res
        }

        return res
    }

    return n - f(0, 0, true, false)
}
