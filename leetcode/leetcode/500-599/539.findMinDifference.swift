//
//  539.findMinDifference.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/18.
//

import Foundation

/*
 539. 最小时间差
 难度
 中等

 126

 给定一个 24 小时制（小时:分钟 "HH:MM"）的时间列表，找出列表中任意两个时间的最小时间差并以分钟数表示。

 示例 1：

 输入：timePoints = ["23:59","00:00"]
 输出：1
 示例 2：

 输入：timePoints = ["00:00","23:59","00:00"]
 输出：0

 提示：

 2 <= timePoints <= 2 * 10^4
 timePoints[i] 格式为 "HH:MM"
 */

func findMinDifference(_ timePoints: [String]) -> Int {
    let timePoints = timePoints.sorted()
    var ans = Int.max

    func getMinutes(_ t: String) -> Int {
        let arr = t.split(separator: ":")
        return Int(arr[0])! * 60 + Int(arr[1])!
    }

    let t0 = getMinutes(timePoints[0])
    var pre = t0

    for i in 1 ..< timePoints.count {
        let minute = getMinutes(timePoints[i])
        ans = min(ans, minute - pre)
        pre = minute
    }

    ans = min(ans, t0 + 1440 - pre)
    return ans
}
