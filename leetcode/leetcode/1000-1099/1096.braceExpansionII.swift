//
//  1096.braceExpansionII.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/7.
//

import Foundation

/*
 1096. 花括号展开 II
 如果你熟悉 Shell 编程，那么一定了解过花括号展开，它可以用来生成任意字符串。

 花括号展开的表达式可以看作一个由 花括号、逗号 和 小写英文字母 组成的字符串，定义下面几条语法规则：

 如果只给出单一的元素 x，那么表达式表示的字符串就只有 "x"。R(x) = {x}
 例如，表达式 "a" 表示字符串 "a"。
 而表达式 "w" 就表示字符串 "w"。
 当两个或多个表达式并列，以逗号分隔，我们取这些表达式中元素的并集。R({e_1,e_2,...}) = R(e_1) ∪ R(e_2) ∪ ...
 例如，表达式 "{a,b,c}" 表示字符串 "a","b","c"。
 而表达式 "{{a,b},{b,c}}" 也可以表示字符串 "a","b","c"。
 要是两个或多个表达式相接，中间没有隔开时，我们从这些表达式中各取一个元素依次连接形成字符串。R(e_1 + e_2) = {a + b for (a, b) in R(e_1) × R(e_2)}
 例如，表达式 "{a,b}{c,d}" 表示字符串 "ac","ad","bc","bd"。
 表达式之间允许嵌套，单一元素与表达式的连接也是允许的。
 例如，表达式 "a{b,c,d}" 表示字符串 "ab","ac","ad"​​​​​​。
 例如，表达式 "a{b,c}{d,e}f{g,h}" 可以表示字符串 "abdfg", "abdfh", "abefg", "abefh", "acdfg", "acdfh", "acefg", "acefh"。
 给出表示基于给定语法规则的表达式 expression，返回它所表示的所有字符串组成的有序列表。

 假如你希望以「集合」的概念了解此题，也可以通过点击 “显示英文描述” 获取详情。

 示例 1：

 输入：expression = "{a,b}{c,{d,e}}"
 输出：["ac","ad","ae","bc","bd","be"]
 示例 2：

 输入：expression = "{{a,z},a{b,c},{ab,z}}"
 输出：["a","ab","ac","z"]
 解释：输出中 不应 出现重复的组合结果。

 提示：

 1 <= expression.length <= 60
 expression[i] 由 '{'，'}'，',' 或小写英文字母组成
 给出的表达式 expression 用以表示一组基于题目描述中语法构造的字符串
 */

func braceExpansionII(_ expression: String) -> [String] {
    var s: Set<String> = []
    func dfs(_ exp: String) {
        let j = exp.firstIndex(of: "}")
        if j == nil {
            s.insert(exp)
            return
        }

        let i = exp[exp.startIndex ..< j!].lastIndex(of: "{")
        let a = String(exp[exp.startIndex ..< i!])
        let c = String(exp[exp.index(after: j!)...])
        for b in exp[exp.index(after: i!) ..< j!].split(separator: ",") {
            dfs(a + String(b) + c)
        }
    }

    dfs(expression)
    return s.sorted()
}
