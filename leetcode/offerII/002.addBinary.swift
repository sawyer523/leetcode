//
//  002.addBinary.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/10.
//

import Foundation

/*
 剑指 Offer II 002. 二进制加法
 给定两个 01 字符串 a 和 b ，请计算它们的和，并以二进制字符串的形式输出。

 输入为 非空 字符串且只包含数字 1 和 0。

 示例 1:

 输入: a = "11", b = "10"
 输出: "101"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"

 提示：

 每个字符串仅由字符 '0' 或 '1' 组成。
 1 <= a.length, b.length <= 10^4
 字符串如果不是 "0" ，就都不含前导零。
 */

func addBinary2(_ a: String, _ b: String) -> String {
    var strA: [Character]
    var strB: [Character]
    if a.count > b.count {
        strA = Array(a)
        strB = Array(b)
    } else {
        strA = Array(b)
        strB = Array(a)
    }

    let lidx = strA.count - 1
    let ridx = strB.count - 1
    var rad = 0
    var str = ""
    var ia = 0
    var ib = 0
    for i in 0 ... lidx + 1 {
        ia = lidx - i >= 0 ? strA[lidx - i] == "1" ? 1 : 0 : 0
        ib = ridx - i >= 0 ? strB[ridx - i] == "1" ? 1 : 0 : 0
        switch ia + ib + rad {
        case 3:
            str = "1" + str
            rad = 1
        case 2:
            str = "0" + str
            rad = 1
        case 1:
            str = "1" + str
            rad = 0
        case 0:
            str = "0" + str
            rad = 0
        default:
            break
        }
    }

    return str.first == "0" ? String(str.dropFirst()) : str
}
