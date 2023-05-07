//
//  815.numBusesToDestination.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/28.
//

import Foundation

/*
 815. 公交路线
 难度
 困难

 144

 给你一个数组 routes ，表示一系列公交线路，其中每个 routes[i] 表示一条公交线路，第 i 辆公交车将会在上面循环行驶。

 例如，路线 routes[0] = [1, 5, 7] 表示第 0 辆公交车会一直按序列 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... 这样的车站路线行驶。
 现在从 source 车站出发（初始时不在公交车上），要前往 target 车站。 期间仅可乘坐公交车。

 求出 最少乘坐的公交车数量 。如果不可能到达终点车站，返回 -1 。

 示例 1：

 输入：routes = [[1,2,7],[3,6,7]], source = 1, target = 6
 输出：2
 解释：最优策略是先乘坐第一辆公交车到达车站 7 , 然后换乘第二辆公交车到车站 6 。
 示例 2：

 输入：routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
 输出：-1

 提示：

 1 <= routes.length <= 500.
 1 <= routes[i].length <= 105
 routes[i] 中的所有值 互不相同
 sum(routes[i].length) <= 105
 0 <= routes[i][j] < 106
 0 <= source, target < 106

 */

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target {
        return 0
    }
    var stationAndBusMap = [Int: Set<Int>]()
    for i in routes.indices {
        for station in routes[i] {
            var sets = stationAndBusMap[station, default: Set<Int>()]
            sets.insert(i)
            stationAndBusMap[station] = sets
        }
    }
    let srcBuses = stationAndBusMap[source, default: Set<Int>()]
    let dstBuses = stationAndBusMap[target, default: Set<Int>()]
    if srcBuses.isEmpty || dstBuses.isEmpty {
        return -1
    }

    var usedBuses = Set<Int>()
    var curBuses = srcBuses
    var ans = 1
    while curBuses.intersection(dstBuses).isEmpty && !curBuses.isEmpty {
        usedBuses = usedBuses.union(curBuses)
        ans += 1
        var nextBuses = Set<Int>()
        for bus in curBuses {
            for staion in routes[bus] {
                let buses = stationAndBusMap[staion, default: Set<Int>()]
                for bs in buses where !usedBuses.contains(bs) {
                    nextBuses.insert(bs)
                }
            }
        }
        curBuses = nextBuses
    }
    return curBuses.isEmpty ? -1 : ans
}
