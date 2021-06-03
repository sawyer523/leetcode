//
//  1004.longestOnes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/6.
//

import Foundation

/*
 1004. 最大连续1的个数 III
 难度
 中等

 145





 给定一个由若干 0 和 1 组成的数组 A，我们最多可以将 K 个值从 0 变成 1 。

 返回仅包含 1 的最长（连续）子数组的长度。

  

 示例 1：

 输入：A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 输出：6
 解释：
 [1,1,1,0,0,1,1,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 6。
 示例 2：

 输入：A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
 输出：10
 解释：
 [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 10。
  

 提示：

 1 <= A.length <= 20000
 0 <= K <= A.length
 A[i] 为 0 或 1
 */

func longestOnes(_ A: [Int], _ K: Int) -> Int {
    /*
     * 统计1个数
     *
     var left = 0
     var maxn = 0
     let n = A.count
     for right in 0..<n {
     maxn += A[right]
     if maxn+K < right - left + 1 {
     maxn -= A[left]
     left += 1
     }
     }
     
     return n - left
     */

    var letf = 0
    var zeroCount = 0
    for right in 0..<A.count {
        if A[right] == 0 {
            zeroCount += 1
        }

        if K < zeroCount {
            if A[letf] == 0 {
                zeroCount -= 1
            }
            letf += 1
        }
    }

    return A.count - letf
}
