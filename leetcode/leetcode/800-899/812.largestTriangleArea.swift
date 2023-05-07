//
//  812.largestTriangleArea.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/15.
//

import Foundation

/*
 812. 最大三角形面积
 难度
 简单

 135

 给定包含多个点的集合，从其中取三个点组成三角形，返回能组成的最大三角形的面积。

 示例:
 输入: points = [[0,0],[0,1],[1,0],[0,2],[2,0]]
 输出: 2
 解释:
 这五个点如下图所示。组成的橙色三角形是最大的，面积为2。

 注意:

 3 <= points.length <= 50.
 不存在重复的点。
  -50 <= points[i][j] <= 50.
 结果误差值在 10^-6 以内都认为是正确答案。
 */

func largestTriangleArea(_ points: [[Int]]) -> Double {
    func cross(_ p: [Int], _ q: [Int], _ r: [Int]) -> Int {
        return (q[0] - p[0]) * (r[1] - q[1]) - (q[1] - p[1]) * (r[0] - q[0])
    }

    func getConvexHull(_ points: [[Int]]) -> [[Int]] {
        let n = points.count
        if n < 4 {
            return points
        }

        let points = points.sorted { a, b in
            a[0] < b[0] ||
                a[0] == b[0] && a[1] < b[1]
        }

        var hull: [[Int]] = []

        for point in points {
            while hull.count > 1 &&
                cross(hull[hull.count - 2], hull.last!, point) <= 0 {
                hull.removeLast()
            }
            hull.append(point)
        }

        let m = hull.count
        for i in stride(from: n - 1, through: 0, by: -1) {
            while m < hull.count && cross(hull[hull.count - 2], hull.last!, points[i]) <= 0 {
                hull.removeLast()
            }
            hull.append(points[i])
        }

        hull.removeLast()
        return hull
    }

    func triangleArea(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ x3: Int, _ y3: Int) -> Double {
        return abs(Double(x1 * y2 + x2 * y3 + x3 * y1 - x1 * y3 - x2 * y1 - x3 * y2)) / 2
    }

    var ans: Double = 0
    let convexHull = getConvexHull(points)
    let n = convexHull.count
    for (i, p) in convexHull.enumerated() {
        if n - 1 <= i + 1 {
            continue
        }
        var k = i + 2
        for j in i + 1 ..< n - 1 {
            let q = convexHull[j]
            while k < n - 1 {
                let curArea = triangleArea(p[0], p[1], q[0], q[1], convexHull[k][0], convexHull[k][1])
                let nextArea = triangleArea(p[0], p[1], q[0], q[1], convexHull[k + 1][0], convexHull[k + 1][1])
                if nextArea <= curArea {
                    break
                }
                k += 1
            }
            ans = max(ans, triangleArea(p[0], p[1], q[0], q[1], convexHull[k][0], convexHull[k][1]))
        }
    }

    return ans
}
