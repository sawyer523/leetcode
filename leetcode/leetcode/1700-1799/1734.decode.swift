//
//  1734.decode.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/11.
//

import Foundation

/*
 1734. 解码异或后的排列
 难度
 中等

 82

 给你一个整数数组 perm ，它是前 n 个正整数的排列，且 n 是个 奇数 。

 它被加密成另一个长度为 n - 1 的整数数组 encoded ，满足 encoded[i] = perm[i] XOR perm[i + 1] 。比方说，如果 perm = [1,3,2] ，那么 encoded = [2,1] 。

 给你 encoded 数组，请你返回原始数组 perm 。题目保证答案存在且唯一。

 示例 1：

 输入：encoded = [3,1]
 输出：[1,2,3]
 解释：如果 perm = [1,2,3] ，那么 encoded = [1 XOR 2,2 XOR 3] = [3,1]
 示例 2：

 输入：encoded = [6,5,4,6]
 输出：[2,4,1,5,3]

 提示：

 3 <= n < 105
 n 是奇数。
 encoded.length == n - 1

 */

func decode(_ encoded: [Int]) -> [Int] {
    let n = encoded.count
    var total = 0
    for i in 1 ... n + 1 {
        total ^= i
    }

    var odd = 0
    for i in stride(from: 1, to: n, by: 2) {
        odd ^= encoded[i]
    }

    var perm = [Int](repeating: 0, count: n + 1)
    perm[0] = total ^ odd
    for i in 0 ..< n {
        perm[i + 1] = encoded[i] ^ perm[i]
    }
    return perm
}
