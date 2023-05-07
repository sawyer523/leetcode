//
// Created by Xiaonan Chen on 2021/3/17.
//

import Foundation

/*
  115. 不同的子序列
 难度
 困难

 347

 给定一个字符串 s 和一个字符串 t ，计算在 s 的子序列中 t 出现的个数。

 字符串的一个 子序列 是指，通过删除一些（也可以不删除）字符且不干扰剩余字符相对位置所组成的新字符串。（例如，"ACE" 是 "ABCDE" 的一个子序列，而 "AEC" 不是）

 题目数据保证答案符合 32 位带符号整数范围。

 示例 1：

 输入：s = "rabbbit", t = "rabbit"
 输出：3
 解释：
 如下图所示, 有 3 种可以从 s 中得到 "rabbit" 的方案。
 (上箭头符号 ^ 表示选取的字母)
 rabbbit
 ^^^^ ^^
 rabbbit
 ^^ ^^^^
 rabbbit
 ^^^ ^^^
 示例 2：

 输入：s = "babgbag", t = "bag"
 输出：5
 解释：
 如下图所示, 有 5 种可以从 s 中得到 "bag" 的方案。
 (上箭头符号 ^ 表示选取的字母)
 babgbag
 ^^ ^
 babgbag
 ^^    ^
 babgbag
 ^    ^^
 babgbag
   ^  ^^
 babgbag
     ^^^

 提示：

 0 <= s.length, t.length <= 1000
 s 和 t 由英文字母组成

  */

func numDistinct(_ s: String, _ t: String) -> Int {
    let m = s.count
    let n = t.count
    if m < n {
        return 0
    }
//    let arrS = Array(s)
//    let arrT = Array(t)
//    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
//    for i in 0...m {
//        dp[i][n] = 1
//    }
//
//    for i in stride(from: m-1, through: 0, by: -1) {
//        for j in stride(from: n-1, through: 0, by: -1) {
//            if arrS[i] == arrT[j] {
//               dp[i][j] = dp[i+1][j+1] + dp[i+1][j]
//            } else {
//                dp[i][j] = dp[i+1][j]
//            }
//        }
//    }
//
//    return dp[0][0]
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 2)
    for i in 0 ..< 2 {
        dp[i][0] = 1
    }
    for i in 1 ... m {
        dp[i % 2][0] = 1
        for j in 1 ... n {
            dp[i % 2][j] = dp[(i - 1) % 2][j]
            if s[i - 1] != t[j - 1] {
                continue
            }
            dp[i % 2][j] += dp[(i - 1) % 2][j - 1]
        }
    }
    return dp[m % 2][n]
}
