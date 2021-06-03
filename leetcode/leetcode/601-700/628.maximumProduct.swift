//
//  628.maximumProduct.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/20.
//

import Foundation

/*
 628. 三个数的最大乘积
 难度
 简单

 218





 给定一个整型数组，在数组中找出由三个数组成的最大乘积，并输出这个乘积。

 示例 1:

 输入: [1,2,3]
 输出: 6
 示例 2:

 输入: [1,2,3,4]
 输出: 24
 注意:

 给定的整型数组长度范围是[3,104]，数组中所有的元素范围是[-1000, 1000]。
 输入的数组中任意三个数的乘积不会超出32位有符号整数的范围。
 */

func maximumProduct(_ nums: [Int]) -> Int {
    var (min1, min2) = (Int.max, Int.max)
    var (max1, max2, max3) = (Int.min, Int.min, Int.min)
    for i in nums {
        if i < min1 {
            (min2, min1) = (min1, i)
        } else if i < min2 {
            min2 = i
        }

        if max1 < i {
            (max3, max2, max1) = (max2, max1, i)
        } else if max2 < i {
            (max3, max2) = (max2, i)
        } else if max3 < i {
            max3 = i
        }
    }
    return max(min1*min2*max1, max1*max2*max3)
}
