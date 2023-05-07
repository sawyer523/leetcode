//
//  387.firstUniqChar.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/23.
//

import Foundation

/*
 387. 字符串中的第一个唯一字符
 难度
 简单

 306

 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

 示例：

 s = "leetcode"
 返回 0

 s = "loveleetcode"
 返回 2

 提示：你可以假定该字符串只包含小写字母。
 */

func firstUniqChar(_ s: String) -> Int {
    var arr: [Int] = Array(repeating: 0, count: 26)
    for char in s {
        arr[Int(char.asciiValue!) - 97] += 1
    }

    for (i, v) in s.enumerated() {
        if arr[Int(v.asciiValue! - 97)] == 1 {
            return i
        }
    }

    return -1
}
