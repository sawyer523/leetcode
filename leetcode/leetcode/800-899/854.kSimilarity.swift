//
//  854.kSimilarity.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/21.
//

import Foundation

/*
 854. 相似度为 K 的字符串
 难度
 困难

 149

 对于某些非负整数 k ，如果交换 s1 中两个字母的位置恰好 k 次，能够使结果字符串等于 s2 ，则认为字符串 s1 和 s2 的 相似度为 k 。

 给你两个字母异位词 s1 和 s2 ，返回 s1 和 s2 的相似度 k 的最小值。

 示例 1：

 输入：s1 = "ab", s2 = "ba"
 输出：1
 示例 2：

 输入：s1 = "abc", s2 = "bca"
 输出：2

 提示：

 1 <= s1.length <= 20
 s2.length == s1.length
 s1 和 s2  只包含集合 {'a', 'b', 'c', 'd', 'e', 'f'} 中的小写字母
 s2 是 s1 的一个字母异位词
 */

func kSimilarity(_ s1: String, _ s2: String) -> Int {
    /*
     func swap(_ s: String, _ i: Int, _ j: Int) -> String {
         var S = Array(s)
         let temp = S[i]
         S[i] = S[j]
         S[j] = temp
         return String(S)
     }
     if s1 == s2 { return 0 }
     let B = Array(s2)
     let n = B.count

     var steps = 0
     var visited = Set<String>()
     var q = [String]()
     q.append(s1)
     visited.insert(s1)

     while !q.isEmpty {
         var size = q.count
         while size > 0 {
             let curr = q.removeFirst()
             let S = Array(curr)

             var i = 0
             while S[i] == B[i] { i += 1 }

             for j in i+1..<n {
                 if S[j] == B[j] || S[j] != B[i] { continue }

                 let temp = swap(curr, i, j)
                 if temp == s2 { return steps + 1 }

                 if !visited.contains(temp) {
                     q.append(temp)
                     visited.insert(temp)
                 }
             }

             size -= 1
         }

         steps += 1
     }

     return -1
      */

    let s1 = Array(s1)
    let s2 = Array(s2)
    var str1: [Character] = []
    var str2: [Character] = []
    for i in s1.indices {
        if s1[i] != s2[i] {
            str1.append(s1[i])
            str2.append(s2[i])
        }
    }

    let n = str1.count
    if n == 0 {
        return 0
    }

    var smallCycles: [Int] = []
    var largeCycles: [Int] = []
    let aAscii = Character("a").asciiValue!
    for i in 1 ..< 1 << n {
        var cnt = [Int](repeating: 0, count: 6)
        for j in 0 ..< n {
            if i & (1 << j) != 0 {
                cnt[Int(str1[j].asciiValue! - aAscii)] += 1
                cnt[Int(str2[j].asciiValue! - aAscii)] -= 1
            }
        }

        var isCycle = true
        for v in cnt {
            if v != 0 {
                isCycle = false
                break
            }
        }

        if isCycle {
            let size = i.nonzeroBitCount
            if size <= 6 {
                smallCycles.append(i)
            } else {
                largeCycles.append(i)
            }
        }
    }

    smallCycles.sort(by: { $0.nonzeroBitCount > $1.nonzeroBitCount })
    largeCycles.sort(by: { $0.nonzeroBitCount > $1.nonzeroBitCount })

    var dp = [Int](repeating: 1, count: 1 << n)
    dp[0] = 0
    for i in 0 ..< smallCycles.count {
        for j in 0 ..< i {
            let x = smallCycles[i]
            let y = smallCycles[j]
            if x & y == y {
                dp[x] = max(dp[x], dp[y] + dp[x ^ y])
            }
        }
    }

    for x in largeCycles {
        for y in smallCycles {
            if x & y == y {
                dp[x] = max(dp[x], dp[y] + dp[x ^ y])
            }
        }
    }

    return n - dp[(1 << n) - 1]
}
