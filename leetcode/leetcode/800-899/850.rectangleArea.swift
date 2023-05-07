//
//  850.rectangleArea.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/16.
//

import Foundation

/*
 850. 矩形面积 II
 难度
 困难

 136

 我们给出了一个（轴对齐的）二维矩形列表 rectangles 。 对于 rectangle[i] = [x1, y1, x2, y2]，其中（x1，y1）是矩形 i 左下角的坐标， (xi1, yi1) 是该矩形 左下角 的坐标， (xi2, yi2) 是该矩形 右上角 的坐标。

 计算平面中所有 rectangles 所覆盖的 总面积 。任何被两个或多个矩形覆盖的区域应只计算 一次 。

 返回 总面积 。因为答案可能太大，返回 109 + 7 的 模 。

 示例 1：

 输入：rectangles = [[0,0,2,2],[1,0,2,3],[1,0,3,1]]
 输出：6
 解释：如图所示，三个矩形覆盖了总面积为6的区域。
 从(1,1)到(2,2)，绿色矩形和红色矩形重叠。
 从(1,0)到(2,3)，三个矩形都重叠。
 示例 2：

 输入：rectangles = [[0,0,1000000000,1000000000]]
 输出：49
 解释：答案是 1018 对 (109 + 7) 取模的结果， 即 49 。

 提示：

 1 <= rectangles.length <= 200
 rectanges[i].length = 4
 0 <= xi1, yi1, xi2, yi2 <= 10^9
 矩形叠加覆盖后的总面积不会超越 2^63 - 1 ，这意味着可以用一个 64 位有符号整数来保存面积结果。
 */

func rectangleArea(_ rectangles: [[Int]]) -> Int {
    let n = rectangles.count
    var lineX = [Int: [Int]](), sliceRectangles = Set<Int>(), lastX = 0, result = 0
    for i in 0 ..< n {
        lineX[rectangles[i][0], default: [Int]()].append(i + 1) // starts at x1
        lineX[rectangles[i][2], default: [Int]()].append(-(i + 1)) // ends at x2
    }
    for x in lineX.keys.sorted() {
        if x > lastX, !sliceRectangles.isEmpty {
            var lineY = [Int: Int](), slice = 0, lastY = 0, lengthY = 0
            for i in sliceRectangles {
                lineY[rectangles[i][1], default: Int(0)] += 1 // starts at y1
                lineY[rectangles[i][3], default: Int(0)] -= 1 // ends at y2
            }
            for y in lineY.keys.sorted() {
                guard let dys = lineY[y] else {
                    continue
                }
                if slice > 0 {
                    lengthY += y - lastY
                }
                slice += dys
                lastY = y
            }
            result += lengthY * (x - lastX)
        }
        lastX = x
        guard let dxs = lineX[x] else {
            continue
        }
        for dx in dxs.sorted(by: >) { // first starts, then ends
            if dx > 0 { // starts
                sliceRectangles.insert(dx - 1)
            } else { // ends
                sliceRectangles.remove(-dx - 1)
            }
        }
    }
    return result % 1_000_000_007
}
