//
//  1221.balancedStringSplit.swift
//  1221.balancedStringSplit
//
//  Created by Xiaonan Chen on 2021/9/7.
//

import Foundation

/*
 1221. 分割平衡字符串
 难度
 简单

 123

 在一个 平衡字符串 中，'L' 和 'R' 字符的数量是相同的。

 给你一个平衡字符串 s，请你将它分割成尽可能多的平衡字符串。

 注意：分割得到的每个字符串都必须是平衡字符串。

 返回可以通过分割得到的平衡字符串的 最大数量 。

 示例 1：

 输入：s = "RLRRLLRLRL"
 输出：4
 解释：s 可以分割为 "RL"、"RRLL"、"RL"、"RL" ，每个子字符串中都包含相同数量的 'L' 和 'R' 。
 示例 2：

 输入：s = "RLLLLRRRLR"
 输出：3
 解释：s 可以分割为 "RL"、"LLLRRR"、"LR" ，每个子字符串中都包含相同数量的 'L' 和 'R' 。
 示例 3：

 输入：s = "LLLLRRRR"
 输出：1
 解释：s 只能保持原样 "LLLLRRRR".
 示例 4：

 输入：s = "RLRRRLLRLL"
 输出：2
 解释：s 可以分割为 "RL"、"RRRLLRLL" ，每个子字符串中都包含相同数量的 'L' 和 'R' 。

 提示：

 1 <= s.length <= 1000
 s[i] = 'L' 或 'R'
 s 是一个 平衡 字符串
 */

func balancedStringSplit(_ s: String) -> Int {
    var d = 0
    var ans = 0
    for char in s {
        if char == "L" {
            d += 1
        } else if char == "R" {
            d -= 1
        }
        if d == 0 {
            ans += 1
        }
    }
    return ans
}
