//
//  709.toLowerCase.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/12.
//

import Foundation

/*
 709. 转换成小写字母
 难度
 简单
 
 191
 
 
 
 
 
 给你一个字符串 s ，将该字符串中的大写字母转换成相同的小写字母，返回新的字符串。
 
 
 
 示例 1：
 
 输入：s = "Hello"
 输出："hello"
 示例 2：
 
 输入：s = "here"
 输出："here"
 示例 3：
 
 输入：s = "LOVELY"
 输出："lovely"
 
 
 提示：
 
 1 <= s.length <= 100
 s 由 ASCII 字符集中的可打印字符组成
 */

func toLowerCase(_ s: String) -> String {
    return s.lowercased()
}
