//
//  1017.baseNeg2.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/7.
//

import Foundation

/*
 1017. 负二进制转换
 给你一个整数 n ，以二进制字符串的形式返回该整数的 负二进制（base -2）表示。

 注意，除非字符串就是 "0"，否则返回的字符串中不能含有前导零。

 示例 1：

 输入：n = 2
 输出："110"
 解释：(-2)2 + (-2)1 = 2
 示例 2：

 输入：n = 3
 输出："111"
 解释：(-2)2 + (-2)1 + (-2)0 = 3
 示例 3：

 输入：n = 4
 输出："100"
 解释：(-2)2 = 4

 提示：

 0 <= n <= 10^9
 */

func baseNeg2(_ n: Int) -> String {
    if n == 0 || n == 1 {
        return "\(n)"
    }
    var n = n
    var res = ""
    while n != 0 {
        let r = n & 1
        res += "\(r)"
        n -= r
        n /= -2
    }

    return String(res.reversed())
}
