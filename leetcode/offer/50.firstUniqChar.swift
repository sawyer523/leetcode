//
//  50.firstUniqChar.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/15.
//

import Foundation

/*
 剑指 Offer 50. 第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 示例 1:

 输入：s = "abaccdeff"
 输出：'b'
 示例 2:

 输入：s = ""
 输出：' '

 限制：

 0 <= s 的长度 <= 50000
 */

func firstUniqChar(_ s: String) -> Character {
    let a: Character = "a"
    let aAscii = a.asciiValue
    if s.isEmpty {
        return " "
    }
    var arr = [Int](repeating: 0, count: 26)
    for char in s {
        let tem = Int(char.asciiValue! - aAscii!)
        arr[tem] += 1
    }
    for char in s {
        let tem = Int(char.asciiValue! - aAscii!)
        if arr[tem] == 1 {
            return char
        }
    }

    return " "
}
