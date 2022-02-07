//
//  282.addOperators.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/16.
//

import Foundation

/*
 282. 给表达式添加运算符
 难度
 困难
 
 271
 
 
 
 
 
 给定一个仅包含数字 0-9 的字符串 num 和一个目标值整数 target ，在 num 的数字之间添加 二元 运算符（不是一元）+、- 或 * ，返回所有能够得到目标值的表达式。
 
 
 
 示例 1:
 
 输入: num = "123", target = 6
 输出: ["1+2+3", "1*2*3"]
 示例 2:
 
 输入: num = "232", target = 8
 输出: ["2*3+2", "2+3*2"]
 示例 3:
 
 输入: num = "105", target = 5
 输出: ["1*0+5","10-5"]
 示例 4:
 
 输入: num = "00", target = 0
 输出: ["0+0", "0-0", "0*0"]
 示例 5:
 
 输入: num = "3456237490", target = 9191
 输出: []
 
 
 提示：
 
 1 <= num.length <= 10
 num 仅含数字
 -2^31 <= target <= 2^31 - 1
 */
func addOperators(_ num: String, _ target: Int) -> [String] {
    let n = num.count
    var ans: [String] = []
    func backtrack(_ expr: [String], _ i: Int, _ res: Int, _ mul: Int) {
        var expr = expr
        if i == n {
            if res == target {
                ans.append(expr.joined())
            }
            return
        }
        
        let start = expr.count
        if 0 < i {
            expr.append("0")
        }
        
        var val = 0
        for j in i..<n where j==i || num[i] != "0" {
            let s = String(num[j])
            val = val * 10 + Int(s)!
            expr.append(s)
            if i == 0 {
                backtrack(expr, j+1, val, val)
            } else {
                expr[start] = "+"
                backtrack(expr, j+1, res+val, val)
                expr[start] = "-"
                backtrack(expr, j+1, res-val, -val)
                expr[start] = "*"
                backtrack(expr, j+1, res - mul + mul * val, mul * val)
            }
        }
    }
    backtrack([], 0, 0, 0)
    return ans
}
