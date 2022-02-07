//
//  14.smallestK.swift
//  14.smallestK
//
//  Created by Xiaonan Chen on 2021/9/3.
//

import Foundation

/*
 面试题 17.14. 最小K个数
 难度
 中等
 
 109
 
 
 
 
 
 设计一个算法，找出数组中最小的k个数。以任意顺序返回这k个数均可。
 
 示例：
 
 输入： arr = [1,3,5,7,2,4,6,8], k = 4
 输出： [1,2,3,4]
 提示：
 
 0 <= len(arr) <= 100000
 0 <= k <= min(100000, len(arr))

 */

func smallestK(_ arr: [Int], _ k: Int) -> [Int] {
    let arr = arr.sorted()
    return Array(arr[0..<k])
}
