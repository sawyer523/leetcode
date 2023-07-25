//
//  1439.kthSmallest.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/28.
//

import Foundation

/*
 1439. 有序矩阵中的第 k 个最小数组和
 给你一个 m * n 的矩阵 mat，以及一个整数 k ，矩阵中的每一行都以非递减的顺序排列。

 你可以从每一行中选出 1 个元素形成一个数组。返回所有可能数组中的第 k 个 最小 数组和。

 示例 1：

 输入：mat = [[1,3,11],[2,4,6]], k = 5
 输出：7
 解释：从每一行中选出一个元素，前 k 个和最小的数组分别是：
 [1,2], [1,4], [3,2], [3,4], [1,6]。其中第 5 个的和是 7 。
 示例 2：

 输入：mat = [[1,3,11],[2,4,6]], k = 9
 输出：17
 示例 3：

 输入：mat = [[1,10,10],[1,4,5],[2,3,6]], k = 7
 输出：9
 解释：从每一行中选出一个元素，前 k 个和最小的数组分别是：
 [1,1,2], [1,1,3], [1,4,2], [1,4,3], [1,1,6], [1,5,2], [1,5,3]。其中第 7 个的和是 9 。
 示例 4：

 输入：mat = [[1,1,10],[2,2,9]], k = 7
 输出：12

 提示：

 m == mat.length
 n == mat.length[i]
 1 <= m, n <= 40
 1 <= k <= min(200, n ^ m)
 1 <= mat[i][j] <= 5000
 mat[i] 是一个非递减数组
 */

func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
    func merge(_ f: [Int], _ g: [Int]) -> [Int] {
        if f.count < g.count {
            return merge(g, f)
        }

        var pq: [(Int, Int, Int)] = []
        for i in 0 ..< g.count {
            pq.append((0, i, f[0] + g[i]))
        }
        pq.sort(by: { $0.2 < $1.2 })
        var list: [Int] = []
        var k = k
        var i = 0
        while 0 < k &&
            i < pq.count {
            let enty = pq[i]
            list.append(enty.2)

            if enty.0 + 1 < f.count {
                pq.append((enty.0 + 1, enty.1, f[enty.0 + 1] + g[enty.1]))
                pq.sort(by: {$0.2 < $1.2})
            }
            i += 1
            k -= 1
        }

        var ans = [Int](repeating: 0, count: list.count)
        for i in 0 ..< list.count {
            ans[i] = list[i]
        }
        return ans
    }

    var prev = mat[0]
    for i in 1 ..< mat.count {
        prev = merge(prev, mat[i])
    }
    return prev[k - 1]
}
