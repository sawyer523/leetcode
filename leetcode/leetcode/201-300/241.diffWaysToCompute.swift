//
//  241.diffWaysToCompute.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/1.
//

import Foundation

/*
 241. 为运算表达式设计优先级
 难度
 中等

 597

 收藏

 分享
 切换为英文
 接收动态
 反馈
 给你一个由数字和运算符组成的字符串 expression ，按不同优先级组合数字和运算符，计算并返回所有可能组合的结果。你可以 按任意顺序 返回答案。

 生成的测试用例满足其对应输出值符合 32 位整数范围，不同结果的数量不超过 104 。

  

 示例 1：

 输入：expression = "2-1-1"
 输出：[0,2]
 解释：
 ((2-1)-1) = 0
 (2-(1-1)) = 2
 示例 2：

 输入：expression = "2*3-4*5"
 输出：[-34,-14,-10,-10,10]
 解释：
 (2*(3-(4*5))) = -34
 ((2*3)-(4*5)) = -14
 ((2*(3-4))*5) = -10
 (2*((3-4)*5)) = -10
 (((2*3)-4)*5) = 10
  

 提示：

 1 <= expression.length <= 20
 expression 由数字和算符 '+'、'-' 和 '*' 组成。
 输入表达式中的所有整数值在范围 [0, 99]
 */

func diffWaysToCompute(_ expression: String) -> [Int] {
    let addition = -1
    let subtraction = -2
    let multiplication = -3
    var ops: [Int] = []
    var i = 0
    let n = expression.count
    while i < n {
        let index = expression.index(expression.startIndex, offsetBy: i)
        if expression[index].isNumber {
            var x = 0
            var idx = index
            while i < n && expression[idx].isNumber {
                x = x*10 + Int(String(expression[idx]))!
                i += 1
                idx = expression.index(expression.startIndex, offsetBy: i)
            }
            ops.append(x)
        } else {
            switch expression[index] {
            case "+":
                ops.append(addition)
            case "-":
                ops.append(subtraction)
            default:
                ops.append(multiplication)
            }
            i += 1
        }
    }
    
    let m = ops.count
    var dp = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n)
    for i in 0..<m {
        dp[i][i] = [ops[i]]
    }
   
    if m < 3 {
        return dp[0][m-1]
    }
    
    for sz in 3...m {
        var r = sz - 1
        for l in stride(from: 0, to: m, by: 2) where r < m {
            for k in stride(from: l+1, to: r, by: 2) {
                for x in dp[l][k-1] {
                    for y in dp[k+1][r] {
                        switch ops[k] {
                        case addition:
                            dp[l][r].append(x+y)
                        case subtraction:
                            dp[l][r].append(x-y)
                        default:
                            dp[l][r].append(x*y)
                        }
                    }
                }
            }
            r += 2
        }
    }
    return dp[0][m-1]
}
