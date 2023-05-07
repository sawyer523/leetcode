//
//  780.reachingPoints.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/9.
//

import Foundation

/*
 780. 到达终点
 难度
 困难

 164

 给定四个整数 sx , sy ，tx 和 ty，如果通过一系列的转换可以从起点 (sx, sy) 到达终点 (tx, ty)，则返回 true，否则返回 false。

 从点 (x, y) 可以转换到 (x, x+y)  或者 (x+y, y)。

 示例 1:

 输入: sx = 1, sy = 1, tx = 3, ty = 5
 输出: true
 解释:
 可以通过以下一系列转换从起点转换到终点：
 (1, 1) -> (1, 2)
 (1, 2) -> (3, 2)
 (3, 2) -> (3, 5)
 示例 2:

 输入: sx = 1, sy = 1, tx = 2, ty = 2
 输出: false
 示例 3:

 输入: sx = 1, sy = 1, tx = 1, ty = 1
 输出: true

 提示:

 1 <= sx, sy, tx, ty <= 10^9
 */

func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
    var tx = tx
    var ty = ty
    while sx < tx &&
        sy < ty &&
        tx != ty {
        if ty < tx {
            tx %= ty
        } else {
            ty %= tx
        }
    }

    if tx == sx && ty == sy {
        return true
    } else if tx == sx {
        return sy < ty && (ty - sy) % tx == 0
    } else if ty == sy {
        return sx < tx && (tx - sx) % ty == 0
    }

    return false
}
