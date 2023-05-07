//
//  1232.checkStraightLine.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/17.
//

import Foundation

/*
 1232. 缀点成线
 难度
 简单

 62

 在一个 XY 坐标系中有一些点，我们用数组 coordinates 来分别记录它们的坐标，其中 coordinates[i] = [x, y] 表示横坐标为 x、纵坐标为 y 的点。

 请你来判断，这些点是否在该坐标系中属于同一条直线上，是则返回 true，否则请返回 false。

 示例 1：

 输入：coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 输出：true
 示例 2：

 输入：coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
 输出：false

 提示：

 2 <= coordinates.length <= 1000
 coordinates[i].length == 2
 -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
 coordinates 中不含重复的点
 */

func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
    let (deltaX, deltaY) = (coordinates[0][0], coordinates[0][1])
    var coordinates1 = coordinates

    for (i, v) in coordinates.enumerated() {
        coordinates1[i][0] = v[0] - deltaX
        coordinates1[i][1] = v[1] - deltaY
    }

    let (A, B) = (coordinates1[1][1], -coordinates1[1][0])
    for i in 2 ..< coordinates1.count {
        let (x, y) = (coordinates1[i][0], coordinates1[i][1])
        if A * x + B * y != 0 {
            return false
        }
    }

    return true
}
