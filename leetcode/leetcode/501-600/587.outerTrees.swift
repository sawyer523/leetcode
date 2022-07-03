//
//  587.outerTrees.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/4/24.
//

import Foundation

/*
 587. 安装栅栏
 难度
 困难

 186





 在一个二维的花园中，有一些用 (x, y) 坐标表示的树。由于安装费用十分昂贵，你的任务是先用最短的绳子围起所有的树。只有当所有的树都被绳子包围时，花园才能围好栅栏。你需要找到正好位于栅栏边界上的树的坐标。

  

 示例 1:

 输入: [[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]]
 输出: [[1,1],[2,0],[4,2],[3,3],[2,4]]
 解释:

 示例 2:

 输入: [[1,2],[2,2],[4,2]]
 输出: [[1,2],[2,2],[4,2]]
 解释:

 即使树都在一条直线上，你也需要先用绳子包围它们。
  

 注意:

 所有的树应当被围在一起。你不能剪断绳子来包围树或者把树分成一组以上。
 输入的整数在 0 到 100 之间。
 花园至少有一棵树。
 所有树的坐标都是不同的。
 输入的点没有顺序。输出顺序也没有要求。
 */

func outerTrees(_ trees: [[Int]]) -> [[Int]] {
    func cross(_ p: [Int], _ q: [Int], _ r: [Int]) -> Int {
        return (q[0] - p[0]) * (r[1] - q[1]) - (q[1] - p[1]) * (r[0] - q[0])
    }
    
    let n = trees.count
    if n < 4 {
        return trees
    }
    
    let trees = trees.sorted {
        return $0[0] < $1[0] ||
            $0[0] == $1[0] && $0[1] < $1[1]
    }
    
    var hull = [0]
    var used = [Bool](repeating: false, count: n)
    
    for i in 1..<n {
        while 1 < hull.count &&
                cross(trees[hull[hull.count - 2]], trees[hull[hull.count - 1]], trees[i]) < 0 {
            used[hull.removeLast()] = false
        }
        used[i] = true
        hull.append(i)
    }
    
    let m = hull.count
    for i in stride(from: n-2, through: 0, by: -1) {
        if !used[i] {
            while m < hull.count &&
                    cross(trees[hull[hull.count - 2]], trees[hull[hull.count - 1]], trees[i]) < 0 {
                used[hull.removeLast()] = false
            }
            used[i] = true
            hull.append(i)
        }
    }
    
    hull.removeLast()
    
    var ans = [[Int]](repeating: [], count: hull.count)
    for i in hull.indices {
        ans[i] = trees[hull[i]]
    }
    
    return ans
}
