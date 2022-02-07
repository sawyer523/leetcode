//
//  520.detectCapitalUse.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/13.
//

import Foundation

/*
 520. 检测大写字母
 难度
 简单
 
 160
 
 
 
 
 
 我们定义，在以下情况时，单词的大写用法是正确的：
 
 全部字母都是大写，比如 "USA" 。
 单词中所有字母都不是大写，比如 "leetcode" 。
 如果单词不只含有一个字母，只有首字母大写， 比如 "Google" 。
 给你一个字符串 word 。如果大写用法正确，返回 true ；否则，返回 false 。
 
 
 
 示例 1：
 
 输入：word = "USA"
 输出：true
 示例 2：
 
 输入：word = "FlaG"
 输出：false
 
 
 提示：
 
 1 <= word.length <= 100
 word 由小写和大写英文字母组成
 */

func detectCapitalUse(_ word: String) -> Bool {
    if word.count < 2 {
        return true
    }
    if 2 <= word.count && word[0].isLowercase && word[1].isUppercase {
        return false
    }
    
    for i in 2..<word.count {
        if word[i].isLowercase != word[1].isLowercase {
            return false
        }
    }
    return true
}
