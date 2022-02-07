//
//  318.maxProduct.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/17.
//

import Foundation

/*
 318. 最大单词长度乘积
 难度
 中等
 
 208
 
 
 
 
 
 给定一个字符串数组 words，找到 length(word[i]) * length(word[j]) 的最大值，并且这两个单词不含有公共字母。你可以认为每个单词只包含小写字母。如果不存在这样的两个单词，返回 0。
 
 
 
 示例 1:
 
 输入: ["abcw","baz","foo","bar","xtfn","abcdef"]
 输出: 16
 解释: 这两个单词为 "abcw", "xtfn"。
 示例 2:
 
 输入: ["a","ab","abc","d","cd","bcd","abcd"]
 输出: 4
 解释: 这两个单词为 "ab", "cd"。
 示例 3:
 
 输入: ["a","aa","aaa","aaaa"]
 输出: 0
 解释: 不存在这样的两个单词。
 
 
 提示：
 
 2 <= words.length <= 1000
 1 <= words[i].length <= 1000
 words[i] 仅包含小写字母
 */

func maxProduct(_ words: [String]) -> Int {
    let zeroAscii = Character("a").asciiValue!
    var masks: [Int: Int] = [:]
    for word in words {
        var mask = 0
        for char in word {
            mask |= 1 << (char.asciiValue! - zeroAscii)
        }
        if masks[mask, default: 0] < word.count {
            masks[mask] = word.count
        }
    }
    
    var ans = 0
    for (x, lenX) in masks {
        for (y, lenY) in masks {
            if x&y == 0 &&
                ans < lenX * lenY {
                ans = lenX * lenY
            }
        }
    }
    
    return ans
}
