//
//  273.numberToWords.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/11.
//

import Foundation

/*
 273. 整数转换英文表示
 难度
 困难

 171

 将非负整数 num 转换为其对应的英文表示。

 示例 1：

 输入：num = 123
 输出："One Hundred Twenty Three"
 示例 2：

 输入：num = 12345
 输出："Twelve Thousand Three Hundred Forty Five"
 示例 3：

 输入：num = 1234567
 输出："One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 示例 4：

 输入：num = 1234567891
 输出："One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

 提示：

 0 <= num <= 2^31 - 1
 */

func numberToWords(_ num: Int) -> String {
    if num == 0 {
        return "Zero"
    }
    let singles = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    let teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let tens = ["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    let thousands = ["", "Thousand", "Million", "Billion"]

    var ans = ""
    let space = " "
    func recursion(_ num: Int) {
        switch num {
        case 0: break
        case 1 ..< 10:
            ans += singles[num]
            ans += space
        case 10 ..< 20:
            ans += teens[num - 10]
            ans += space
        case 20 ..< 100:
            ans += tens[num / 10]
            ans += space
            recursion(num % 10)
        default:
            ans += singles[num / 100]
            ans += " Hundred "
            recursion(num % 100)
        }
    }

    var num = num
    var i = 3
    var unit = Int(1e9)
    while i >= 0 {
        let curNum = Int(num / unit)
        if curNum > 0 {
            num -= curNum * unit
            recursion(curNum)
            ans += thousands[i]
            ans += space
        }
        unit /= 1000
        i -= 1
    }
    return ans.trimmingCharacters(in: CharacterSet.whitespaces)
}
