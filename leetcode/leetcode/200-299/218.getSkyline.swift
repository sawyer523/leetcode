//
//  218.getSkyline.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/7/13.
//

import Foundation

/*
 218. 天际线问题
 难度
 困难

 456

 城市的天际线是从远处观看该城市中所有建筑物形成的轮廓的外部轮廓。给你所有建筑物的位置和高度，请返回由这些建筑物形成的 天际线 。

 每个建筑物的几何信息由数组 buildings 表示，其中三元组 buildings[i] = [lefti, righti, heighti] 表示：

 lefti 是第 i 座建筑物左边缘的 x 坐标。
 righti 是第 i 座建筑物右边缘的 x 坐标。
 heighti 是第 i 座建筑物的高度。
 天际线 应该表示为由 “关键点” 组成的列表，格式 [[x1,y1],[x2,y2],...] ，并按 x 坐标 进行 排序 。关键点是水平线段的左端点。列表中最后一个点是最右侧建筑物的终点，y 坐标始终为 0 ，仅用于标记天际线的终点。此外，任何两个相邻建筑物之间的地面都应被视为天际线轮廓的一部分。

 注意：输出天际线中不得有连续的相同高度的水平线。例如 [...[2 3], [4 5], [7 5], [11 5], [12 7]...] 是不正确的答案；三条高度为 5 的线应该在最终输出中合并为一个：[...[2 3], [4 5], [12 7], ...]

 示例 1：

 输入：buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]
 输出：[[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]
 解释：
 图 A 显示输入的所有建筑物的位置和高度，
 图 B 显示由这些建筑物形成的天际线。图 B 中的红点表示输出列表中的关键点。
 示例 2：

 输入：buildings = [[0,2,3],[2,5,3]]
 输出：[[0,3],[5,0]]

 提示：

 1 <= buildings.length <= 10^4
 0 <= lefti < righti <= 2^31 - 1
 1 <= heighti <= 231 - 1
 buildings 按 lefti 非递减排序
 */

func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
//    var all: [(Int, Int)] = []
//    for building in buildings {
//        all.append((building[0], -building[2]))
//        all.append((building[1], building[2]))
//    }
//
//    all.sort(by: {$0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1)})
//
//    var m: [Int] = []
//    var res: [[Int]] = []
//    var pre = 0
//    var cur = 0
//    m.append(0)
//    for building in all {
//        if building.1 < 0 {
//            m.append(-building.1)
//            m.sort()
//        } else {
//            let idx = m.firstIndex(of: building.1)!
//            m.remove(at: idx)
//        }
//        cur = m.last ?? 0
//        if cur != pre {
//            res.append([building.0, cur])
//            pre = cur
//        }
//    }
//    return res
//
    func merge(_ buildings: [[Int]], _ start: Int, _ end: Int) -> [[Int]] {
        var res = [[Int]]()
        if start == end {
            // 只有一个建筑 [x, y, h] ，输出的解将会是 [[x, h], [y, 0]]
            res.append([buildings[start][0], buildings[start][2]])
            res.append([buildings[start][1], 0])
            return res
        }
        // 分治法
        let mid = start + (end - start) / 2
        let skyline1 = merge(buildings, start, mid)
        let skyline2 = merge(buildings, mid + 1, end)
        // h1 表示将 skyline1 中的某个关键点加入结果中时, 当前关键点的高度
        // h2 表示将 skyline2 中的某个关键点加入结果中时, 当前关键点的高度
        var h1 = 0, h2 = 0 //
        // 双指针，分别指向两组解的开头
        var i = 0, j = 0
        while i < skyline1.count || j < skyline2.count {
            let x1 = i < skyline1.count ? skyline1[i][0] : Int.max
            let x2 = j < skyline2.count ? skyline2[j][0] : Int.max
            var x = 0
            if x1 < x2 {
                h1 = skyline1[i][1]
                x = x1
                i += 1
            } else if x1 > x2 {
                h2 = skyline2[j][1]
                x = x2
                j += 1
            } else {
                h1 = skyline1[i][1]
                h2 = skyline2[j][1]
                x = x1
                i += 1
                j += 1
            }
            // 更新 height
            let height = max(h1, h2)
            // 重复的解不要加入
            if res.isEmpty || height != res[res.count - 1][1] {
                res.append([x, height])
            }
        }
        return res
    }
    return merge(buildings, 0, buildings.count - 1)
}
