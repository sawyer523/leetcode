//
//  678.checkValidString.swift
//  678.checkValidString
//
//  Created by Xiaonan Chen on 2021/9/12.
//

import Foundation

/*
 678. 有效的括号字符串
 难度
 中等
 
 311
 
 
 
 
 
 给定一个只包含三种字符的字符串：（ ，） 和 *，写一个函数来检验这个字符串是否为有效字符串。有效字符串具有如下规则：
 
 任何左括号 ( 必须有相应的右括号 )。
 任何右括号 ) 必须有相应的左括号 ( 。
 左括号 ( 必须在对应的右括号之前 )。
 * 可以被视为单个右括号 ) ，或单个左括号 ( ，或一个空字符串。
 一个空字符串也被视为有效字符串。
 示例 1:
 
 输入: "()"
 输出: True
 示例 2:
 
 输入: "(*)"
 输出: True
 示例 3:
 
 输入: "(*))"
 输出: True
 注意:
 
 字符串大小将在 [1，100] 范围内。

 */

func checkValidString(_ s: String) -> Bool {
    var left = 0
    var count = 0
    
    for char in s {
        switch char {
            case "(":
                left += 1
                count += 1
            case ")":
                left = max(left-1, 0)
                count -= 1
                if count < 0 {
                    return false
                }
            default:
                left = max(left-1, 0)
                count += 1
        }
    }
    
    return left == 0
}
