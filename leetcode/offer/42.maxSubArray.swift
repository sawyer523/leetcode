//
//  53.maxSubArray.swift
//  53.maxSubArray
//
//  Created by Xiaonan Chen on 2021/7/17.
//

import Foundation

/*
 剑指 Offer 42. 连续子数组的最大和
 难度
 简单

 341

 输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。

 示例1:

 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

 提示：

 1 <= arr.length <= 10^5
 -100 <= arr[i] <= 100

 */

func maxSubArray(_ nums: [Int]) -> Int {
    var max = nums[0]
    var nums = nums
    for i in 1 ..< nums.count {
        if nums[i] < nums[i - 1] + nums[i] {
            nums[i] += nums[i - 1]
        }
        if max < nums[i] {
            max = nums[i]
        }
    }
    return max
}

/*
 max := nums[0]
 for i := 1; i < len(nums); i++ {
 if nums[i] + nums[i-1] > nums[i] {
 nums[i] += nums[i-1]
 }
 if nums[i] > max {
 max = nums[i]
 }
 }
 return max

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/lian-xu-zi-shu-zu-de-zui-da-he-lcof/solution/lian-xu-zi-shu-zu-de-zui-da-he-by-leetco-tiui/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
