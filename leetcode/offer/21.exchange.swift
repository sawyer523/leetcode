//
//  21.exchange.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/23.
//

import Foundation

/*
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数在数组的前半部分，所有偶数在数组的后半部分。

 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。

 提示：

 0 <= nums.length <= 50000
 0 <= nums[i] <= 10000
 */

func exchange(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var left = 0
    var right = n - 1
    var ans = [Int](repeating: 0, count: n)
    for num in nums {
        if num & 1 == 1 {
            ans[left] = num
            left += 1
        } else {
            ans[right] = num
            right -= 1
        }
    }

    return ans
}
