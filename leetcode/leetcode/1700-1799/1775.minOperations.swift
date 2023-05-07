//
//  1775.minOperations.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/7.
//

import Foundation

/*
 1775. 通过最少操作次数使数组的和相等
 难度
 中等

 64

 给你两个长度可能不等的整数数组 nums1 和 nums2 。两个数组中的所有值都在 1 到 6 之间（包含 1 和 6）。

 每次操作中，你可以选择 任意 数组中的任意一个整数，将它变成 1 到 6 之间 任意 的值（包含 1 和 6）。

 请你返回使 nums1 中所有数的和与 nums2 中所有数的和相等的最少操作次数。如果无法使两个数组的和相等，请返回 -1 。

 示例 1：

 输入：nums1 = [1,2,3,4,5,6], nums2 = [1,1,2,2,2,2]
 输出：3
 解释：你可以通过 3 次操作使 nums1 中所有数的和与 nums2 中所有数的和相等。以下数组下标都从 0 开始。
 - 将 nums2[0] 变为 6 。 nums1 = [1,2,3,4,5,6], nums2 = [6,1,2,2,2,2] 。
 - 将 nums1[5] 变为 1 。 nums1 = [1,2,3,4,5,1], nums2 = [6,1,2,2,2,2] 。
 - 将 nums1[2] 变为 2 。 nums1 = [1,2,2,4,5,1], nums2 = [6,1,2,2,2,2] 。
 示例 2：

 输入：nums1 = [1,1,1,1,1,1,1], nums2 = [6]
 输出：-1
 解释：没有办法减少 nums1 的和或者增加 nums2 的和使二者相等。
 示例 3：

 输入：nums1 = [6,6], nums2 = [1]
 输出：3
 解释：你可以通过 3 次操作使 nums1 中所有数的和与 nums2 中所有数的和相等。以下数组下标都从 0 开始。
 - 将 nums1[0] 变为 2 。 nums1 = [2,6], nums2 = [1] 。
 - 将 nums1[1] 变为 2 。 nums1 = [2,2], nums2 = [1] 。
 - 将 nums2[0] 变为 4 。 nums1 = [2,2], nums2 = [4] 。

 提示：

 1 <= nums1.length, nums2.length <= 10^5
 1 <= nums1[i], nums2[i] <= 6
 */

func minOperations1(_ nums1: [Int], _ nums2: [Int]) -> Int {
    func help(_ h1: [Int], _ h2: [Int], _ diff: Int) -> Int {
        var diff = diff
        var h = [Int](repeating: 0, count: 7)
        for i in 1 ..< 7 {
            h[6 - i] += h1[i]
            h[i - 1] += h2[i]
        }

        var res = 0
        for i in stride(from: 5, to: 0, by: -1) where diff > 0 {
            let t = min((diff + i - 1) / i, h[i])
            res += t
            diff -= t * i
        }
        return res
    }

    let n = nums1.count
    let m = nums2.count

    if 6 * n < m || 6 * m < n {
        return -1
    }

    var cnt1 = [Int](repeating: 0, count: 7)
    var cnt2 = [Int](repeating: 0, count: 7)
    var diff = 0
    for i in nums1 {
        cnt1[i] += 1
        diff += i
    }

    for i in nums2 {
        cnt2[i] += 1
        diff -= i
    }

    if diff == 0 {
        return 0
    }

    return diff > 0 ? help(cnt2, cnt1, diff) : help(cnt1, cnt2, -diff)
}
