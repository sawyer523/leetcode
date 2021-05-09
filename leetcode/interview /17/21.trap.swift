//
//  17.21.trap.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/4/2.
//

import Foundation

func trap(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var leftMax = 0
    var rightMax = 0
    var res = 0
    while left < right {
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if height[left] < height[right] {
            res += leftMax - height[left]
            left += 1
        } else {
            res += rightMax - height[right]
            right -= 1
        }
    }
    
    return res
}
