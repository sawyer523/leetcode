//
//  02.CheckPermutation.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/27.
//

import Foundation

/*
 面试题 01.02. 判定是否互为字符重排
 难度
 简单

 96

 给定两个字符串 s1 和 s2，请编写一个程序，确定其中一个字符串的字符重新排列后，能否变成另一个字符串。

 示例 1：

 输入: s1 = "abc", s2 = "bca"
 输出: true
 示例 2：

 输入: s1 = "abc", s2 = "bad"
 输出: false
 说明：

 0 <= len(s1) <= 100
 0 <= len(s2) <= 100
 */

func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
//    return s1.sorted() == s2.sorted()
    if s1.count != s2.count {
        return false
    }
    var m1: [Character: Int] = [:]
    var m2: [Character: Int] = [:]
    for s in zip(s1, s2) {
        m1[s.0, default: 0] += 1
        m2[s.1, default: 0] += 1
    }
    return m1 == m2
}
