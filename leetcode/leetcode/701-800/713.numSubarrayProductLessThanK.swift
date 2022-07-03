//
//  713.numSubarrayProductLessThanK.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/5.
//

import Foundation

/*
 713. 乘积小于 K 的子数组
 难度
 中等

 433





 给你一个整数数组 nums 和一个整数 k ，请你返回子数组内所有元素的乘积严格小于 k 的连续子数组的数目。
  

 示例 1：

 输入：nums = [10,5,2,6], k = 100
 输出：8
 解释：8 个乘积小于 100 的子数组分别为：[10]、[5]、[2],、[6]、[10,5]、[5,2]、[2,6]、[5,2,6]。
 需要注意的是 [10,5,2] 并不是乘积小于 100 的子数组。
 示例 2：

 输入：nums = [1,2,3], k = 0
 输出：0
  

 提示:

 1 <= nums.length <= 3 * 104
 1 <= nums[i] <= 1000
 0 <= k <= 106
 */

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    var prod = 1
    var i = 0
    var ans = 0
    for j in 0..<nums.count {
        prod *= nums[j]
        while i <= j && k <= prod {
            prod /= nums[i]
            i += 1
        }
        ans += j - i + 1
    }
    return ans
}
