//
//  905.sortArrayByParity.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/28.
//

import Foundation

/*
 905. 按奇偶排序数组
 难度
 简单

 254





 给你一个整数数组 nums，将 nums 中的的所有偶数元素移动到数组的前面，后跟所有奇数元素。

 返回满足此条件的 任一数组 作为答案。

  

 示例 1：

 输入：nums = [3,1,2,4]
 输出：[2,4,3,1]
 解释：[4,2,3,1]、[2,4,1,3] 和 [4,2,1,3] 也会被视作正确答案。
 示例 2：

 输入：nums = [0]
 输出：[0]
  

 提示：

 1 <= nums.length <= 5000
 0 <= nums[i] <= 5000
 */

func sortArrayByParity(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var ans = [Int](repeating: 0, count: n)
    var left = 0
    var right = n - 1
    for num in nums {
        if num & 1 == 0 {
            ans[left] = num
            left += 1
        } else {
            ans[right] = num
            right -= 1
        }
    }
    return ans
}
