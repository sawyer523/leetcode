//
//  1531.getLengthOfOptimalCompression.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/22.
//

import Foundation

/*
 1531. 压缩字符串 II
 难度
 困难

 46

 行程长度编码 是一种常用的字符串压缩方法，它将连续的相同字符（重复 2 次或更多次）替换为字符和表示字符计数的数字（行程长度）。例如，用此方法压缩字符串 "aabccc" ，将 "aa" 替换为 "a2" ，"ccc" 替换为` "c3" 。因此压缩后的字符串变为 "a2bc3" 。

 注意，本问题中，压缩时没有在单个字符后附加计数 '1' 。

 给你一个字符串 s 和一个整数 k 。你需要从字符串 s 中删除最多 k 个字符，以使 s 的行程长度编码长度最小。

 请你返回删除最多 k 个字符后，s 行程长度编码的最小长度 。

 示例 1：

 输入：s = "aaabcccd", k = 2
 输出：4
 解释：在不删除任何内容的情况下，压缩后的字符串是 "a3bc3d" ，长度为 6 。最优的方案是删除 'b' 和 'd'，这样一来，压缩后的字符串为 "a3c3" ，长度是 4 。
 示例 2：

 输入：s = "aabbaa", k = 2
 输出：2
 解释：如果删去两个 'b' 字符，那么压缩后的字符串是长度为 2 的 "a4" 。
 示例 3：

 输入：s = "aaaaaaaaaaa", k = 0
 输出：3
 解释：由于 k 等于 0 ，不能删去任何字符。压缩后的字符串是 "a11" ，长度为 3 。

 提示：

 1 <= s.length <= 100
 0 <= k <= s.length
 s 仅包含小写英文字母

 */

func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
    func calc(_ x: Int) -> Int {
        switch x {
        case 1:
            return 1
        case ..<10:
            return 2
        case ..<100:
            return 3
        default:
            return 4
        }
    }

    let n = s.count
    var dp: [[Int]] = Array(repeating: Array(repeating: n, count: k + 1), count: n + 1)
    var same = 0
    var diff = 0
    dp[0][0] = 0
    let arr = Array(s)
    for i in 1 ... n {
        var j = 0
        while j <= k && j <= i {
            if j > 0 {
                dp[i][j] = dp[i - 1][j - 1]
            }

            var l = i
            same = 0
            diff = 0
            while l >= 1 && diff <= j {
                if arr[l - 1] == arr[i - 1] {
                    same += 1
                    dp[i][j] = min(dp[i][j], dp[l - 1][j - diff] + calc(same))
                } else {
                    diff += 1
                }
                l -= 1
            }
            j += 1
        }
    }

    return dp[n][k]
}
