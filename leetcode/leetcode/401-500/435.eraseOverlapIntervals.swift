//
//  435.eraseOverlapIntervals.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/31.
//

import Foundation

/*
 435. 无重叠区间
 难度
 中等

 271





 给定一个区间的集合，找到需要移除区间的最小数量，使剩余区间互不重叠。

 注意:

 可以认为区间的终点总是大于它的起点。
 区间 [1,2] 和 [2,3] 的边界相互“接触”，但没有相互重叠。
 示例 1:

 输入: [ [1,2], [2,3], [3,4], [1,3] ]

 输出: 1

 解释: 移除 [1,3] 后，剩下的区间没有重叠。
 示例 2:

 输入: [ [1,2], [1,2], [1,2] ]

 输出: 2

 解释: 你需要移除两个 [1,2] 来使剩下的区间没有重叠。
 示例 3:

 输入: [ [1,2], [2,3] ]

 输出: 0

 解释: 你不需要移除任何区间，因为它们已经是无重叠的了。
 */

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.count < 2 {
        return 0
    }
    let arr = intervals.sorted { (a, b) -> Bool in
        a.last! <= b.last!
    }
    
    var count = 1
    var xEnd = arr[0][1]
    for interval in arr {
        if xEnd <= interval[0] {
            count += 1
            xEnd = interval[1]
        }
    }
    
    return intervals.count - count
}
