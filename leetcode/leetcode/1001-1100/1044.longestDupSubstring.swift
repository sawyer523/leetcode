//
//  1044.longestDupSubstring.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/23.
//

import Foundation

/*
 1044. 最长重复子串
 难度
 困难
 
 175
 
 
 
 
 
 给你一个字符串 s ，考虑其所有 重复子串 ：即，s 的连续子串，在 s 中出现 2 次或更多次。这些出现之间可能存在重叠。
 
 返回 任意一个 可能具有最长长度的重复子串。如果 s 不含重复子串，那么答案为 "" 。
 
 
 
 示例 1：
 
 输入：s = "banana"
 输出："ana"
 示例 2：
 
 输入：s = "abcd"
 输出：""
 
 
 提示：
 
 2 <= s.length <= 3 * 10^4
 s 由小写英文字母组成

 */

func longestDupSubstring(_ s: String) -> String {
    let s = Array(s)
    let aAsciiValue = Int(Character("a").asciiValue!)
    let nums = s.map { Int($0.asciiValue!) - aAsciiValue }
    let modulus = 1_000_000_007
    
    func search(_ l:Int) -> Int {
        let aL = (0 ..< l).reduce(1) { aL, _ in (aL * 26) % modulus }
        var h = (0 ..< l).reduce(0) {($0 * 26 + nums[$1]) % modulus}
        var seen = [h: [0]]
        for start in 1 ..< nums.count-l+1 {
            h = (((h * 26 - nums[start-1] * aL) % modulus + modulus) + nums[start+l-1]) % modulus
            if let hits = seen[h] {
                let cur = s[start ..< start+l]
                for i in hits where s[i ..< i+l] == cur {
                    return i
                }
            }
            seen[h, default:.init()].append(start)
        }
        return -1
    }
    
    var left = 1, right = nums.count
    while left <= right {
        let mid = (left + right) >> 1
        if search(mid) != -1 {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    let start = search(left - 1)
    return String(s[start ..< start + left - 1])
}
