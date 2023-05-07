//
//  171.titleToNumber.swift
//  171.titleToNumber
//
//  Created by Xiaonan Chen on 2021/7/30.
//

import Foundation

/*
 171. Excel 表列序号
 难度
 简单

 259

 给你一个字符串 columnTitle ，表示 Excel 表格中的列名称。返回该列名称对应的列序号。

 例如，

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...

 示例 1:

 输入: columnTitle = "A"
 输出: 1
 示例 2:

 输入: columnTitle = "AB"
 输出: 28
 示例 3:

 输入: columnTitle = "ZY"
 输出: 701
 示例 4:

 输入: columnTitle = "FXSHRXW"
 输出: 2147483647

 提示：

 1 <= columnTitle.length <= 7
 columnTitle 仅由大写英文组成
 columnTitle 在范围 ["A", "FXSHRXW"] 内

 */

func titleToNumber(_ columnTitle: String) -> Int {
    let map: [Character: Int] = ["A": 1,
                                 "B": 2,
                                 "C": 3,
                                 "D": 4,
                                 "E": 5,
                                 "F": 6,
                                 "G": 7,
                                 "H": 8,
                                 "I": 9,
                                 "J": 10,
                                 "K": 11,
                                 "L": 12,
                                 "M": 13,
                                 "N": 14,
                                 "O": 15,
                                 "P": 16,
                                 "Q": 17,
                                 "R": 18,
                                 "S": 19,
                                 "T": 20,
                                 "U": 21,
                                 "V": 22,
                                 "W": 23,
                                 "X": 24,
                                 "Y": 25,
                                 "Z": 26]
    var ans = 0
    for char in columnTitle {
        ans = 26 * ans + map[char]!
    }
    return ans
}
