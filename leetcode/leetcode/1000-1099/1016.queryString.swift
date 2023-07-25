//
// Created by Xiaonan Chen on 2023/5/11.
//

import Foundation

/*
  1016. 子串能表示从 1 到 N 数字的二进制串
 给定一个二进制字符串 s 和一个正整数 n，如果对于 [1, n] 范围内的每个整数，其二进制表示都是 s 的 子字符串 ，就返回 true，否则返回 false 。

 子字符串 是字符串中连续的字符序列。

 示例 1：

 输入：s = "0110", n = 3
 输出：true
 示例 2：

 输入：s = "0110", n = 4
 输出：false

 提示：

 1 <= s.length <= 1000
 s[i] 不是 '0' 就是 '1'
 1 <= n <= 10^9
  */

func queryString(_ s: String, _ n: Int) -> Bool {
    let zeroAscii = Character("0").asciiValue!
    let s = Array(s)

    func help(_ k: Int, _ mi: Int, _ ma: Int) -> Bool {
        var st: [Int: Int] = [:]
        var t = 0
        for r in 0 ..< s.count {
            t = (t << 1) + Int(s[r].asciiValue! - zeroAscii)
            if k <= r {
                t -= Int(s[r - k].asciiValue! - zeroAscii) << k
            }
            if k - 1 <= r && mi <= t && t <= ma {
                st[t] = 1
            }
        }
        return st.count == ma - mi + 1
    }

    if n == 1 {
        return s.contains {
            $0 == "1"
        }
    }

    var k = 30
    while n <= (1 << k) {
        k -= 1
    }
    if s.count <= (1 << (k - 1)) + k - 1 ||
        s.count < n - (1 << k) + k + 1 {
        return false
    }

    return help(k, 1 << (k - 1), (1 << k) - 1) &&
        help(k + 1, 1 << k, n)
}
