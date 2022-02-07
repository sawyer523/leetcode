//
//  611.triangleNumber.swift
//  611.triangleNumber
//
//  Created by Xiaonan Chen on 2021/8/4.
//

import Foundation

/*
 611. 有效三角形的个数
 难度
 中等
 
 217
 
 
 
 
 
 给定一个包含非负整数的数组，你的任务是统计其中可以组成三角形三条边的三元组个数。
 
 示例 1:
 
 输入: [2,2,3,4]
 输出: 3
 解释:
 有效的组合是:
 2,3,4 (使用第一个 2)
 2,3,4 (使用第二个 2)
 2,2,3
 注意:
 
 数组长度不超过1000。
 数组里整数的范围为 [0, 1000]。

 */

func triangleNumber(_ nums: [Int]) -> Int {
//    let n = nums.count
//    let nums = nums.sorted()
//    var ans = 0
//    for i in 0..<n {
//        var k = i
//        for j in i+1..<n {
//            while  k + 1 < n && nums[k+1] < nums[i] + nums[j]{
//                k += 1
//            }
//            ans += max(k-j, 0)
//        }
//    }
//
//    return ans
    
    guard nums.count > 2 else { return 0 }
    var arr = nums
    arr.sort()
    var res = 0
    for i in stride(from: arr.count-1, through: 2, by: -1) {
        var l = 0, r = i - 1
        while l < r {
            if arr[i] < arr[l] + arr[r]{
                res += r - l
                r -= 1
            } else {
                l += 1
            }
        }
    }
    return res
}
