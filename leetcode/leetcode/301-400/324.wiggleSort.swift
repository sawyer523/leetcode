//
//  324.wiggleSort.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/28.
//

import Foundation

/*
 324. 摆动排序 II
 难度
 中等

 371





 给你一个整数数组 nums，将它重新排列成 nums[0] < nums[1] > nums[2] < nums[3]... 的顺序。

 你可以假设所有输入数组都可以得到满足题目要求的结果。

  

 示例 1：

 输入：nums = [1,5,1,1,6,4]
 输出：[1,6,1,5,1,4]
 解释：[1,4,1,5,1,6] 同样是符合题目要求的结果，可以被判题程序接受。
 示例 2：

 输入：nums = [1,3,2,2,3,1]
 输出：[2,3,1,3,1,2]
  

 提示：

 1 <= nums.length <= 5 * 10^4
 0 <= nums[i] <= 5000
 题目数据保证，对于给定的输入 nums ，总能产生满足题目要求的结果
 */

func wiggleSort(_ nums: inout [Int]) {
    let arr = nums.sorted()
    let n = arr.count
    let x = (n + 1) >> 1
    var j = x - 1
    var k = n - 1
    for i in stride(from: 0, to: n, by: 2) {
        nums[i] = arr[j]
        if i + 1 < n {
            nums[i+1] = arr[k]
        }
        j -= 1
        k -= 1
    }
}
