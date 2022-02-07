//
//  686.repeatedStringMatch.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/22.
//

import Foundation

/*
 686. 重复叠加字符串匹配
 难度
 中等
 
 170
 
 
 
 
 
 给定两个字符串 a 和 b，寻找重复叠加字符串 a 的最小次数，使得字符串 b 成为叠加后的字符串 a 的子串，如果不存在则返回 -1。
 
 注意：字符串 "abc" 重复叠加 0 次是 ""，重复叠加 1 次是 "abc"，重复叠加 2 次是 "abcabc"。
 
 
 
 示例 1：
 
 输入：a = "abcd", b = "cdabcdab"
 输出：3
 解释：a 重复叠加三遍后为 "abcdabcdabcd", 此时 b 是其子串。
 示例 2：
 
 输入：a = "a", b = "aa"
 输出：2
 示例 3：
 
 输入：a = "a", b = "a"
 输出：1
 示例 4：
 
 输入：a = "abc", b = "wxyz"
 输出：-1
 
 
 提示：
 
 1 <= a.length <= 10^4
 1 <= b.length <= 10^4
 a 和 b 由小写英文字母组成
 */

func repeatedStringMatch(_ a: String, _ b: String) -> Int {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let n = haystack.count
        let m = needle.count
        
        if m == 0 {
            return 0
        }
        
        var pi = [Int](repeating: 0, count: m)
        var j = 0
        for i in 1..<m {
            while 0 < j && needle[i] != needle[j] {
                j = pi[j-1]
            }
            
            if needle[i] == needle[j] {
                j += 1
            }
            
            pi[i] = j
        }
        
        var i = 0
        j = 0
        while i-j < n {
            while 0 < j && haystack[i%n] != needle[j] {
                j = pi[j-1]
            }
            
            if haystack[i%n] == needle[j] {
                j += 1
            }
            
            if j == m {
                return i - m + 1
            }
            
            i += 1
        }
        
        return -1
    }
    
    let an = a.count
    let bn = b.count
    let index = strStr(a, b)
    if index == -1 {
        return -1
    }
    
    if bn <= an-index {
        return 1
    }
    
    return (bn + index - an - 1)/an + 2
}
