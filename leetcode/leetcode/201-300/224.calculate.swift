//
//  224.calculate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/10.
//

import Foundation

/*
 224. 基本计算器
 难度
 困难

 405





 实现一个基本的计算器来计算一个简单的字符串表达式 s 的值。

  

 示例 1：

 输入：s = "1 + 1"
 输出：2
 示例 2：

 输入：s = " 2-1 + 2 "
 输出：3
 示例 3：

 输入：s = "(1+(4+5+2)-3)+(6+8)"
 输出：23
  

 提示：

 1 <= s.length <= 3 * 105
 s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
 s 表示一个有效的表达式
 */

func calculate1(_ s: String) -> Int {
    let arr = Array(s)
    let n = arr.count
    var ops = [1]
    var sign = 1
    var i = 0
    var ans = 0
    while i < n {
        switch arr[i] {
        case " ":
            i += 1
        case "+":
            sign = ops.last!
            i += 1
        case "-":
            sign = -ops.last!
            i += 1
        case "(":
            ops.append(sign)
            i += 1
        case ")":
            _ = ops.popLast()
            i += 1
        default:
            var num = 0
            while i < n && arr[i].isNumber {
                num = num * 10 + Int(String(arr[i]))!
                i += 1
            }
            ans += num * sign
        }
    }

    return ans
}
