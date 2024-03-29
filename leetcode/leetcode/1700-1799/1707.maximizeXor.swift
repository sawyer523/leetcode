//
//  1707.maximizeXor.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/23.
//

import Foundation

/*
 1707. 与数组中元素的最大异或值
 难度
 困难

 42

 给你一个由非负整数组成的数组 nums 。另有一个查询数组 queries ，其中 queries[i] = [xi, mi] 。

 第 i 个查询的答案是 xi 和任何 nums 数组中不超过 mi 的元素按位异或（XOR）得到的最大值。换句话说，答案是 max(nums[j] XOR xi) ，其中所有 j 均满足 nums[j] <= mi 。如果 nums 中的所有元素都大于 mi，最终答案就是 -1 。

 返回一个整数数组 answer 作为查询的答案，其中 answer.length == queries.length 且 answer[i] 是第 i 个查询的答案。

 示例 1：

 输入：nums = [0,1,2,3,4], queries = [[3,1],[1,3],[5,6]]
 输出：[3,3,7]
 解释：
 1) 0 和 1 是仅有的两个不超过 1 的整数。0 XOR 3 = 3 而 1 XOR 3 = 2 。二者中的更大值是 3 。
 2) 1 XOR 2 = 3.
 3) 5 XOR 2 = 7.
 示例 2：

 输入：nums = [5,2,4,6,6,3], queries = [[12,4],[8,1],[6,3]]
 输出：[15,-1,5]

 提示：

 1 <= nums.length, queries.length <= 10^5
 queries[i].length == 2
 0 <= nums[j], xi, mi <= 10^9
 */

private let L = 30
func maximizeXor(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
    class Trie {
        var children: [Trie?]
        var min: Int

        init(_ value: Int) {
            children = [Trie?](repeating: nil, count: 2)
            self.min = value
        }

        func insert(_ value: Int) {
            if value < self.min {
                self.min = value
            }

            var node = self
            for i in stride(from: L - 1, through: 0, by: -1) {
                let bit = value >> i & 1
                if node.children[bit] == nil {
                    node.children[bit] = Trie(value)
                }
                node = node.children[bit]!
                if value < node.min {
                    node.min = value
                }
            }
        }

        func getMaxXorWithLimit(_ value: Int, _ limit: Int) -> Int {
            var node: Trie? = self
            if limit < node!.min {
                return -1
            }

            var res = 0
            for i in stride(from: L - 1, through: 0, by: -1) {
                var bit = value >> i & 1
                if let n = node?.children[bit ^ 1], n.min <= limit {
                    res |= 1 << i
                    bit ^= 1
                }
                node = node?.children[bit]
            }

            return res
        }
    }

    let t = Trie(Int.max)
    for num in nums {
        t.insert(num)
    }

    var ans: [Int] = []
    for query in queries {
        ans.append(t.getMaxXorWithLimit(query[0], query[1]))
    }

    return ans
}
