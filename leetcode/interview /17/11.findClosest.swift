//
//  11.findClosest.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/27.
//

import Foundation

/*
 面试题 17.11. 单词距离
 难度
 中等

 47





 有个内含单词的超大文本文件，给定任意两个不同的单词，找出在这个文件中这两个单词的最短距离(相隔单词数)。如果寻找过程在这个文件中会重复多次，而每次寻找的单词不同，你能对此优化吗?

 示例：

 输入：words = ["I","am","a","student","from","a","university","in","a","city"], word1 = "a", word2 = "student"
 输出：1
 提示：

 words.length <= 100000
 */

func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
    var ans = words.count
    var index1 = -1
    var index2 = -1
    for (i, word) in words.enumerated() {
        if word == word1 {
            index1 = i
        } else if word == word2 {
            index2 = i
        }
        
        if 0 <= index1 &&
            0 <= index2 {
            ans = min(ans, abs(index2 - index1))
        }
    }
    
    return ans
}
