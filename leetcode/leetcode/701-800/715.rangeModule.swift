//
//  715.rangeModule.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/20.
//

import Foundation

/*
 Range模块是跟踪数字范围的模块。设计一个数据结构来跟踪表示为 半开区间 的范围并查询它们。

 半开区间 [left, right) 表示所有 left <= x < right 的实数 x 。

 实现 RangeModule 类:

 RangeModule() 初始化数据结构的对象。
 void addRange(int left, int right) 添加 半开区间 [left, right)，跟踪该区间中的每个实数。添加与当前跟踪的数字部分重叠的区间时，应当添加在区间 [left, right) 中尚未跟踪的任何数字到该区间中。
 boolean queryRange(int left, int right) 只有在当前正在跟踪区间 [left, right) 中的每一个实数时，才返回 true ，否则返回 false 。
 void removeRange(int left, int right) 停止跟踪 半开区间 [left, right) 中当前正在跟踪的每个实数。
  

 示例 1：

 输入
 ["RangeModule", "addRange", "removeRange", "queryRange", "queryRange", "queryRange"]
 [[], [10, 20], [14, 16], [10, 14], [13, 15], [16, 17]]
 输出
 [null, null, null, true, false, true]

 解释
 RangeModule rangeModule = new RangeModule();
 rangeModule.addRange(10, 20);
 rangeModule.removeRange(14, 16);
 rangeModule.queryRange(10, 14); 返回 true （区间 [10, 14) 中的每个数都正在被跟踪）
 rangeModule.queryRange(13, 15); 返回 false（未跟踪区间 [13, 15) 中像 14, 14.03, 14.17 这样的数字）
 rangeModule.queryRange(16, 17); 返回 true （尽管执行了删除操作，区间 [16, 17) 中的数字 16 仍然会被跟踪）
  

 提示：

 1 <= left < right <= 10^9
 在单个测试用例中，对 addRange 、  queryRange 和 removeRange 的调用总数不超过 104 次
 */

class RangeModule {
//    class SegmentTreeNode {
//
//
//        var leftBound: Int
//        var rightBound: Int
//
//        var isTracked: Bool = false
//        var lazy:Int = 0
//
//        var leftChild: SegmentTreeNode?
//        var rightChild: SegmentTreeNode?
//
//        init(_ l: Int, _ r: Int) {
//            self.leftBound = l
//            self.rightBound = r
//        }
//
//
//        func pushUp() {
//            guard let lc = leftChild, let rc = rightChild else {
//                isTracked = false
//                return
//            }
//            isTracked = lc.isTracked && rc.isTracked
//        }
//
//
//        func pushDown() {
//            let mid = (leftBound + rightBound) / 2
//            if nil == leftChild {
//                leftChild = SegmentTreeNode(leftBound, mid)
//            }
//            if nil == rightChild {
//                rightChild = SegmentTreeNode(mid + 1, rightBound)
//            }
//            if 0 != lazy {
//                leftChild?.lazy = lazy
//                rightChild?.lazy = lazy
//                leftChild?.isTracked = 1 == lazy
//                rightChild?.isTracked = 1 == lazy
//                lazy = 0
//            }
//        }
//
//
//
//        func update(_ l: Int, _ r: Int,_ val: Int) {
//            if l == leftBound && r == rightBound {
//                isTracked = 1 == val
//                lazy = val
//                return
//            }
//            pushDown()
//            let mid = (leftBound + rightBound) / 2
//            if r <= mid {
//                leftChild?.update(l, r, val)
//            } else if l > mid {
//                rightChild?.update(l, r, val)
//            } else {
//                leftChild?.update(l, mid, val)
//                rightChild?.update(mid + 1, r, val)
//            }
//
//            pushUp()
//        }
//
//
//        func query(_ l: Int, _ r: Int) -> Bool?{
//
//            if l == leftBound && r == rightBound {
//                return isTracked
//            }
//
//            pushDown()
//            let mid = (leftBound + rightBound) >> 1
//
//            if r <= mid {
//                return leftChild?.query(l, r)
//            } else if l > mid {
//                return rightChild?.query(l, r)
//            } else {
//                return (leftChild?.query(l, mid) ?? false) && (rightChild?.query(mid + 1, r) ?? false)
//            }
//        }
//    }
//
//    private let tree: SegmentTreeNode = SegmentTreeNode(1, 1_000_000_000)
//
//    init() {
//
//    }
//
//    func addRange(_ left: Int, _ right: Int) {
//        tree.update(left, right - 1, 1)
//    }
//
//    func queryRange(_ left: Int, _ right: Int) -> Bool {
//        return tree.query(left, right - 1) ?? false
//    }
//
//    func removeRange(_ left: Int, _ right: Int) {
//        tree.update(left, right - 1, 2)
//    }
    
    private var ranges: [(begin: Int, end: Int)] = []
    
    init() {
        
    }
    
    func addRange(_ left: Int, _ right: Int) {
        var newRanges: [(begin: Int, end: Int)] = []
        var inserted = false
        var begin = left
        var end = right
        for range in ranges {
            if end < range.begin, !inserted {
                newRanges.append((begin, end))
                inserted = true
            }
            
            if range.end < begin || end < range.begin {
                newRanges.append(range)
            } else {
                begin = min(range.begin, begin)
                end = max(range.end, end)
            }
        }
        
        if !inserted {
            newRanges.append((begin, end))
        }
        
        ranges = newRanges
    }
    
    func queryRange(_ left: Int, _ right: Int) -> Bool {
        var l = 0
        var r = ranges.count - 1
        
        while l <= r {
            let mid = l + (r - l) / 2
            let range = ranges[mid]
            
            if right < range.begin {
                r = mid - 1
            } else if range.end < left {
                l = mid + 1
            } else {
                return range.begin <= left && right <= range.end
            }
        }
        return false
    }
    
    func removeRange(_ left: Int, _ right: Int) {
        var newRanges: [(begin: Int, end: Int)] = []
        for range in ranges {
            if right <= range.begin || range.end <= left {
                newRanges.append(range)
            } else {
                if range.begin < left {
                    newRanges.append((range.begin, left))
                }
                
                if right < range.end {
                    newRanges.append((right, range.end))
                }
            }
        }
        
        ranges = newRanges
    }
}
