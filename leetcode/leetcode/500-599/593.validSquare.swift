//
//  593.validSquare.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/29.
//

import Foundation

/*
 593. 有效的正方形
 难度
 中等

 107

 给定2D空间中四个点的坐标 p1, p2, p3 和 p4，如果这四个点构成一个正方形，则返回 true 。

 点的坐标 pi 表示为 [xi, yi] 。输入 不是 按任何顺序给出的。

 一个 有效的正方形 有四条等边和四个等角(90度角)。

 示例 1:

 输入: p1 = [0,0], p2 = [1,1], p3 = [1,0], p4 = [0,1]
 输出: True
 示例 2:

 输入：p1 = [0,0], p2 = [1,1], p3 = [1,0], p4 = [0,12]
 输出：false
 示例 3:

 输入：p1 = [1,0], p2 = [-1,0], p3 = [0,1], p4 = [0,-1]
 输出：true

 提示:

 p1.length == p2.length == p3.length == p4.length == 2
 -10^4 <= xi, yi <= 10^4

 */

func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
    func checkLenght(_ v1: [Int], _ v2: [Int]) -> Bool {
        return v1[0] * v1[0] + v1[1] * v1[1] == v2[0] * v2[0] + v2[1] * v2[1]
    }

    func checkMidPoint(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        return p1[0] + p2[0] == p3[0] + p4[0] && p1[1] + p2[1] == p3[1] + p4[1]
    }

    func calCos(_ v1: [Int], _ v2: [Int]) -> Int {
        return v1[0] * v2[0] + v1[1] * v2[1]
    }

    func help(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let v1 = [p1[0] - p2[0], p1[1] - p2[1]]
        let v2 = [p3[0] - p4[0], p3[1] - p4[1]]
        return checkMidPoint(p1, p2, p3, p4) && checkLenght(v1, v2) && calCos(v1, v2) == 0
    }

    if p1[0] == p2[0] && p1[1] == p2[1] {
        return false
    }
    if help(p1, p2, p3, p4) {
        return true
    }
    if p1[0] == p3[0] && p1[1] == p3[1] {
        return false
    }
    if help(p1, p3, p2, p4) {
        return true
    }
    if p1[0] == p4[0] && p1[1] == p4[1] {
        return false
    }
    if help(p1, p4, p2, p3) {
        return true
    }
    return false
}
