//
//  438.findAnagrams.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/28.
//

import Foundation

/*
 438. 找到字符串中所有字母异位词
 难度
 中等

 675

 给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。

 异位词 指由相同字母重排列形成的字符串（包括相同的字符串）。

 示例 1:

 输入: s = "cbaebabacd", p = "abc"
 输出: [0,6]
 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
 示例 2:

 输入: s = "abab", p = "ab"
 输出: [0,1,2]
 解释:
 起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
 起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
 起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。

 提示:

 1 <= s.length, p.length <= 3 * 10^4
 s 和 p 仅包含小写字母

 */

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    let n = s.count
    let m = p.count

    if n < m {
        return []
    }

    var cntP = [Int](repeating: 0, count: 26)
    var cntS = [Int](repeating: 0, count: 26)
    for i in 0 ..< m {
        cntP[Int(p[i].asciiValue! - 97)] += 1
        cntS[Int(s[i].asciiValue! - 97)] += 1
    }

    var ans: [Int] = []
    if cntS.elementsEqual(cntP) {
        ans.append(0)
    }

    for i in m ..< n {
        cntS[Int(s[i].asciiValue! - 97)] += 1
        cntS[Int(s[i - m].asciiValue! - 97)] -= 1
        if cntP.elementsEqual(cntS) {
            ans.append(i - m + 1)
        }
    }

    return ans
}
