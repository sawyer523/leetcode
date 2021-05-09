//
//  227.calculate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/11.
//

import Foundation

/*
 227. 基本计算器 II
 难度
 中等

 296





 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。

 整数除法仅保留整数部分。

  

 示例 1：

 输入：s = "3+2*2"
 输出：7
 示例 2：

 输入：s = " 3/2 "
 输出：1
 示例 3：

 输入：s = " 3+5 / 2 "
 输出：5
  

 提示：

 1 <= s.length <= 3 * 105
 s 由整数和算符 ('+', '-', '*', '/') 组成，中间由一些空格隔开
 s 表示一个 有效表达式
 表达式中的所有整数都是非负整数，且在范围 [0, 231 - 1] 内
 题目数据保证答案是一个 32-bit 整数
 */

func calculate2(_ s: String) -> Int {
    var stack: [Int] = []
    var preSign: Character = "+"
    var num = 0
    for ch in s+"+" where ch != " " {
        if let number = ch.wholeNumberValue {
            num = num*10 + number
        } else {
            switch preSign {
            case "+":
                stack.append(num)
            case "-":
                stack.append(-num)
            case "*":
                stack.append(stack.removeLast() * num)
            default:
                stack.append(stack.removeLast() / num)
            }
            preSign = ch
            num = 0
        }
    }
    return stack.reduce(0, +)
}
