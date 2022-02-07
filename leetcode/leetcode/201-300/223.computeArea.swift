//
//  223.computeArea.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/9/30.
//

import Foundation

/*
 223. 矩形面积
 难度
 中等
 
 127
 
 
 
 
 
 给你 二维 平面上两个 由直线构成的 矩形，请你计算并返回两个矩形覆盖的总面积。
 
 每个矩形由其 左下 顶点和 右上 顶点坐标表示：
 
 第一个矩形由其左下顶点 (ax1, ay1) 和右上顶点 (ax2, ay2) 定义。
 第二个矩形由其左下顶点 (bx1, by1) 和右上顶点 (bx2, by2) 定义。
 
 
 示例 1：
 
 Rectangle Area
 输入：ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
 输出：45
 示例 2：
 
 输入：ax1 = -2, ay1 = -2, ax2 = 2, ay2 = 2, bx1 = -2, by1 = -2, bx2 = 2, by2 = 2
 输出：16
 
 
 提示：
 
 -10^4 <= ax1, ay1, ax2, ay2, bx1, by1, bx2, by2 <= 10^4
 */

func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
    let area1 = (ax2 - ax1) * (ay2 - ay1)
    let area2 = (bx2 - bx1) * (by2 - by1)
    let ow = min(ax2, bx2) - max(ax1, bx1)
    let oh = min(ay2, by2) - max(ay1, by1)
    let oarea = max(ow, 0) * max(oh, 0)
    return area1 + area2 - oarea
}
