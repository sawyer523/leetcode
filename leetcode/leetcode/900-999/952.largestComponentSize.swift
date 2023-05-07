//
//  952.largestComponentSize.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/30.
//

import Foundation

/*
 952. 按公因数计算最大组件大小
 难度
 困难

 125

 给定一个由不同正整数的组成的非空数组 nums ，考虑下面的图：

 有 nums.length 个节点，按从 nums[0] 到 nums[nums.length - 1] 标记；
 只有当 nums[i] 和 nums[j] 共用一个大于 1 的公因数时，nums[i] 和 nums[j]之间才有一条边。
 返回 图中最大连通组件的大小 。

 示例 1：

 输入：nums = [4,6,15,35]
 输出：4
 示例 2：

 输入：nums = [20,50,9,63]
 输出：2
 示例 3：

 输入：nums = [2,3,6,7,4,12,21,39]
 输出：8

 提示：

 1 <= nums.length <= 2 * 10^4
 1 <= nums[i] <= 10^5
 nums 中所有值都 不同
 */

func largestComponentSize(_ nums: [Int]) -> Int {
    class UnionFind {
        var parent: [Int]
        var rank: [Int]

        init(_ n: Int) {
            parent = [Int](0 ..< n)
            rank = [Int](repeating: 1, count: n)
        }

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func merge(_ x: Int, _ y: Int) {
            let x = find(x)
            let y = find(y)
            if x == y {
                return
            }

            if rank[y] < rank[x] {
                parent[y] = x
            } else if rank[x] < rank[y] {
                parent[x] = y
            } else {
                parent[y] = x
                rank[x] += 1
            }
        }
    }

    func factors(_ num: Int) -> [Int] {
        var result = [Int]()
        var factor = 2
        var num = num

        var prev = 1
        while factor * factor <= num {
            if num % factor == 0 {
                if factor != prev {
                    result.append(factor)
                }
                prev = factor
                num = num / factor
            } else {
                factor += 1
            }
        }

        result.append(num)
        return result
    }

    let m = nums.max()!
    let uf = UnionFind(m + 1)
    var map: [Int: Int] = [:]
    for num in nums {
        let primes = factors(num)
        map[num] = primes[0]

        for i in 0 ..< primes.count - 1 where primes[i] != primes[i + 1] {
            uf.merge(primes[i], primes[i + 1])
        }
    }

    var count: [Int: Int] = [:]
    for num in nums {
        let x = uf.find(map[num]!)
        count[x, default: 0] += 1
    }
    return count.values.max() ?? 0
}
