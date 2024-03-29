//
//  448.findDisappearedNumbers.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/28.
//

import Foundation

/*
 448. 找到所有数组中消失的数字
 难度
 简单

 525

 给定一个范围在  1 ≤ a[i] ≤ n ( n = 数组大小 ) 的 整型数组，数组中的元素一些出现了两次，另一些只出现一次。

 找到所有在 [1, n] 范围之间没有出现在数组中的数字。

 您能在不使用额外空间且时间复杂度为O(n)的情况下完成这个任务吗? 你可以假定返回的数组不算在额外空间内。

 示例:

 输入:
 [4,3,2,7,8,2,3,1]

 输出:
 [5,6]
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
        return nums
    }
    var list = nums
    for i in 0 ..< nums.count {
        var index = list[i]
        if index < 0 {
            index = -index
        }
        let target = list[index - 1]
        if target > 0 {
            list[index - 1] = -target
        }
    }

    var ans: [Int] = []
    for j in 0 ..< list.count {
        if list[j] > 0 {
            ans.append(j + 1)
        }
    }

    return ans
}
