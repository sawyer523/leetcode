//
//  135.candy.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/24.
//

import Foundation

/*
 135. 分发糖果
 难度
 困难

 328





 老师想给孩子们分发糖果，有 N 个孩子站成了一条直线，老师会根据每个孩子的表现，预先给他们评分。

 你需要按照以下要求，帮助老师给这些孩子分发糖果：

 每个孩子至少分配到 1 个糖果。
 相邻的孩子中，评分高的孩子必须获得更多的糖果。
 那么这样下来，老师至少需要准备多少颗糖果呢？

 示例 1:

 输入: [1,0,2]
 输出: 5
 解释: 你可以分别给这三个孩子分发 2、1、2 颗糖果。
 示例 2:

 输入: [1,2,2]
 输出: 4
 解释: 你可以分别给这三个孩子分发 1、2、1 颗糖果。
      第三个孩子只得到 1 颗糖果，这已满足上述两个条件。
 
 输入: [1,2,87,87,87,2,1]
 // 1, 2, 3, 1, 3, 2, 1
 输出: 13
 */

func candy(_ ratings: [Int]) -> Int {
    if ratings.count < 2 {
        return ratings.count
    }

    var left = [Int](repeating: 1, count: ratings.count)
    var right = [Int](repeating: 1, count: ratings.count)
    
    for i in 1..<ratings.count {
        if ratings[i - 1] < ratings[i] {
            left[i] = left[i-1] + 1
        }
    }

    var ans = left[ratings.count - 1]
    for i in (0..<ratings.count-1).reversed() {
        if ratings[i + 1] < ratings[i] {
            right[i] = right[i+1] + 1
        }
        ans += max(left[i], right[i])
    }
    
    return ans
}
//1,2,3,
