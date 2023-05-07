//
//  301.removeInvalidParentheses.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/27.
//

import Foundation

/*
 301. 删除无效的括号
 难度
 困难

 531

 给你一个由若干括号和字母组成的字符串 s ，删除最小数量的无效括号，使得输入的字符串有效。

 返回所有可能的结果。答案可以按 任意顺序 返回。

 示例 1：

 输入：s = "()())()"
 输出：["(())()","()()()"]
 示例 2：

 输入：s = "(a)())()"
 输出：["(a())()","(a)()()"]
 示例 3：

 输入：s = ")("
 输出：[""]

 提示：

 1 <= s.length <= 25
 s 由小写英文字母以及括号 '(' 和 ')' 组成
 s 中至多含 20 个括号

 */
func removeInvalidParentheses(_ s: String) -> [String] {
    func isValid(_ str: [Character]) -> Bool {
        var cnt = 0
        for s in str {
            if s == "(" {
                cnt += 1
            } else if s == ")" {
                cnt -= 1
                if cnt < 0 {
                    return false
                }
            }
        }
        return cnt == 0
    }

    var ans: [String] = []
    func helper(_ arr: [Character], _ start: Int, _ lcount: Int, _ rcount: Int, _ lremove: Int, _ rremove: Int) {
        if lremove == 0, rremove == 0 {
            if isValid(arr) {
                ans.append(String(arr))
            }
            return
        }
        var lcount = lcount
        var rcount = rcount
        for i in start ..< arr.count {
            if i != start, arr[i] == arr[i - 1] {
                continue
            }

            if arr.count - i < lremove + rremove {
                return
            }

            if lremove > 0, arr[i] == "(" {
                var a = arr
                a.remove(at: i)
                helper(a, i, lcount, rcount, lremove - 1, rremove)
            }

            if rremove > 0, arr[i] == ")" {
                var a = arr
                a.remove(at: i)
                helper(a, i, lcount, rcount, lremove, rremove - 1)
            }

            if arr[i] == ")" {
                lcount += 1
            } else if arr[i] == ")" {
                rcount += 1
            }

            if lcount < rcount {
                break
            }
        }
    }

    var lremove = 0
    var rremove = 0
    let arr = Array(s)
    for char in arr {
        if char == "(" {
            lremove += 1
        } else if char == ")" {
            if lremove == 0 {
                rremove += 1
            } else {
                lremove -= 1
            }
        }
    }

    helper(arr, 0, 0, 0, lremove, rremove)
    return ans
}
