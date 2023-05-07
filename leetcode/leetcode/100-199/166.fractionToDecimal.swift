//
//  166.fractionToDecimal.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/3.
//

import Foundation

/*
 166. 分数到小数
 难度
 中等

 271

 给定两个整数，分别表示分数的分子 numerator 和分母 denominator，以 字符串形式返回小数 。

 如果小数部分为循环小数，则将循环的部分括在括号内。

 如果存在多个答案，只需返回 任意一个 。

 对于所有给定的输入，保证 答案字符串的长度小于 104 。

 示例 1：

 输入：numerator = 1, denominator = 2
 输出："0.5"
 示例 2：

 输入：numerator = 2, denominator = 1
 输出："2"
 示例 3：

 输入：numerator = 2, denominator = 3
 输出："0.(6)"
 示例 4：

 输入：numerator = 4, denominator = 333
 输出："0.(012)"
 示例 5：

 输入：numerator = 1, denominator = 5
 输出："0.2"

 提示：

 -2^31 <= numerator, denominator <= 2^31 - 1
 denominator != 0
 */

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    if numerator % denominator == 0 {
        return String(numerator / denominator)
    }

    var ans: [String] = []
    let nu = numerator < 0
    let de = denominator < 0
    if nu != de {
        ans.append("-")
    }

    let numerator = abs(numerator)
    let denominator = abs(denominator)
    let integer = numerator / denominator
    ans.append(String(integer))
    ans.append(".")

    var indexMap: [Int: Int] = [:]
    var remainder = numerator % denominator
    while remainder != 0 && indexMap[remainder] == nil {
        indexMap[remainder] = ans.count
        remainder *= 10
        ans.append(String(remainder / denominator))
        remainder %= denominator
    }

    if remainder > 0 {
        let insertIndex = indexMap[remainder]!
        ans.insert("(", at: insertIndex)
        ans.append(")")
    }

    return ans.joined()
}
