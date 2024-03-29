//
//  wordPattern.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/16.
//

/*
 290. 单词规律
 难度
 简单

 295

 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。

 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。

 示例1:

 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:

 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:

 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:

 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-pattern
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let arrS = s.split(separator: " ")
    if pattern.count != arrS.count {
        return false
    }

    var dict: [Character: String] = [:]

    for (char, word) in zip(pattern, arrS) {
        guard let keyWord = dict[char] else {
            if dict.values.contains(String(word)) {
                return false
            }
            dict[char] = String(word)
            continue
        }

        if keyWord != word {
            return false
        }
    }

    return true
}
