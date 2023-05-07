//
//  777.canTransform.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/10/2.
//

import Foundation

/*
 777. 在LR字符串中交换相邻字符
 难度
 中等

 225

 在一个由 'L' , 'R' 和 'X' 三个字符组成的字符串（例如"RXXLRXRXL"）中进行移动操作。一次移动操作指用一个"LX"替换一个"XL"，或者用一个"XR"替换一个"RX"。现给定起始字符串start和结束字符串end，请编写代码，当且仅当存在一系列移动操作使得start可以转换成end时， 返回True。

 示例 :

 输入: start = "RXXLRXRXL", end = "XRLXXRRLX"
 输出: True
 解释:
 我们可以通过以下几步将start转换成end:
 RXXLRXRXL ->
 XRXLRXRXL ->
 XRLXRXRXL ->
 XRLXXRRXL ->
 XRLXXRRLX

 提示：

 1 <= len(start) = len(end) <= 10000。
 start和end中的字符串仅限于'L', 'R'和'X'。
 */

func canTransform(_ start: String, _ end: String) -> Bool {
    var i = 0
    var j = 0
    let n = start.count
    let start = Array(start)
    let end = Array(end)
    while i < n &&
        j < n {
        while i < n &&
            start[i] == "X" {
            i += 1
        }

        while j < n &&
            end[j] == "X" {
            j += 1
        }

        if i < n &&
            j < n {
            if start[i] != end[j] {
                return false
            }

            let c = start[i]
            if c == "L" && i < j ||
                c == "R" && j < i {
                return false
            }
            i += 1
            j += 1
        }
    }

    while i < n {
        if start[i] != "X" {
            return false
        }
        i += 1
    }

    while j < n {
        if end[j] != "X" {
            return false
        }
        j += 1
    }
    return true
}
