//
//  345.reverseVowels.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 345. 反转字符串中的元音字母
 难度
 简单
 
 136
 
 
 
 
 
 编写一个函数，以字符串作为输入，反转该字符串中的元音字母。
 
 
 
 示例 1：
 
 输入："hello"
 输出："holle"
 示例 2：
 
 输入："leetcode"
 输出："leotcede"
 
 
 提示：
 
 元音字母不包含字母 "y" 。
 
 */

func reverseVowels(_ s: String) -> String {
    var arr = Array(s)
    let vowels: [Character: Int] = [
        "a": 1,
        "e": 1,
        "i": 1,
        "o": 1,
        "u": 1,
        "A": 1,
        "E": 1,
        "I": 1,
        "O": 1,
        "U": 1
    ]

    var start = 0
    var end = arr.count - 1
    while start < end {
        if vowels[arr[start]] == nil {
            start += 1
            continue
        }
        if vowels[arr[end]] == nil {
            end -= 1
            continue
        }

        (arr[start], arr[end]) = (arr[end], arr[start])
        start += 1
        end -= 1
    }

    return String(arr)
}
