//
//  1803.countPairs.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/5.
//

import Foundation

/*
 1803. 统计异或值在范围内的数对有多少
 难度
 困难

 74

 给你一个整数数组 nums （下标 从 0 开始 计数）以及两个整数：low 和 high ，请返回 漂亮数对 的数目。

 漂亮数对 是一个形如 (i, j) 的数对，其中 0 <= i < j < nums.length 且 low <= (nums[i] XOR nums[j]) <= high 。

 示例 1：

 输入：nums = [1,4,2,7], low = 2, high = 6
 输出：6
 解释：所有漂亮数对 (i, j) 列出如下：
     - (0, 1): nums[0] XOR nums[1] = 5
     - (0, 2): nums[0] XOR nums[2] = 3
     - (0, 3): nums[0] XOR nums[3] = 6
     - (1, 2): nums[1] XOR nums[2] = 6
     - (1, 3): nums[1] XOR nums[3] = 3
     - (2, 3): nums[2] XOR nums[3] = 5
 示例 2：

 输入：nums = [9,8,4,2,1], low = 5, high = 14
 输出：8
 解释：所有漂亮数对 (i, j) 列出如下：
 ​​​​​    - (0, 2): nums[0] XOR nums[2] = 13
     - (0, 3): nums[0] XOR nums[3] = 11
     - (0, 4): nums[0] XOR nums[4] = 8
     - (1, 2): nums[1] XOR nums[2] = 12
     - (1, 3): nums[1] XOR nums[3] = 10
     - (1, 4): nums[1] XOR nums[4] = 9
     - (2, 3): nums[2] XOR nums[3] = 6
     - (2, 4): nums[2] XOR nums[4] = 5

 提示：

 1 <= nums.length <= 2 * 10^4
 1 <= nums[i] <= 2 * 10^4
 1 <= low <= high <= 2 * 10^4
 */

func countPairs(_ nums: [Int], _ low: Int, _ high: Int) -> Int {
    class Trie {
        var son = [Trie?](repeating: nil, count: 2)
        var sum = 0
    }

    var root: Trie?
    let highBit = 14

    func f(_ x: Int) -> Int {
        root = Trie()
        var res = 0
        for i in 1 ..< nums.count {
            add(nums[i - 1])
            res += get(nums[i], x)
        }
        return res
    }

    func add(_ num: Int) {
        var cur = root
        for k in stride(from: highBit, through: 0, by: -1) {
            let bit = (num >> k) & 1
            if cur?.son[bit] == nil {
                cur?.son[bit] = Trie()
            }
            cur = cur?.son[bit]
            cur?.sum += 1
        }
    }

    func get(_ num: Int, _ x: Int) -> Int {
        var cur = root
        var sum = 0
        for k in stride(from: highBit, through: 0, by: -1) {
            let r = (num >> k) & 1
            if (x >> k) & 1 != 0 {
                if let v = cur?.son[r]?.sum {
                    sum += v
                }

                if cur?.son[r ^ 1] == nil {
                    return sum
                }
                cur = cur?.son[r ^ 1]
            } else {
                if cur?.son[r] == nil {
                    return sum
                }
                cur = cur?.son[r]
            }
        }
        sum += cur!.sum
        return sum
    }

    return f(high) - f(low - 1)
}
