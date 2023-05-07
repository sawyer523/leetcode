//
//  115.sequenceReconstruction.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/23.
//

import Foundation

/*
 剑指 Offer II 115. 重建序列
 难度
 中等

 68

 给定一个长度为 n 的整数数组 nums ，其中 nums 是范围为 [1，n] 的整数的排列。还提供了一个 2D 整数数组 sequences ，其中 sequences[i] 是 nums 的子序列。
 检查 nums 是否是唯一的最短 超序列 。最短 超序列 是 长度最短 的序列，并且所有序列 sequences[i] 都是它的子序列。对于给定的数组 sequences ，可能存在多个有效的 超序列 。

 例如，对于 sequences = [[1,2],[1,3]] ，有两个最短的 超序列 ，[1,2,3] 和 [1,3,2] 。
 而对于 sequences = [[1,2],[1,3],[1,2,3]] ，唯一可能的最短 超序列 是 [1,2,3] 。[1,2,3,4] 是可能的超序列，但不是最短的。
 如果 nums 是序列的唯一最短 超序列 ，则返回 true ，否则返回 false 。
 子序列 是一个可以通过从另一个序列中删除一些元素或不删除任何元素，而不改变其余元素的顺序的序列。

 示例 1：

 输入：nums = [1,2,3], sequences = [[1,2],[1,3]]
 输出：false
 解释：有两种可能的超序列：[1,2,3]和[1,3,2]。
 序列 [1,2] 是[1,2,3]和[1,3,2]的子序列。
 序列 [1,3] 是[1,2,3]和[1,3,2]的子序列。
 因为 nums 不是唯一最短的超序列，所以返回false。
 示例 2：

 输入：nums = [1,2,3], sequences = [[1,2]]
 输出：false
 解释：最短可能的超序列为 [1,2]。
 序列 [1,2] 是它的子序列：[1,2]。
 因为 nums 不是最短的超序列，所以返回false。
 示例 3：

 输入：nums = [1,2,3], sequences = [[1,2],[1,3],[2,3]]
 输出：true
 解释：最短可能的超序列为[1,2,3]。
 序列 [1,2] 是它的一个子序列：[1,2,3]。
 序列 [1,3] 是它的一个子序列：[1,2,3]。
 序列 [2,3] 是它的一个子序列：[1,2,3]。
 因为 nums 是唯一最短的超序列，所以返回true。

 提示：

 n == nums.length
 1 <= n <= 10^4
 nums 是 [1, n] 范围内所有整数的排列
 1 <= sequences.length <= 10^4
 1 <= sequences[i].length <= 10^4
 1 <= sum(sequences[i].length) <= 10^5
 1 <= sequences[i][j] <= n
 sequences 的所有数组都是 唯一 的
 sequences[i] 是 nums 的一个子序列
 */

func sequenceReconstruction(_ nums: [Int], _ sequences: [[Int]]) -> Bool {
    let n = nums.count
    var g = [[Int]](repeating: [], count: n + 1)
    var inDeg = [Int](repeating: 0, count: n + 1)
    for sequence in sequences {
        for i in 1 ..< sequence.count {
            let x = sequence[i - 1]
            let y = sequence[i]
            g[x].append(y)
            inDeg[y] += 1
        }
    }

    var q: [Int] = []
    for i in 1 ... n {
        if inDeg[i] == 0 {
            q.append(i)
        }
    }

    while !q.isEmpty {
        if q.count > 1 {
            return false
        }

        let x = q.removeFirst()
        for y in g[x] {
            inDeg[y] -= 1
            if inDeg[y] == 0 {
                q.append(y)
            }
        }
    }
    return true
}
