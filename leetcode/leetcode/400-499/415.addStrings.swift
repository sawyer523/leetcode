//
//  415.addStrings.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/17.
//

import Foundation

/*
 415. 字符串相加
 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和并同样以字符串形式返回。

 你不能使用任何內建的用于处理大整数的库（比如 BigInteger）， 也不能直接将输入的字符串转换为整数形式。

 示例 1：

 输入：num1 = "11", num2 = "123"
 输出："134"
 示例 2：

 输入：num1 = "456", num2 = "77"
 输出："533"
 示例 3：

 输入：num1 = "0", num2 = "0"
 输出："0"

 提示：

 1 <= num1.length, num2.length <= 10^4
 num1 和num2 都只包含数字 0-9
 num1 和num2 都不包含任何前导零
 */
func addStrings(_ num1: String, _ num2: String) -> String {
    var add = 0
    var ans = ""
    var i = num1.count - 1
    var j = num2.count - 1
    let num1 = Array(num1).map { String($0) }
    let num2 = Array(num2).map { String($0) }
    while 0 <= i ||
        0 <= j ||
        add != 0 {
        var x = 0
        var y = 0
        if 0 <= i {
            x = Int(num1[i])!
        }
        if 0 <= j {
            y = Int(num2[j])!
        }
        let res = x + y + add
        ans = String(res % 10) + ans
        add = res / 10
        i -= 1
        j -= 1
    }
    return ans
}
