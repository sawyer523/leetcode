//
//  05.oneEditAway.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/13.
//

import Foundation

/*
 面试题 01.05. 一次编辑
 难度
 中等

 144





 字符串有三种编辑操作:插入一个字符、删除一个字符或者替换一个字符。 给定两个字符串，编写一个函数判定它们是否只需要一次(或者零次)编辑。

  

 示例 1:

 输入:
 first = "pale"
 second = "ple"
 输出: True
  

 示例 2:

 输入:
 first = "pales"
 second = "pal"
 输出: False
 */

func oneEditAway(_ first: String, _ second: String) -> Bool {
    let m = first.count
    let n = second.count
    
    if m < n {
        return oneEditAway(second, first)
    }
    
    if 1 < m - n {
        return false
    }
    
    for (i, ch) in second.enumerated() {
        if first[first.index(first.startIndex, offsetBy: i)] != ch {
            if m == n {
                return first[first.index(first.startIndex, offsetBy: i+1)..<first.endIndex] == second[second.index(second.startIndex, offsetBy: i+1)..<second.endIndex]
            }
            return first[first.index(first.startIndex, offsetBy: i+1)..<first.endIndex] == second[first.index(second.startIndex, offsetBy: i)..<second.endIndex]
        }
    }
    
    return true
}
