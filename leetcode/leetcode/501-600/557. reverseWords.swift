//
//  557. reverseWords.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/1.
//

import Foundation

/*
 557. 反转字符串中的单词 III
 难度
 简单

 262





 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

  

 示例：

 输入："Let's take LeetCode contest"
 输出："s'teL ekat edoCteeL tsetnoc"
  

 提示：

 在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

 */

func reverseWords(_ s: String) -> String {
//    var arr = s.split(separator: " ")
//    var ans = ""
//    for i in 0..<arr.count {
//        var a = Array(arr[i])
//        ans += String(a.reversed())
//        if i != arr.count - 1 {
//            ans += " "
//        }
//    }
//    return ans
    let arr = Array(s)
    var stack: [Character] = []
    var ans = ""
    for i in arr {
        if i != " " {
            stack.append(i)
        } else {
            while !stack.isEmpty {
                ans += String(stack.popLast()!)
            }
            ans += " "
        }
    }
    
    while !stack.isEmpty {
        ans += String(stack.popLast()!)
    }
    return ans
}
