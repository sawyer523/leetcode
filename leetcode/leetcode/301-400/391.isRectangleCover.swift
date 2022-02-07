//
//  391.isRectangleCover.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/16.
//

import Foundation

/*
 391. 完美矩形
 难度
 困难
 
 108
 
 
 
 
 
 给你一个数组 rectangles ，其中 rectangles[i] = [xi, yi, ai, bi] 表示一个坐标轴平行的矩形。这个矩形的左下顶点是 (xi, yi) ，右上顶点是 (ai, bi) 。
 
 如果所有矩形一起精确覆盖了某个矩形区域，则返回 true ；否则，返回 false 。
 
 
 示例 1：
 
 
 输入：rectangles = [[1,1,3,3],[3,1,4,2],[3,2,4,4],[1,3,2,4],[2,3,3,4]]
 输出：true
 解释：5 个矩形一起可以精确地覆盖一个矩形区域。
 示例 2：
 
 
 输入：rectangles = [[1,1,2,3],[1,3,2,4],[3,1,4,2],[3,2,4,4]]
 输出：false
 解释：两个矩形之间有间隔，无法覆盖成一个矩形。
 示例 3：
 
 
 输入：rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[3,2,4,4]]
 输出：false
 解释：图形顶端留有空缺，无法覆盖成一个矩形。
 示例 4：
 
 
 输入：rectangles = [[1,1,3,3],[3,1,4,2],[1,3,2,4],[2,2,4,4]]
 输出：false
 解释：因为中间有相交区域，虽然形成了矩形，但不是精确覆盖。
 
 
 提示：
 
 1 <= rectangles.length <= 2 * 10^4
 rectangles[i].length == 4
 -10^5 <= xi, yi, ai, bi <= 10^5
 */

func isRectangleCover(_ rectangles: [[Int]]) -> Bool {
    struct point: Hashable {
        var x: Int
        var y: Int
    }
    var area = 0
    var minX = rectangles[0][0]
    var minY = rectangles[0][1]
    var maxX = rectangles[0][2]
    var maxY = rectangles[0][3]
    var cnt: [point: Int] = [:]
    
    for rect in rectangles {
        let x = rect[0]
        let y = rect[1]
        let a = rect[2]
        let b = rect[3]
        
        area += (a - x) * (b - y)
        
        minX = min(minX, x)
        minY = min(minY, y)
        maxX = max(maxX, a)
        maxY = max(maxY, b)
        
        cnt[point(x: x, y: y), default: 0] += 1
        cnt[point(x: x, y: b), default: 0] += 1
        cnt[point(x: a, y: y), default: 0] += 1
        cnt[point(x: a, y: b), default: 0] += 1
    }
    
    if area != (maxX - minX) * (maxY - minY) ||
        cnt[point(x: minX, y: minY)] != 1 ||
        cnt[point(x: minX, y: maxY)] != 1 ||
        cnt[point(x: maxX, y: minY)] != 1 ||
        cnt[point(x: maxX, y: maxY)] != 1 {
        return false
    }
    
    cnt.removeValue(forKey: point(x: minX, y: minY))
    cnt.removeValue(forKey: point(x: minX, y: maxY))
    cnt.removeValue(forKey: point(x: maxX, y: minY))
    cnt.removeValue(forKey: point(x: maxX, y: maxY))
    
    for (_, v) in cnt {
        if v != 2 && v != 4 {
            return false
        }
    }
    
    return true
}
