//
//  46.translateNum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/20.
//

import Foundation

/*
 剑指 Offer 46. 把数字翻译成字符串
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。

 示例 1:

 输入: 12258
 输出: 5
 解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi"

 提示：

 0 <= num < 2^31

 */

func translateNum(_ num: Int) -> Int {
    let src = Array("\(num)")
    var p = 0
    var q = 0
    var r = 1
    for i in 0 ..< src.count {
        (p, q, r) = (q, r, 0)
        r += q
        if i == 0 {
            continue
        }

        let pre = String(src[i - 1 ..< i + 1])
        if pre <= "25", "10" <= pre {
            r += p
        }
    }

    return r
}
