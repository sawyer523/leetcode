//
//  504.convertToBase7.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/7.
//

import Foundation

/*
 504. 七进制数
 难度
 简单
 
 131
 
 
 
 
 
 给定一个整数 num，将其转化为 7 进制，并以字符串形式输出。
 
 
 
 示例 1:
 
 输入: num = 100
 输出: "202"
 示例 2:
 
 输入: num = -7
 输出: "-10"
 
 
 提示：
 
 -10^7 <= num <= 10^7
 */

func convertToBase7(_ num: Int) -> String {
    if num == 0 {
        return "0"
    }
    
    let negative = num < 0
    var num = num
    if negative {
        num = -num
    }
    
    var ans = ""
    while 0 < num {
        ans.append(String(num%7))
        num /= 7
    }
    
    if negative {
        ans.append("-")
    }
    
    return String(ans.reversed())
}
