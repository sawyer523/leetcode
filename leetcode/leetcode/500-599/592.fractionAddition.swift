//
//  592.fractionAddition.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/27.
//

import Foundation

/*
 592. 分数加减运算
 难度
 中等

 76

 给定一个表示分数加减运算的字符串 expression ，你需要返回一个字符串形式的计算结果。

 这个结果应该是不可约分的分数，即最简分数。 如果最终结果是一个整数，例如 2，你需要将它转换成分数形式，其分母为 1。所以在上述例子中, 2 应该被转换为 2/1。

 示例 1:

 输入: expression = "-1/2+1/2"
 输出: "0/1"
  示例 2:

 输入: expression = "-1/2+1/2+1/3"
 输出: "1/3"
 示例 3:

 输入: expression = "1/3-1/2"
 输出: "-1/6"

 提示:

 输入和输出字符串只包含 '0' 到 '9' 的数字，以及 '/', '+' 和 '-'。
 输入和输出分数格式均为 ±分子/分母。如果输入的第一个分数或者输出的分数是正数，则 '+' 会被省略掉。
 输入只包含合法的最简分数，每个分数的分子与分母的范围是  [1,10]。 如果分母是1，意味着这个分数实际上是一个整数。
 输入的分数个数范围是 [1,10]。
 最终结果的分子与分母保证是 32 位整数范围内的有效整数。
 */

func fractionAddition(_ expression: String) -> String {
    var denominator = 0
    var numerator = 1
    let n = expression.count
    var i = 0
    let arr = Array(expression)
    while i < n {
        var denominator1 = 0
        var sign = 1
        if arr[i] == "-" || arr[i] == "+" {
            if arr[i] == "-" {
                sign = -1
            }
            i += 1
        }

        while i < n && arr[i].isNumber {
            denominator1 = denominator1 * 10 + Int(String(arr[i]))!
            i += 1
        }

        denominator1 *= sign
        i += 1

        var numerator1 = 0
        while i < n && arr[i].isNumber {
            numerator1 = numerator1 * 10 + Int(String(arr[i]))!
            i += 1
        }

        denominator = denominator * numerator1 + denominator1 * numerator
        numerator *= numerator1
    }

    if denominator == 0 {
        return "0/1"
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while a != 0 {
            (a, b) = (b % a, a)
        }
        return b
    }

    let g = gcd(abs(denominator), numerator)
    return String(format: "%d/%d", denominator / g, numerator / g)
}
