//
//  434.countSegments.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/1.
//

import Foundation

/*
 434. 字符串中的单词数
 难度
 简单
 
 71
 
 
 
 
 
 统计字符串中的单词个数，这里的单词指的是连续的不是空格的字符。
 
 请注意，你可以假定字符串里不包括任何不可打印的字符。
 
 示例:
 
 输入: "Hello, my name is John"
 输出: 5
 解释: 这里的单词是指连续的不是空格的字符，所以 "Hello," 算作 1 个单词。
 */

func countSegments(_ s: String) -> Int {
    let sArr = Array(s)
    var idx = 0, ans = 0

    while idx < sArr.count {
        while idx < sArr.count && sArr[idx].isWhitespace {
            idx += 1

        }
        if idx == sArr.count {
            break
        }
        ans += 1
        while idx < sArr.count && !sArr[idx].isWhitespace {
            idx += 1

        }
    }
    return ans
}
