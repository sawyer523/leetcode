//
//  316.removeDuplicateLetters.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/20.
//

import Foundation

/*
 316. 去除重复字母
 难度
 中等

 300





 给你一个字符串 s ，请你去除字符串中重复的字母，使得每个字母只出现一次。需保证 返回结果的字典序最小（要求不能打乱其他字符的相对位置）。

 注意：该题与 1081 https://leetcode-cn.com/problems/smallest-subsequence-of-distinct-characters 相同

  

 示例 1：

 输入：s = "bcabc"
 输出："abc"
 示例 2：

 输入：s = "cbacdcbc"
 输出："acdb"
  

 提示：

 1 <= s.length <= 10^4
 s 由小写英文字母组成
 */

func removeDuplicateLetters(_ s: String) -> String {
    var dict: [Character: Int] = [:]
    for (i, c) in s.enumerated() {
        dict[c] = i
    }
    
    var stack: [Character] = []
    var dictStack: [Character: Bool] = [:]
    
    for (i, c) in s.enumerated() {
        if !dictStack[c, default: false] {
            while 0 < stack.count && c < stack.last! && i < dict[stack.last!]! {
                dictStack[stack.popLast()!] = false
            }
            stack.append(c)
            dictStack[c] = true
        }
    }
    
    return String(stack)
}
