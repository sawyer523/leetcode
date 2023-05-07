//
//  58.lengthOfLastWord.swift
//  58.lengthOfLastWord
//
//  Created by Xiaonan Chen on 2021/9/21.
//

import Foundation

/*
 58. 最后一个单词的长度
 难度
 简单

 360

 给你一个字符串 s，由若干单词组成，单词前后用一些空格字符隔开。返回字符串中最后一个单词的长度。

 单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。

 示例 1：

 输入：s = "Hello World"
 输出：5
 示例 2：

 输入：s = "   fly me   to   the moon  "
 输出：4
 示例 3：

 输入：s = "luffy is still joyboy"
 输出：6

 提示：

 1 <= s.length <= 104
 s 仅有英文字母和空格 ' ' 组成
 s 中至少存在一个单词

 */

func lengthOfLastWord(_ s: String) -> Int {
//    var ans = 0
//    var index = s.count - 1
//    while s[index] == " " {
//        index -= 1
//    }
//
//    while 0 <= index && s[index] != " " {
//        ans += 1
//        index -= 1
//    }
//
//    return ans
    let chars = s.split(separator: " ")
    if let last = chars.last {
        return last.count
    }
    return 0
}
