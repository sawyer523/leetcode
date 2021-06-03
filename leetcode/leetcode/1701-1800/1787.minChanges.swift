//
//  1787.minChanges.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/25.
//

import Foundation

/*
 1787. 使所有区间的异或结果为零
 难度
 困难
 
 73
 
 
 
 
 
 给你一个整数数组 nums​​​ 和一个整数 k​​​​​ 。区间 [left, right]（left <= right）的 异或结果 是对下标位于 left 和 right（包括 left 和 right ）之间所有元素进行 XOR 运算的结果：nums[left] XOR nums[left+1] XOR ... XOR nums[right] 。
 
 返回数组中 要更改的最小元素数 ，以使所有长度为 k 的区间异或结果等于零。
 
 
 
 示例 1：
 
 输入：nums = [1,2,0,3,0], k = 1
 输出：3
 解释：将数组 [1,2,0,3,0] 修改为 [0,0,0,0,0]
 示例 2：
 
 输入：nums = [3,4,5,2,1,7,3,4,7], k = 3
 输出：3
 解释：将数组 [3,4,5,2,1,7,3,4,7] 修改为 [3,4,7,3,4,7,3,4,7]
 示例 3：
 
 输入：nums = [1,2,4,1,2,5,1,2,6], k = 3
 输出：3
 解释：将数组[1,2,4,1,2,5,1,2,6] 修改为 [1,2,3,1,2,3,1,2,3]
 
 
 提示：
 
 1 <= k <= nums.length <= 2000
 ​​​​​​​​​​​​0 <= nums[i] < 2^10
 */

func minChanges(_ nums: [Int], _ k: Int) -> Int {
    let maxX = 1 << 10
    let inf = Int.max / 2

    let n = nums.count
    var f = [Int](repeating: inf, count: maxX)
    f[0] = 0

    for i in 0..<k {
        var cnt: [Int: Int] = [:]
        var size = 0
        for j in stride(from: i, to: n, by: k) {
            cnt[nums[j], default: 0] += 1
            size += 1
        }

        let t2min = f.min()!

        var g = [Int](repeating: t2min, count: maxX)

        for mask in 0..<maxX {
            for (x, v) in cnt {
                g[mask] = min(g[mask], f[mask^x]-v)
            }
        }

        for j in 0..<g.count {
            g[j] += size
        }

        f = g
    }

    return f[0]
}
