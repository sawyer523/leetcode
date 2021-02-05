//
//  917.reverseOnlyLetters.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/2.
//

import Foundation

/*
 917. 仅仅反转字母
 难度
 简单

 70





 给定一个字符串 S，返回 “反转后的” 字符串，其中不是字母的字符都保留在原地，而所有字母的位置发生反转。

  

 示例 1：

 输入："ab-cd"
 输出："dc-ba"
 示例 2：

 输入："a-bC-dEf-ghIj"
 输出："j-Ih-gfE-dCba"
 示例 3：

 输入："Test1ng-Leet=code-Q!"
 输出："Qedo1ct-eeLg=ntse-T!"
  

 提示：

 S.length <= 100
 33 <= S[i].ASCIIcode <= 122
 S 中不包含 \ or "

 */


func reverseOnlyLetters(_ S: String) -> String {
    var arr = Array(S)
    var start = 0
    var end = arr.count - 1
    
    func isChar(_ c :Character) -> Bool {
        switch Int(c.asciiValue!) {
        case 65...90:
            fallthrough
        case 97...122:
            return true
        default:
            return false
        }
    }
    
    while start < end {
        if !isChar(arr[start]) {
            start += 1
            continue
        }
        
        if !isChar(arr[end]) {
            end -= 1
            continue
        }
        
        (arr[start], arr[end]) = (arr[end], arr[start])
        start += 1
        end -= 1
    }
    
    return String(arr)
}
