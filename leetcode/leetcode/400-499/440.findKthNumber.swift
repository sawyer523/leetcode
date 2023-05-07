//
//  440.findKthNumber.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/23.
//

import Foundation

/*
 440. 字典序的第K小数字
 难度
 困难

 303

 给定整数 n 和 k，返回  [1, n] 中字典序第 k 小的数字。

 示例 1:

 输入: n = 13, k = 2
 输出: 10
 解释: 字典序的排列是 [1, 10, 11, 12, 13, 2, 3, 4, 5, 6, 7, 8, 9]，所以第二小的数字是 10。
 示例 2:

 输入: n = 1, k = 1
 输出: 1

 提示:

 1 <= k <= n <= 10^9
 */

func findKthNumber(_ n: Int, _ k: Int) -> Int {
    func getSteps(_ cur: Int, _ n: Int) -> Int {
        var first = cur
        var last = cur
        var steps = 0
        while first <= n {
            steps += min(last, n) - first + 1
            first *= 10
            last = last * 10 + 9
        }

        return steps
    }

    var cur = 1
    var k = k - 1
    while k > 0 {
        let steps = getSteps(cur, n)
        if steps <= k {
            k -= steps
            cur += 1
        } else {
            cur *= 10
            k -= 1
        }
    }

    return cur
}
