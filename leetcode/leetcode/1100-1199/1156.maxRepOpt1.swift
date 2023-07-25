//
//  1156.maxRepOpt1.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/6/3.
//

import Foundation

/*
 1156. 单字符重复子串的最大长度
 如果字符串中的所有字符都相同，那么这个字符串是单字符重复的字符串。

 给你一个字符串 text，你只能交换其中两个字符一次或者什么都不做，然后得到一些单字符重复的子串。返回其中最长的子串的长度。

 示例 1：

 输入：text = "ababa"
 输出：3
 示例 2：

 输入：text = "aaabaaa"
 输出：6
 示例 3：

 输入：text = "aaabbaaa"
 输出：4
 示例 4：

 输入：text = "aaaaa"
 输出：5
 示例 5：

 输入：text = "abcdef"
 输出：1

 提示：

 1 <= text.length <= 20000
 text 仅由小写英文字母组成。
 */

func maxRepOpt1(_ text: String) -> Int {
    var count: [Character: Int] = [:]
    for c in text {
        count[c, default: 0] += 1
    }

    var res = 0
    var i = 0
    let text = Array(text)
    let n = text.count
    while i < n {
        var j = i
        while j < n &&
            text[j] == text[i] {
            j += 1
        }
        var curCnt = j - i

        if curCnt < count[text[i]]! &&
            (j < n || 0 < i) {
            res = max(res, curCnt + 1)
        }

        var k = j + 1
        while k < n &&
            text[k] == text[i] {
            k += 1
        }
        res = max(res, min(k - i, count[text[i]]!))
        i = j
    }
    return res
}
