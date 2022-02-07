//
//  149.maxPoints.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/24.
//

import Foundation

/*
 149. 直线上最多的点数
 难度
 困难
 
 272
 
 
 
 
 
 给你一个数组 points ，其中 points[i] = [xi, yi] 表示 X-Y 平面上的一个点。求最多有多少个点在同一条直线上。
 
 
 
 示例 1：
 
 
 输入：points = [[1,1],[2,2],[3,3]]
 输出：3
 示例 2：
 
 
 输入：points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 输出：4
 
 
 提示：
 
 1 <= points.length <= 300
 points[i].length == 2
 -104 <= xi, yi <= 104
 points 中的所有点 互不相同
 */

func maxPoints(_ points: [[Int]]) -> Int {
    let n = points.count
    if n <= 2 {
        return n
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b != 0 ? gcd(b, a%b) : a
    }
    
    var ans = 0
    for (i, p) in points.enumerated() {
        if n - i <= ans || n/2 < ans {
            break
        }
        var cnt: [Int: Int] = [:]
        for j in i+1..<n {
            var x = p[0] - points[j][0]
            var y = p[1] - points[j][1]
            if x == 0 {
                y = 1
            } else if y == 0 {
                x = 1
            } else {
                if y < 0 {
                    x = -x
                    y = -y
                }
                let g = gcd(abs(x), abs(y))
                x /= g
                y /= g
            }
            cnt[y+x*20001, default: 0] += 1
        }
        
        for (_, v) in cnt {
            ans = max(ans, v + 1)
        }
    }
    return ans
}
