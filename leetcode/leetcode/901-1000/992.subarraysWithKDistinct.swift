//
//  992.subarraysWithKDistinct.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/9.
//

import Foundation

/*
 992. K 个不同整数的子数组
 难度
 困难

 227





 给定一个正整数数组 A，如果 A 的某个子数组中不同整数的个数恰好为 K，则称 A 的这个连续、不一定独立的子数组为好子数组。

 （例如，[1,2,3,1,2] 中有 3 个不同的整数：1，2，以及 3。）

 返回 A 中好子数组的数目。

  

 示例 1：

 输入：A = [1,2,1,2,3], K = 2
 输出：7
 解释：恰好由 2 个不同整数组成的子数组：[1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2].
 示例 2：

 输入：A = [1,2,1,3,4], K = 3
 输出：3
 解释：恰好由 3 个不同整数组成的子数组：[1,2,1,3], [2,1,3], [1,3,4].
  

 提示：

 1 <= A.length <= 20000
 1 <= A[i] <= A.length
 1 <= K <= A.length
 */

func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
    let n = A.count
    var left1 = 0, left2 = 0, tot1 = 0, tot2 = 0
    var num1 = [Int](repeating: 0, count: n+1)
    var num2 = [Int](repeating: 0, count: n+1)
    var ans = 0
    for v in A {
        if num1[v] == 0 {
            tot1 += 1
        }
        num1[v] += 1
        if num2[v] == 0 {
            tot2 += 1
        }
        num2[v] += 1

        while K < tot1 {
            num1[A[left1]] -= 1
            if num1[A[left1]] == 0 {
                tot1 -= 1
            }
            left1 += 1
        }

        while K-1 < tot2 {
            num2[A[left2]] -= 1
            if num2[A[left2]] == 0 {
                tot2 -= 1
            }
            left2 += 1
        }

        ans += left2 - left1
    }
    return ans
}
