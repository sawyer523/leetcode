//
//  978.maxTurbulenceSize.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/2/8.
//

import Foundation

/*
 978. 最长湍流子数组
 难度
 中等

 90

 当 A 的子数组 A[i], A[i+1], ..., A[j] 满足下列条件时，我们称其为湍流子数组：

 若 i <= k < j，当 k 为奇数时， A[k] > A[k+1]，且当 k 为偶数时，A[k] < A[k+1]；
 或 若 i <= k < j，当 k 为偶数时，A[k] > A[k+1] ，且当 k 为奇数时， A[k] < A[k+1]。
 也就是说，如果比较符号在子数组中的每个相邻元素对之间翻转，则该子数组是湍流子数组。

 返回 A 的最大湍流子数组的长度。

 示例 1：

 输入：[9,4,2,10,7,8,8,1,9]
 输出：5
 解释：(A[1] > A[2] < A[3] > A[4] < A[5])
 示例 2：

 输入：[4,8,12,16]
 输出：2
 示例 3：

 输入：[100]
 输出：1

 提示：

 1 <= A.length <= 40000
 0 <= A[i] <= 10^9

 */

func maxTurbulenceSize(_ arr: [Int]) -> Int {
    var left = 0
    var right = 0
    var ans = 1
    while right < arr.count - 1 {
        if left == right {
            if arr[left] == arr[left + 1] {
                left += 1
            }
            right += 1
        } else {
            if arr[right - 1] < arr[right] && arr[right + 1] < arr[right] {
                right += 1
            } else if arr[right] < arr[right - 1] && arr[right] < arr[right + 1] {
                right += 1

            } else {
                left = right
            }
        }
        ans = max(ans, right - left + 1)
    }
    return ans
}

func maxTurbulenceSizeDP(_ arr: [Int]) -> Int {
    let n = arr.count
    var up = 1
    var down = 1
    var curUp = 0
    var curDown = 0
    var ans = 1
    for i in 1 ..< n {
        (curUp, curDown) = (up, down)
        (up, down) = (1, 1)
        if arr[i] < arr[i - 1] {
            up = curDown + 1
        } else if arr[i - 1] < arr[i] {
            down = curUp + 1
        }
        ans = max(ans, up, down)
    }

    return ans
}
