//
//  295.medianFinder.swift
//  295.medianFinder
//
//  Created by Xiaonan Chen on 2021/8/27.
//

import Foundation

/*
 295. 数据流的中位数
 难度
 困难
 
 471
 
 
 
 
 
 中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。
 
 例如，
 
 [2,3,4] 的中位数是 3
 
 [2,3] 的中位数是 (2 + 3) / 2 = 2.5
 
 设计一个支持以下两种操作的数据结构：
 
 void addNum(int num) - 从数据流中添加一个整数到数据结构中。
 double findMedian() - 返回目前所有元素的中位数。
 示例：
 
 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2
 进阶:
 
 如果数据流中所有整数都在 0 到 100 范围内，你将如何优化你的算法？
 如果数据流中 99% 的整数都在 0 到 100 范围内，你将如何优化你的算法？

 */

class MedianFinder {
    
    private var data: [Int] = []
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func addNum(_ num: Int) {
        if data.count == 0 || data.last! < num {
            data.append(num)
            return
        }
        
        let index = binarySearch(num)
        data.insert(num, at: index)
    }
    
    func findMedian() -> Double {
        if data.count == 0 {
            return 0
        }
        if data.count & 1 == 0 {
            let mid = data.count / 2
            return Double(data[mid-1] + data[mid]) / 2
        }
        return Double(data[data.count / 2])
    }
    
    private func binarySearch(_ target: Int) -> Int {
        var left = 0
        var right = data.count - 1
        while left < right {
            let mid = left + (right - left) / 2
            if data[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
