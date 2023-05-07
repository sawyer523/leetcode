//
//  478.solution.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/5.
//

import Foundation

/*
 478. 在圆内随机生成点
 难度
 中等

 134

 给定圆的半径和圆心的位置，实现函数 randPoint ，在圆中产生均匀随机点。

 实现 Solution 类:

 Solution(double radius, double x_center, double y_center) 用圆的半径 radius 和圆心的位置 (x_center, y_center) 初始化对象
 randPoint() 返回圆内的一个随机点。圆周上的一点被认为在圆内。答案作为数组返回 [x, y] 。

 示例 1：

 输入:
 ["Solution","randPoint","randPoint","randPoint"]
 [[1.0, 0.0, 0.0], [], [], []]
 输出: [null, [-0.02493, -0.38077], [0.82314, 0.38945], [0.36572, 0.17248]]
 解释:
 Solution solution = new Solution(1.0, 0.0, 0.0);
 solution.randPoint ();//返回[-0.02493，-0.38077]
 solution.randPoint ();//返回[0.82314,0.38945]
 solution.randPoint ();//返回[0.36572,0.17248]

 提示：

 0 < radius <= 10^8
 -10^7 <= x_center, y_center <= 10^7
 randPoint 最多被调用 3 * 10^4 次
 */

class Solution478 {
    private let radius: Double
    private let xCenter: Double
    private let yCenter: Double
    init(_ radius: Double, _ x_center: Double, _ y_center: Double) {
        self.radius = radius
        xCenter = x_center
        yCenter = y_center
    }

    func randPoint() -> [Double] {
//        while true {
//            let x = Double.random(in: -radius...radius)
//            let y = Double.random(in: -radius...radius)
//            if x*x + y*y < 1 {
//                return [xCenter + x * radius, yCenter + y * radius]
//            }
//        }
        let r = sqrt(Double.random(in: 0 ... 1))
        let theta = Double.random(in: 0 ... 1) * 2 * Double.pi
        return [xCenter + radius * cos(theta) * r, yCenter + radius * sin(theta) * r]
    }
}
