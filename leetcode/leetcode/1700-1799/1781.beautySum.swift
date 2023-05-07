//
//  1781.beautySum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/12.
//

import Foundation

/*
 1781. 所有子字符串美丽值之和
 难度
 中等

 29

 一个字符串的 美丽值 定义为：出现频率最高字符与出现频率最低字符的出现次数之差。

 比方说，"abaacc" 的美丽值为 3 - 1 = 2 。
 给你一个字符串 s ，请你返回它所有子字符串的 美丽值 之和。

 示例 1：

 输入：s = "aabcb"
 输出：5
 解释：美丽值不为零的字符串包括 ["aab","aabc","aabcb","abcb","bcb"] ，每一个字符串的美丽值都为 1 。
 示例 2：

 输入：s = "aabcbaa"
 输出：17

 提示：

 1 <= s.length <= 500
 s 只包含小写英文字母。
 */

func beautySum(_ s: String) -> Int {
    var ans = 0
    let n = s.count
    for i in 0 ..< n {
        var cnt: [Character: Int] = [:]
        var maxFreq = 0
        for ch in s[s.index(s.startIndex, offsetBy: i) ..< s.endIndex] {
            cnt[ch, default: 0] += 1
            maxFreq = max(maxFreq, cnt[ch, default: 0])
            var minFreq = n
            for (_, v) in cnt {
                if v > 0 {
                    minFreq = min(minFreq, v)
                }
            }
            ans += maxFreq - minFreq
        }
    }
    return ans
}
