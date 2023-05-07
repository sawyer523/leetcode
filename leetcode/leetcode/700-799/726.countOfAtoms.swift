//
//  726.countOfAtoms.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/5.
//

import Foundation

/*
 726. 原子的数量
 难度
 困难

 151

 给定一个化学式formula（作为字符串），返回每种原子的数量。

 原子总是以一个大写字母开始，接着跟随0个或任意个小写字母，表示原子的名字。

 如果数量大于 1，原子后会跟着数字表示原子的数量。如果数量等于 1 则不会跟数字。例如，H2O 和 H2O2 是可行的，但 H1O2 这个表达是不可行的。

 两个化学式连在一起是新的化学式。例如 H2O2He3Mg4 也是化学式。

 一个括号中的化学式和数字（可选择性添加）也是化学式。例如 (H2O2) 和 (H2O2)3 是化学式。

 给定一个化学式，输出所有原子的数量。格式为：第一个（按字典序）原子的名子，跟着它的数量（如果数量大于 1），然后是第二个原子的名字（按字典序），跟着它的数量（如果数量大于 1），以此类推。

 示例 1:

 输入:
 formula = "H2O"
 输出: "H2O"
 解释:
 原子的数量是 {'H': 2, 'O': 1}。
 示例 2:

 输入:
 formula = "Mg(OH)2"
 输出: "H2MgO2"
 解释:
 原子的数量是 {'H': 2, 'Mg': 1, 'O': 2}。
 示例 3:

 输入:
 formula = "K4(ON(SO3)2)2"
 输出: "K4N2O14S4"
 解释:
 原子的数量是 {'K': 4, 'N': 2, 'O': 14, 'S': 4}。
 注意:

 所有原子的第一个字母为大写，剩余字母都是小写。
 formula的长度在[1, 1000]之间。
 formula只包含字母、数字和圆括号，并且题目中给定的是合法的化学式。

 */

func countOfAtoms(_ formula: String) -> String {
    var stack: [[String: Int]] = []
    var index = 0
    var map: [String: Int] = [:]
    let arr = Array(formula)

    func parseNumber() -> Int {
        var val = 0
        while index < formula.count && arr[index].isNumber {
            if let num = arr[index].wholeNumberValue {
                val = val * 10 + num
            }
            index += 1
        }
        if val == 0 {
            val = 1
        }
        return val
    }

    while index < formula.count {
        let char = arr[index]
        index += 1
        switch char {
        case "(":
            stack.append(map)
            map = [:]
        case ")":
            let val = parseNumber()
            if !stack.isEmpty {
                let tmp = map
                map = stack.removeLast()
                for (k, v) in tmp {
                    if let freq = map[k] {
                        map[k] = freq + v * val
                    } else {
                        map[k] = v * val
                    }
                }
            }
        default:
            let start = index - 1
            while index < formula.count, arr[index].isLowercase {
                index += 1
            }
            let s = String(arr[start ..< index])
            let val = parseNumber()
            if let freq = map[s] {
                map[s] = freq + val
            } else {
                map[s] = val
            }
        }
    }

    var ans = ""
    let sortedMap = map.sorted {
        $0.key < $1.key
    }

    for (k, v) in sortedMap {
        ans += k
        if v > 1 {
            ans += "\(v)"
        }
    }

    return ans
}
