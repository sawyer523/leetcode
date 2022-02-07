//
//  352.summaryRanges.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/10/9.
//

import Foundation

/*
 352. 将数据流变为多个不相交区间
 难度
 困难
 
 81
 
 
 
 
 
 给你一个由非负整数 a1, a2, ..., an 组成的数据流输入，请你将到目前为止看到的数字总结为不相交的区间列表。
 
 实现 SummaryRanges 类：
 
 SummaryRanges() 使用一个空数据流初始化对象。
 void addNum(int val) 向数据流中加入整数 val 。
 int[][] getIntervals() 以不相交区间 [starti, endi] 的列表形式返回对数据流中整数的总结。
 
 
 示例：
 
 输入：
 ["SummaryRanges", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals"]
 [[], [1], [], [3], [], [7], [], [2], [], [6], []]
 输出：
 [null, null, [[1, 1]], null, [[1, 1], [3, 3]], null, [[1, 1], [3, 3], [7, 7]], null, [[1, 3], [7, 7]], null, [[1, 3], [6, 7]]]
 
 解释：
 SummaryRanges summaryRanges = new SummaryRanges();
 summaryRanges.addNum(1);      // arr = [1]
 summaryRanges.getIntervals(); // 返回 [[1, 1]]
 summaryRanges.addNum(3);      // arr = [1, 3]
 summaryRanges.getIntervals(); // 返回 [[1, 1], [3, 3]]
 summaryRanges.addNum(7);      // arr = [1, 3, 7]
 summaryRanges.getIntervals(); // 返回 [[1, 1], [3, 3], [7, 7]]
 summaryRanges.addNum(2);      // arr = [1, 2, 3, 7]
 summaryRanges.getIntervals(); // 返回 [[1, 3], [7, 7]]
 summaryRanges.addNum(6);      // arr = [1, 2, 3, 6, 7]
 summaryRanges.getIntervals(); // 返回 [[1, 3], [6, 7]]
 
 
 提示：
 
 0 <= val <= 104
 最多调用 addNum 和 getIntervals 方法 3 * 104 次
 
 
 进阶：如果存在大量合并，并且与数据流的大小相比，不相交区间的数量很小，该怎么办?
 */

class SummaryRanges {
    private var martrix = [[Int]]()
    init() {}
    func addNum(_ val: Int) {
        var pre = -2
        var preIdx = -1
        var copy = [[Int]]()
        for i in martrix.indices {
            let curL = martrix[i][0], curU = martrix[i][1]
            if curL <= val && val <= curU { return }
            if curU < val  {
                pre = curU
                preIdx = i
                copy.append(martrix[i])
            }
            else {
                if val+1==curL && val-1==pre {
                    copy.removeLast()
                    copy.append([martrix[preIdx][0], curU])
                    copy.append(contentsOf: martrix[i+1..<martrix.count])
                    martrix = copy
                    return
                } else if val-1==pre {
                    copy.removeLast()
                    copy.append([martrix[preIdx][0], val])
                    copy.append(contentsOf: martrix[i..<martrix.count])
                    martrix = copy
                    return
                } else if val+1==curL {
                    copy.append([val, curU])
                    copy.append(contentsOf: martrix[i+1..<martrix.count])
                    martrix = copy
                    return
                } else {
                    copy.append([val, val])
                    copy.append(contentsOf: martrix[i..<martrix.count])
                    martrix = copy
                    return
                }
            }
        }
        
        if let last = martrix.last {
            if last[1] + 1 == val {
                martrix.removeLast()
                martrix.append([last[0], val])
                return
            }
        }
        
        martrix.append([val, val])
    }
    
    func getIntervals() -> [[Int]] {
        return martrix
    }
}
