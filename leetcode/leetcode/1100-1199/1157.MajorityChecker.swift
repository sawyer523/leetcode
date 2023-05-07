//
//  1157.MajorityChecker.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/16.
//

import Foundation

/*
 1157. 子数组中占绝大多数的元素
 设计一个数据结构，有效地找到给定子数组的 多数元素 。

 子数组的 多数元素 是在子数组中出现 threshold 次数或次数以上的元素。

 实现 MajorityChecker 类:

 MajorityChecker(int[] arr) 会用给定的数组 arr 对 MajorityChecker 初始化。
 int query(int left, int right, int threshold) 返回子数组中的元素  arr[left...right] 至少出现 threshold 次数，如果不存在这样的元素则返回 -1。

 示例 1：

 输入:
 ["MajorityChecker", "query", "query", "query"]
 [[[1, 1, 2, 2, 1, 1]], [0, 5, 4], [0, 3, 3], [2, 3, 2]]
 输出：
 [null, 1, -1, 2]

 解释：
 MajorityChecker majorityChecker = new MajorityChecker([1,1,2,2,1,1]);
 majorityChecker.query(0,5,4); // 返回 1
 majorityChecker.query(0,3,3); // 返回 -1
 majorityChecker.query(2,3,2); // 返回 2

 提示：

 1 <= arr.length <= 2 * 10^4
 1 <= arr[i] <= 2 * 10^4
 0 <= left <= right < arr.length
 threshold <= right - left + 1
 2 * threshold > right - left + 1
 调用 query 的次数最多为 10^4
 */

class MajorityChecker {
    private var arr: [Int] = []
    private var loc: [Int: [Int]] = [:]
    init(_ arr: [Int]) {
        for (i, v) in arr.enumerated() {
            loc[v, default: []].append(i)
        }
        self.arr.append(contentsOf: arr)
    }

    func query(_ left: Int, _ right: Int, _ threshold: Int) -> Int {
        let len = right - left + 1
        for _ in 0 ..< 20 {
            let x = arr[Int.random(in: 0 ..< len) + left]
            let pos = loc[x, default: []]
            let occ = binarySearch(pos, right + 1) - binarySearch(pos, left)
            if threshold <= occ {
                return x
            }

            if len <= occ * 2 {
                break
            }
        }

        return -1
    }

    private func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        var left = 0
        var right = arr.count
        while left < right {
            let mid = (left + right) >> 1
            if target <= arr[mid] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
