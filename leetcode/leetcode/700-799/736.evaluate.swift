//
//  736.evaluate.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/6.
//

import Foundation

/*
 736. Lisp 语法解析
 难度
 困难

 101

 给你一个类似 Lisp 语句的字符串表达式 expression，求出其计算结果。

 表达式语法如下所示:

 表达式可以为整数，let 表达式，add 表达式，mult 表达式，或赋值的变量。表达式的结果总是一个整数。
 (整数可以是正整数、负整数、0)
 let 表达式采用 "(let v1 e1 v2 e2 ... vn en expr)" 的形式，其中 let 总是以字符串 "let"来表示，接下来会跟随一对或多对交替的变量和表达式，也就是说，第一个变量 v1被分配为表达式 e1 的值，第二个变量 v2 被分配为表达式 e2 的值，依次类推；最终 let 表达式的值为 expr表达式的值。
 add 表达式表示为 "(add e1 e2)" ，其中 add 总是以字符串 "add" 来表示，该表达式总是包含两个表达式 e1、e2 ，最终结果是 e1 表达式的值与 e2 表达式的值之 和 。
 mult 表达式表示为 "(mult e1 e2)" ，其中 mult 总是以字符串 "mult" 表示，该表达式总是包含两个表达式 e1、e2，最终结果是 e1 表达式的值与 e2 表达式的值之 积 。
 在该题目中，变量名以小写字符开始，之后跟随 0 个或多个小写字符或数字。为了方便，"add" ，"let" ，"mult" 会被定义为 "关键字" ，不会用作变量名。
 最后，要说一下作用域的概念。计算变量名所对应的表达式时，在计算上下文中，首先检查最内层作用域（按括号计），然后按顺序依次检查外部作用域。测试用例中每一个表达式都是合法的。有关作用域的更多详细信息，请参阅示例。

 示例 1：

 输入：expression = "(let x 2 (mult x (let x 3 y 4 (add x y))))"
 输出：14
 解释：
 计算表达式 (add x y), 在检查变量 x 值时，
 在变量的上下文中由最内层作用域依次向外检查。
 首先找到 x = 3, 所以此处的 x 值是 3 。
 示例 2：

 输入：expression = "(let x 3 x 2 x)"
 输出：2
 解释：let 语句中的赋值运算按顺序处理即可。
 示例 3：

 输入：expression = "(let x 1 y 2 x (add x y) (add x y))"
 输出：5
 解释：
 第一个 (add x y) 计算结果是 3，并且将此值赋给了 x 。
 第二个 (add x y) 计算结果是 3 + 2 = 5 。

 提示：

 1 <= expression.length <= 2000
 exprssion 中不含前导和尾随空格
 expressoin 中的不同部分（token）之间用单个空格进行分隔
 答案和所有中间计算结果都符合 32-bit 整数范围
 测试用例中的表达式均为合法的且最终结果为整数
 */

func evaluate(_ expression: String) -> Int {
    enum exprStatus {
        case VALUE // 初始状态
        case NONE // 表达式类型未知
        case LET // let 表达式
        case LET1 // let 表达式已经解析了 vi 变量
        case LET2 // let 表达式已经解析了最后一个表达式 expr
        case ADD // add 表达式
        case ADD1 // add 表达式已经解析了 e1 表达式
        case ADD2 // add 表达式已经解析了 e2 表达式
        case MULT // mult 表达式
        case MULT1 // mult 表达式已经解析了 e1 表达式
        case MULT2 // mult 表达式已经解析了 e2 表达式
        case DONE // 解析完成
    }

    struct expr {
        var status: exprStatus
        var vr: String
        var value: Int
        var e1: Int
        var e2: Int

        init(status: exprStatus, vr: String, value: Int, e1: Int, e2: Int) {
            self.status = status
            self.vr = vr
            self.value = value
            self.e1 = e1
            self.e2 = e2
        }

        init(status: exprStatus) {
            self.status = status
            self.vr = ""
            self.value = 0
            self.e1 = 0
            self.e2 = 0
        }
    }

    var scope: [String: [Int]] = [:]
    func calculateToken(_ token: String) -> Int {
        if token.first!.isLowercase {
            var vals = scope[token]
            return vals?.removeLast() ?? 0
        }
        return Int(token) ?? 0
    }

    var vars: [[String]] = []
    var s: [expr] = []
    var cur = expr(status: .VALUE)
    let n = expression.count
    var i = 0
    while i < n {
        var index = expression.index(expression.startIndex, offsetBy: i)
        if expression[index] == " " {
            i += 1
            continue
        }

        if expression[index] == "(" {
            i += 1
            s.append(cur)
            cur.status = .NONE
            continue
        }

        var token = ""
        if expression[index] == ")" {
            i += 1
            switch cur.status {
            case .LET2:
                token = cur.value.description
                for vr in vars.last! {
                    scope[vr]?.removeLast()
                }
                vars.removeLast()
            case .ADD2:
                token = (cur.e1 + cur.e2).description
            default:
                token = (cur.e1 * cur.e2).description
            }
            cur = s.removeLast()
        } else {
            let i0 = expression.index(expression.startIndex, offsetBy: i)
            while i < n && expression[index] != " " && expression[index] != ")" {
                i += 1
                index = expression.index(expression.startIndex, offsetBy: i)
            }

            token = String(expression[i0 ..< index])
        }

        switch cur.status {
        case .VALUE:
            cur.value = Int(token) ?? 0
            cur.status = .DONE
        case .NONE:
            switch token {
            case "let":
                cur.status = .LET
                vars.append([])
            case "add":
                cur.status = .ADD
            case "mult":
                cur.status = .MULT
            default:
                break
            }
        case .LET:
            if expression[index] == ")" {
                cur.value = calculateToken(token)
                cur.status = .LET2
            } else {
                cur.vr = token
                vars[vars.count - 1].append(token)
                cur.status = .LET1
            }
        case .LET1:
            scope[cur.vr, default: []].append(calculateToken(token))
            cur.status = .LET
        case .ADD:
            cur.e1 = calculateToken(token)
            cur.status = .ADD1
        case .ADD1:
            cur.e2 = calculateToken(token)
            cur.status = .ADD2
        case .MULT:
            cur.e1 = calculateToken(token)
            cur.status = .MULT1
        case .MULT1:
            cur.e2 = calculateToken(token)
            cur.status = .MULT2
        default:
            break
        }
    }
    return cur.value
}
