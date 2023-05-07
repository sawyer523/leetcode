//
//  66.constructArr.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/4/2.
//

import Foundation

/*
 剑指 Offer 66. 构建乘积数组
 给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B[i] 的值是数组 A 中除了下标 i 以外的元素的积, 即 B[i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。

 示例:

 输入: [1,2,3,4,5]
 输出: [120,60,40,30,24]

 提示：

 所有元素乘积之和不会溢出 32 位整数
 a.length <= 100000
 */

func constructArr(_ a: [Int]) -> [Int] {
    let n = a.count
    if n == 0 {
        return []
    }
    var ans = [Int](repeating: 0, count: n)

    ans[0] = 1
    for i in 1 ..< n {
        ans[i] = a[i - 1] * ans[i - 1]
    }

    var r = 1
    for i in stride(from: n - 1, through: 0, by: -1) {
        ans[i] = ans[i] * r
        r *= a[i]
    }

    return ans
}
