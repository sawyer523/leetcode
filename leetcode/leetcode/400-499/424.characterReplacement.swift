//
//  424.characterReplacement.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/2.
//

import Foundation

/*
 424. 替换后的最长重复字符
 难度
 中等

 249

 给你一个仅由大写英文字母组成的字符串，你可以将任意位置上的字符替换成另外的字符，总共可最多替换 k 次。在执行上述操作后，找到包含重复字母的最长子串的长度。

 注意：字符串长度 和 k 不会超过 104。

 示例 1：

 输入：s = "ABAB", k = 2
 输出：4
 解释：用两个'A'替换为两个'B',反之亦然。
 示例 2：

 输入：s = "AABABBA", k = 1
 输出：4
 解释：
 将中间的一个'A'替换为'B',字符串变为 "AABBBBA"。
 子串 "BBBB" 有最长重复字母, 答案为 4。
 */

func characterReplacement(_ s: String, _ k: Int) -> Int {
    var cnt = [Int](repeating: 0, count: 26)
    let tmp = Character("A")
    let AsciiA = tmp.asciiValue!
    let charS = Array(s)
    var maxCount = 0
    var left = 0
    for (right, v) in s.enumerated() {
        cnt[Int(v.asciiValue! - AsciiA)] += 1
        maxCount = max(maxCount, cnt[Int(v.asciiValue! - AsciiA)])
        if right - left + 1 - maxCount > k {
            cnt[Int(charS[left].asciiValue! - AsciiA)] -= 1
            left += 1
        }
    }

    return s.count - left
}
