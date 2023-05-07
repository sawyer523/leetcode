//
//  168.convertToTitle.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/29.
//

import Foundation

/*
 168. Excel表列名称
 难度
 简单

 369

 给定一个正整数，返回它在 Excel 表中相对应的列名称。

 例如，

 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...
 示例 1:

 输入: 1
 输出: "A"
 示例 2:

 输入: 28
 输出: "AB"
 示例 3:

 输入: 701
 输出: "ZY"
 */

func convertToTitle(_ columnNumber: Int) -> String {
    var map: [Int: String] = [:]
    for i in 0 ..< 26 {
        map[i + 1] = String(UnicodeScalar(Character("A").asciiValue! + UInt8(i)))
    }

    var c = columnNumber
    var ans = ""
    while c > 0 {
        let a = (c - 1) % 26 + 1
        ans += map[a]!
        c = (c - a) / 26
    }
    return String(ans.reversed())
}
