//
//  84.largestRectangleArea.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/26.
//

import Foundation

/*
 84. 柱状图中最大的矩形
 难度
 困难

 1102





 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

 求在该柱状图中，能够勾勒出来的矩形的最大面积。

  


 https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/histogram.png
 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。

  


 https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/10/12/histogram_area.png
 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。

  

 示例:

 输入: [2,1,5,6,2,3]
 输出: 10
 */

func largestRectangleArea(_ heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    
    if heights.count == 1 {
        return heights[0]
    }
    
    var newHeights = [Int]()
    newHeights.append(-1)
    newHeights.append(contentsOf: heights)
    newHeights.append(-1)
    
    var stack = [Int]()
    stack.append(0)
    
    var ans = 0
    for i in 1..<newHeights.count {
        while newHeights[i] < newHeights[stack.last!] {
            let height = newHeights[stack.popLast()!]
            let width = i - stack.last! - 1
            ans = max(ans, width * height)
        }
        stack.append(i)
    }
    
    return ans
}
