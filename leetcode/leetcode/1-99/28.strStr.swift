//
//  28.strStr.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/20.
//

import Foundation

/*
 28. 实现 strStr()
 难度
 简单

 805

 实现 strStr() 函数。

 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

 说明：

 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。

 示例 1：

 输入：haystack = "hello", needle = "ll"
 输出：2
 示例 2：

 输入：haystack = "aaaaa", needle = "bba"
 输出：-1
 示例 3：

 输入：haystack = "", needle = ""
 输出：0

 提示：

 0 <= haystack.length, needle.length <= 5 * 104
 haystack 和 needle 仅由小写英文字符组成
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    let n = haystack.count
    let m = needle.count
    if m == 0 {
        return 0
    }
    var pi = [Int](repeating: 0, count: m)
    var i = 1, j = 0
    while i < m {
        while j > 0 && needle[i] != needle[j] {
            j = pi[j - 1]
        }
        if needle[i] == needle[j] {
            j += 1
        }
        pi[i] = j
        i += 1
    }

    i = 0
    j = 0
    while i < n {
        while j > 0 && haystack[i] != needle[j] {
            j = pi[j - 1]
        }
        if haystack[i] == needle[j] {
            j += 1
        }
        if j == m {
            return i - m + 1
        }
        i += 1
    }

    return -1
}
