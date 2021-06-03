//
//  67.addBinary.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/27.
//

import Foundation

/*
 67. 二进制求和
 难度
 简单

 533





 给你两个二进制字符串，返回它们的和（用二进制表示）。

 输入为 非空 字符串且只包含数字 1 和 0。

  

 示例 1:

 输入: a = "11", b = "1"
 输出: "100"
 示例 2:

 输入: a = "1010", b = "1011"
 输出: "10101"
  

 提示：

 每个字符串仅由字符 '0' 或 '1' 组成。
 1 <= a.length, b.length <= 10^4
 字符串如果不是 "0" ，就都不含前导零。
 通过次数141,586提交次数260,386
 */

func addBinary(_ a: String, _ b: String) -> String {
//    return String(UInt64(a, radix: 2)! + UInt64(b, radix: 2)!, radix: 2)
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
    for i in 0...lidx+1 {
        ia = lidx - i >= 0 ? strA[lidx-i] == "1" ? 1 : 0 : 0
        ib = ridx - i >= 0 ? strB[ridx-i] == "1" ? 1 : 0 : 0
        switch ia+ib+rad {
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
