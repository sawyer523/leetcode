//
//  1818.minAbsoluteSumDiff.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/14.
//

import Foundation

/*
 1818. 绝对差值和
 难度
 中等
 
 40
 
 
 
 
 
 给你两个正整数数组 nums1 和 nums2 ，数组的长度都是 n 。
 
 数组 nums1 和 nums2 的 绝对差值和 定义为所有 |nums1[i] - nums2[i]|（0 <= i < n）的 总和（下标从 0 开始）。
 
 你可以选用 nums1 中的 任意一个 元素来替换 nums1 中的 至多 一个元素，以 最小化 绝对差值和。
 
 在替换数组 nums1 中最多一个元素 之后 ，返回最小绝对差值和。因为答案可能很大，所以需要对 10^9 + 7 取余 后返回。
 
 |x| 定义为：
 
 如果 x >= 0 ，值为 x ，或者
 如果 x <= 0 ，值为 -x
 
 
 示例 1：
 
 输入：nums1 = [1,7,5], nums2 = [2,3,5]
 输出：3
 解释：有两种可能的最优方案：
 - 将第二个元素替换为第一个元素：[1,7,5] => [1,1,5] ，或者
 - 将第二个元素替换为第三个元素：[1,7,5] => [1,5,5]
 两种方案的绝对差值和都是 |1-2| + (|1-3| 或者 |5-3|) + |5-5| = 3
 示例 2：
 
 输入：nums1 = [2,4,6,8,10], nums2 = [2,4,6,8,10]
 输出：0
 解释：nums1 和 nums2 相等，所以不用替换元素。绝对差值和为 0
 示例 3：
 
 输入：nums1 = [1,10,4,4,2,7], nums2 = [9,3,5,1,7,4]
 输出：20
 解释：将第一个元素替换为第二个元素：[1,10,4,4,2,7] => [10,10,4,4,2,7]
 绝对差值和为 |10-9| + |10-3| + |4-5| + |4-1| + |2-7| + |7-4| = 20
 
 
 提示：
 
 n == nums1.length
 n == nums2.length
 1 <= n <= 10^5
 1 <= nums1[i], nums2[i] <= 10^5
 */

func minAbsoluteSumDiff(_ nums1: [Int], _ nums2: [Int]) -> Int {
//    let mod = Int(10e9 + 7)
//    func binarySearch(_ rec: [Int], _ target: Int) -> Int {
//        var low = 0
//        var high = rec.count - 1
//        if rec.last! < target {
//            return high + 1
//        }
//
//        while low < high {
//            let mid = low + (high - low) / 2
//            if rec[mid] < target {
//                low = mid + 1
//            } else {
//                high = mid
//            }
//        }
//
//        return low
//    }
//
//    let n = nums1.count
//    var maxSub = 0
//    let rec = nums1.sorted()
//    var sum = 0
//    for i in 0..<n where nums1[i] != nums2[i] {
//        let sub = abs(nums1[i] - nums2[i])
//        sum += sub
//        let j = binarySearch(rec, nums2[i])
//        if j < n {
//            maxSub = max(maxSub, sub - (rec[j] - nums2[i]))
//        }
//
//    }
//
//
//    return (sum - maxSub) % mod
    
    let c = min(nums1.count, nums2.count), d = 1_000_000_007
    var asd = 0, nums = [Int: Bool](), replaceMaxDiff = 0
    for i in 0..<c {
        nums[nums1[i]] = true
        asd += abs(nums1[i] - nums2[i])
    }
    let numsSorted = Array(nums.keys).sorted(), cs = numsSorted.count
    for i in 0..<c where nums1[i] != nums2[i] {
        if nums[nums2[i], default: false] { // nums2[i] exists in nums1
            replaceMaxDiff = max(replaceMaxDiff, abs(nums1[i] - nums2[i]))
        } else { // find closest to nums2[i] in nums1
            var left = 0, right = cs - 1
            while right - left > 1 {
                let center = (left + right) / 2
                if numsSorted[center] > nums2[i] {
                    right = center
                } else {
                    left = center
                }
            }
            let newDiff = min(abs(numsSorted[left] - nums2[i]), abs(numsSorted[right] - nums2[i]))
            replaceMaxDiff = max(replaceMaxDiff, abs(nums1[i] - nums2[i]) - newDiff)
        }
    }
    return (asd - replaceMaxDiff) % d
}
