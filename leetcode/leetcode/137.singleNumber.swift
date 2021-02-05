//
//  137.singleNumber.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/29.
//

import Foundation

/*
 137. 只出现一次的数字 II
 难度
 中等

 483





 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,3,2]
 输出: 3
 示例 2:

 输入: [0,1,0,1,0,1,99]
 输出: 99

 */


func singleNumber1(_ nums: [Int]) -> Int {
    //set
//    var set: Set<Int> = []
//    var sum = 0
//    var sumArr = 0
//    for i in nums {
//        sumArr += i
//        set.insert(i)
//    }
//
//    for i in set {
//        sum += i
//    }
//
//    return (sum * 3 - sumArr) / 2
    var seenOnce = 0
    var seenTwice = 0
    for i in nums {
        seenOnce = ~seenTwice & (seenOnce ^ i)
        seenTwice = ~seenOnce & (seenTwice ^ i)
    }

    return seenOnce
}
