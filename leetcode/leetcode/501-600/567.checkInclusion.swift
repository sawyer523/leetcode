//
//  567.checkInclusion.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/10.
//

import Foundation

/*
 567. 字符串的排列
 难度
 中等

 237





 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。

 示例1:

 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
  

 示例2:

 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
  

 注意：

 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间

 */

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let n = s1.count
    let m = s2.count
    if m < n {
        return false
    }

    let s2Arr = Array(s2)

    var ans1 = [Int](repeating: 0, count: 26)
    let zero = Character("a").asciiValue!

    for (i, v) in s1.enumerated() {
        ans1[Int(v.asciiValue! - zero)] += 1
        ans1[Int(s2Arr[i].asciiValue! - zero)] -= 1
    }

    func allZero() -> Bool {
        for i in 0..<26 {
            if ans1[i] != 0 {
                return false
            }
        }
        return true
    }

    if allZero() {
        return true
    }

    for i in n..<m {
        ans1[Int(s2Arr[i].asciiValue! - zero)] -= 1
        ans1[Int(s2Arr[i-n].asciiValue! - zero)] += 1
        if allZero() {
            return true
        }
    }

    return false
}
