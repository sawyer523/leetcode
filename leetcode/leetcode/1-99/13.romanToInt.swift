//
//  13.romanToInt.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/31.
//

import Foundation

/*
 13. 罗马数字转整数
 难度
 简单

 1162

 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

 示例 1:

 输入: "III"
 输出: 3
 示例 2:

 输入: "IV"
 输出: 4
 示例 3:

 输入: "IX"
 输出: 9
 示例 4:

 输入: "LVIII"
 输出: 58
 解释: L = 50, V= 5, III = 3.
 示例 5:

 输入: "MCMXCIV"
 输出: 1994
 解释: M = 1000, CM = 900, XC = 90, IV = 4.

 提示：

 题目所给测试用例皆符合罗马数字书写规则，不会出现跨位等情况。
 IC 和 IM 这样的例子并不符合题目要求，49 应该写作 XLIX，999 应该写作 CMXCIX 。
 关于罗马数字的详尽书写规则，可以参考 罗马数字 - Mathematics 。
 */

func romanToInt(_ s: String) -> Int {
    func getNum(_ s: Character) -> Int {
        switch s {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }
    let sArray = Array(s)
    var pre = getNum(sArray[0])
    var result = 0

    for i in 1 ..< sArray.count {
        let temp = getNum(sArray[i])
        if pre < temp { // 前面一位 < 后面一位，减
            result -= pre
        } else { // 前面一位 > 后面一位， 加
            result += pre
        }
        pre = temp
    }
    result += pre
    return result
//    let map = [
//        "I":             1,
//        "V":             5,
//        "X":             10,
//        "L":             50,
//        "C":             100,
//        "D":             500,
//        "M":             1000
//    ]
//    let map1 = [
//        "IV": 4,
//        "IX": 9,
//        "XL": 40,
//        "XC": 90,
//        "CD": 400,
//        "CM": 900
//    ]
//
//    var i = 0
//    let arr = Array(s)
//    var ans = 0
//    while i < arr.count-1 {
//        let char = String(arr[i])
//        let char2 = String(arr[i+1])
//        if let a = map1[char+char2] {
//            i+=1
//            ans += a
//        } else {
//            ans += map[char]!
//        }
//        i += 1
//    }
//
//    if i == arr.count-1 {
//        ans += map[String(arr.last!)]!
//    }
//    return ans
}
