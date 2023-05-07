//
//  640.solveEquation.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/31.
//

import Foundation

/*
 640. 求解方程
 难度
 中等

 62

 求解一个给定的方程，将x以字符串"x=#value"的形式返回。该方程仅包含'+'，' - '操作，变量 x 和其对应系数。

 如果方程没有解，请返回“No solution”。

 如果方程有无限解，则返回“Infinite solutions”。

 如果方程中只有一个解，要保证返回值 x 是一个整数。

 示例 1：

 输入: "x+5-3+x=6+x-2"
 输出: "x=2"
 示例 2:

 输入: "x=x"
 输出: "Infinite solutions"
 示例 3:

 输入: "2x=x"
 输出: "x=0"
 示例 4:

 输入: "2x+3x-6x=x+2"
 输出: "x=-1"
 示例 5:

 输入: "x=x+2"
 输出: "No solution"

 */

func solveEquation(_ equation: String) -> String {
    var equal = 1
    var cal = 1
    var x = 0
    var num = 0
    var temp = ""
    for i in Array(equation) {
        switch i {
        case "x":
            x += Int(temp == "" ? "1" : temp)! * equal * cal
            temp = ""
        case "+":
            num += Int(temp == "" ? "0" : temp)! * cal * equal
            temp = ""
            cal = 1
        case "-":
            num += Int(temp == "" ? "0" : temp)! * cal * equal
            temp = ""
            cal = -1
        case "=":
            num += Int(temp == "" ? "0" : temp)! * cal * equal
            equal = -1
            cal = 1
            temp = ""
        default:
            temp += String(i)
        }
    }

    if temp != "" {
        num += Int(temp == "" ? "0" : temp)! * cal * equal
    }

    if x == 0 && num == 0 {
        return "Infinite solutions"
    } else if x == 0 && num != 0 {
        return "No solution"
    }
    return String(format: "x=%d", -num / x)
}
