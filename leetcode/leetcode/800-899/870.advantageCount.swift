//
//  870.advantageCount.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/25.
//

import Foundation

/*
 870. 优势洗牌
 难度
 中等

 99

 给定两个大小相等的数组 A 和 B，A 相对于 B 的优势可以用满足 A[i] > B[i] 的索引 i 的数目来描述。

 返回 A 的任意排列，使其相对于 B 的优势最大化。

 示例 1：

 输入：A = [2,7,11,15], B = [1,10,4,11]
 输出：[2,11,7,15]
 示例 2：

 输入：A = [12,24,8,32], B = [13,25,32,11]
 输出：[24,32,8,12]

 提示：

 1 <= A.length = B.length <= 10000
 0 <= A[i] <= 10^9
 0 <= B[i] <= 10^9
 */

func advantageCount(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    func binaryFind(_ arr: [Int], _ target: Int) -> Int {
//        var left = 0
//        var right = arr.count - 1
//        if target < arr[left] {
//            return left
//        }
//
//        if arr[right] <= target {
//            return left
//        }
//
//        while left < right {
//            let mid = left + (right - left) / 2
//            if arr[mid] <= target {
//                left = mid + 1
//            } else {
//                right = mid
//            }
//        }
//
//        return right
//    }
//
//    var sortA = A.sorted()
//    var ans: [Int] = []
//    for target in B {
//        let index = binaryFind(sortA, target)
//        ans.append(sortA[index])
//        sortA.remove(at: index)
//    }
//
//    return ans

    let n = nums1.count
    var idx: [(Int, Int)] = []

    for i in 0 ..< n {
        idx.append((i, nums2[i]))
    }

    idx.sort { a, b in
        b.1 <= a.1
    }

    let nums1 = nums1.sorted()
    var ans = [Int](repeating: 0, count: n)
    var left = 0
    var right = n - 1
    for i in 0 ..< n {
        let p = idx[i]
        if p.1 < nums1[right] {
            ans[p.0] = nums1[right]
            right -= 1
        } else {
            ans[p.0] = nums1[left]
            left += 1
        }
    }

    return ans
}
