//
//  500.findWords.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/31.
//

import Foundation

/*
 500. 键盘行
 难度
 简单
 
 165
 
 
 
 
 
 给你一个字符串数组 words ，只返回可以使用在 美式键盘 同一行的字母打印出来的单词。键盘如下图所示。
 
 美式键盘 中：
 
 第一行由字符 "qwertyuiop" 组成。
 第二行由字符 "asdfghjkl" 组成。
 第三行由字符 "zxcvbnm" 组成。
 American keyboard
 
 
 
 示例 1：
 
 输入：words = ["Hello","Alaska","Dad","Peace"]
 输出：["Alaska","Dad"]
 示例 2：
 
 输入：words = ["omk"]
 输出：[]
 示例 3：
 
 输入：words = ["adsdf","sfd"]
 输出：["adsdf","sfd"]
 
 
 提示：
 
 1 <= words.length <= 20
 1 <= words[i].length <= 100
 words[i] 由英文字母（小写和大写字母）组成
 */

func findWords(_ words: [String]) -> [String] {
    let rowIdx: [UInt8] = [1,2,2,1,0,1,1,1,0,1,1,1,2,2,0,0,0,0,1,0,0,2,0,2,0,2]
    let zero = Character("a").asciiValue!
    var ans: [String] = []
    for word in words {
        var isValid = true
        let word1 = word.lowercased()
        let idx = rowIdx[Int(word1[0].asciiValue! - zero)]
        for i in 1..<word1.count {
            if rowIdx[Int(word1[i].asciiValue! - zero)] != idx {
                isValid = false
                break
            }
        }
        if isValid {
            ans.append(word)
        }
    }
    return ans
}
