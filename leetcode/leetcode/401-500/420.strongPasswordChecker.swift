//
//  420.strongPasswordChecker.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/2.
//

import Foundation

/*
 420. 强密码检验器
 难度
 困难

 89





  

 如果一个密码满足下述所有条件，则认为这个密码是强密码：
 由至少 6 个，至多 20 个字符组成。
 至少包含 一个小写 字母，一个大写 字母，和 一个数字 。
 同一字符 不能 连续出现三次 (比如 "...aaa..." 是不允许的, 但是 "...aa...a..." 如果满足其他条件也可以算是强密码)。
 给你一个字符串 password ，返回 将 password 修改到满足强密码条件需要的最少修改步数。如果 password 已经是强密码，则返回 0 。

 在一步修改操作中，你可以：

 插入一个字符到 password ，
 从 password 中删除一个字符，或
 用另一个字符来替换 password 中的某个字符。
  

 示例 1：

 输入：password = "a"
 输出：5
 示例 2：

 输入：password = "aA1"
 输出：3
 示例 3：

 输入：password = "1337C0d3"
 输出：0
  

 提示：

 1 <= password.length <= 50
 password 由字母、数字、点 '.' 或者感叹号 '!'
 */

func strongPasswordChecker(_ password: String) -> Int {
    var hasLower = 0
    var hasUpper = 0
    var hasDigit = 0
    for ch in password {
        if ch.isLowercase {
            hasLower = 1
        } else if ch.isUppercase {
            hasUpper = 1
        } else if ch.isHexDigit {
            hasDigit = 1
        }
    }
    
    let categories = hasLower + hasUpper + hasDigit
    let n = password.count
    switch n {
    case 0..<6:
        return max(6-n, 3-categories)
    case 6...20:
        var replace = 0
        var cnt = 0
        var cur = Character("#")
        for ch in password {
            if ch == cur {
                cnt += 1
            } else {
                replace += cnt/3
                cnt = 1
                cur = ch
            }
        }
        replace += cnt/3
        return max(replace, 3-categories)
    default:
        var replace = 0
        var remove = n - 20
        var rm2 = 0
        var cnt = 0
        var cur = Character("#")
        for ch in password {
            if ch == cur {
                cnt += 1
                continue
            }
            
            if 0 < remove &&
                3 <= cnt {
                if cnt % 3 == 0 {
                    remove -= 1
                    replace -= 1
                } else if cnt % 3 == 1 {
                    rm2 += 1
                }
            }
            
            replace += cnt/3
            cnt = 1
            cur = ch
        }
        
        if 0 < remove &&
            3 <= cnt {
            if cnt % 3 == 0 {
                remove -= 1
                replace -= 1
            } else if cnt % 3 == 1 {
                rm2 += 1
            }
        }
        
        replace += cnt / 3
        
        let use2 = min(replace, rm2, remove / 2)
        replace -= use2
        remove -= use2 * 2
        
        let use3 = min(replace, remove / 3)
        replace -= use3
        remove -= use3 * 3
        return (n - 20) + max(replace, 3 - categories)
    }
}
