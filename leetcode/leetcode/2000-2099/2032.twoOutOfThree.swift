//
//  2032.twoOutOfThree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/12/29.
//

import Foundation

/*
 2032. 至少在两个数组中出现的值
 难度
 简单

 25

 给你三个整数数组 nums1、nums2 和 nums3 ，请你构造并返回一个 元素各不相同的 数组，且由 至少 在 两个 数组中出现的所有值组成。数组中的元素可以按 任意 顺序排列。

 示例 1：

 输入：nums1 = [1,1,3,2], nums2 = [2,3], nums3 = [3]
 输出：[3,2]
 解释：至少在两个数组中出现的所有值为：
 - 3 ，在全部三个数组中都出现过。
 - 2 ，在数组 nums1 和 nums2 中出现过。
 示例 2：

 输入：nums1 = [3,1], nums2 = [2,3], nums3 = [1,2]
 输出：[2,3,1]
 解释：至少在两个数组中出现的所有值为：
 - 2 ，在数组 nums2 和 nums3 中出现过。
 - 3 ，在数组 nums1 和 nums2 中出现过。
 - 1 ，在数组 nums1 和 nums3 中出现过。
 示例 3：

 输入：nums1 = [1,2,2], nums2 = [4,3,3], nums3 = [5]
 输出：[]
 解释：不存在至少在两个数组中出现的值。

 提示：

 1 <= nums1.length, nums2.length, nums3.length <= 100
 1 <= nums1[i], nums2[j], nums3[k] <= 100
 */

func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
    var mask: [Int: Int] = [:]
    for (i, nums) in [nums1, nums2, nums3].enumerated() {
        for x in nums {
            mask[x, default: 0] |= 1 << i
        }
    }

    var ans: [Int] = []
    for (k, v) in mask {
        if v & (v - 1) > 0 {
            ans.append(k)
        }
    }
    return ans
}
