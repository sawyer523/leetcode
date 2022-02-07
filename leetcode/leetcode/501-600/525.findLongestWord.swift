//
//  525.findLongestWord.swift
//  525.findLongestWord
//
//  Created by Xiaonan Chen on 2021/9/14.
//

import Foundation

/*
 524. 通过删除字母匹配到字典里最长单词
 难度
 中等
 
 183
 
 
 
 
 
 给你一个字符串 s 和一个字符串数组 dictionary 作为字典，找出并返回字典中最长的字符串，该字符串可以通过删除 s 中的某些字符得到。
 
 如果答案不止一个，返回长度最长且字典序最小的字符串。如果答案不存在，则返回空字符串。
 
 
 
 示例 1：
 
 输入：s = "abpcplea", dictionary = ["ale","apple","monkey","plea"]
 输出："apple"
 示例 2：
 
 输入：s = "abpcplea", dictionary = ["a","b","c"]
 输出："a"
 
 
 提示：
 
 1 <= s.length <= 1000
 1 <= dictionary.length <= 1000
 1 <= dictionary[i].length <= 1000
 s 和 dictionary[i] 仅由小写英文字母组成
 */

func findLongestWord(_ s: String, _ dictionary: [String]) -> String {
    var ans = ""
    for t in dictionary {
        var i = 0
        for j in s.indices {
            if s[j] == t[i] {
                i += 1
                if i == t.count {
                    if ans.count < t.count || t.count == ans.count && t < ans {
                        ans = t
                    }
                    break
                }
            }
        }
    }
    return ans
}
