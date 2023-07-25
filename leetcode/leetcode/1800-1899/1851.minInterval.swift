//
//  1851.minInterval.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/18.
//

import Foundation

/*
 1851. 包含每个查询的最小区间
 给你一个二维整数数组 intervals ，其中 intervals[i] = [lefti, righti] 表示第 i 个区间开始于 lefti 、结束于 righti（包含两侧取值，闭区间）。区间的 长度 定义为区间中包含的整数数目，更正式地表达是 righti - lefti + 1 。

 再给你一个整数数组 queries 。第 j 个查询的答案是满足 lefti <= queries[j] <= righti 的 长度最小区间 i 的长度 。如果不存在这样的区间，那么答案是 -1 。

 以数组形式返回对应查询的所有答案。

 示例 1：

 输入：intervals = [[1,4],[2,4],[3,6],[4,4]], queries = [2,3,4,5]
 输出：[3,3,1,4]
 解释：查询处理如下：
 - Query = 2 ：区间 [2,4] 是包含 2 的最小区间，答案为 4 - 2 + 1 = 3 。
 - Query = 3 ：区间 [2,4] 是包含 3 的最小区间，答案为 4 - 2 + 1 = 3 。
 - Query = 4 ：区间 [4,4] 是包含 4 的最小区间，答案为 4 - 4 + 1 = 1 。
 - Query = 5 ：区间 [3,6] 是包含 5 的最小区间，答案为 6 - 3 + 1 = 4 。
 示例 2：

 输入：intervals = [[2,3],[2,5],[1,8],[20,25]], queries = [2,19,5,22]
 输出：[2,-1,4,6]
 解释：查询处理如下：
 - Query = 2 ：区间 [2,3] 是包含 2 的最小区间，答案为 3 - 2 + 1 = 2 。
 - Query = 19：不存在包含 19 的区间，答案为 -1 。
 - Query = 5 ：区间 [2,5] 是包含 5 的最小区间，答案为 5 - 2 + 1 = 4 。
 - Query = 22：区间 [20,25] 是包含 22 的最小区间，答案为 25 - 20 + 1 = 6 。

 提示：

 1 <= intervals.length <= 10^5
 1 <= queries.length <= 10^5
 queries[i].length == 2
 1 <= lefti <= righti <= 10^7
 1 <= queries[j] <= 10^7
 */

func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
    struct Heap<T> {
        private var data = [T]()
        private var isSorted: (T, T) -> Bool

        init(by isSorted: @escaping (T, T) -> Bool) {
            self.isSorted = isSorted
        }

        var count: Int { return data.count }
        var isEmpty: Bool { return data.isEmpty }

        func peek() -> T? { return data.first }

        mutating func insert(_ element: T) {
            data.append(element)
            siftUp(count - 1)
        }

        mutating func remove() -> T? {
            if isEmpty {
                return nil
            }
            data.swapAt(0, count - 1)
            defer {
                siftDown(0)
            }
            return data.popLast()
        }

        mutating func siftDown(_ parent: Int) {
            var parent = parent

            while true {
                var candidate = parent
                let l = 2 * parent + 1, r = l + 1

                if l < count, isSorted(data[l], data[candidate]) {
                    candidate = l
                }
                if r < count, isSorted(data[r], data[candidate]) {
                    candidate = r
                }
                if candidate == parent {
                    return
                }

                data.swapAt(parent, candidate)
                parent = candidate
            }
        }

        mutating func siftUp(_ child: Int) {
            var child = child

            while true {
                let parent = (child - 1) / 2

                guard child > 0, isSorted(data[child], data[parent]) else {
                    return
                }
                data.swapAt(parent, child)
                child = parent
            }
        }
    }
    typealias Query = (index: Int, target: Int)
    typealias HeapElement = (length: Int, right: Int)

    // intervals 按照left升序排序
    var intervals = intervals.sorted { $0[0] < $1[0] }

    // 构建新的quries,并按照target排序
    var queries: [Query] = (0 ..< queries.count)
        .map { ($0, queries[$0]) }
    queries.sort { $0.target < $1.target }

    // 最小堆存储(length, right)
    var minHeap = Heap<HeapElement> { $0.length < $1.length }
    var result = Array(repeating: -1, count: queries.count)
    var i = 0

    for query in queries {
        while i < intervals.count {
            let interval = intervals[i]
            if query.target < interval[0] {
                break
            }
            minHeap.insert((interval[1] - interval[0] + 1, interval[1]))
            i += 1
        }

        while let current = minHeap.peek(), query.target > current.right {
            _ = minHeap.remove()
        }
        if minHeap.isEmpty {
            continue
        }
        result[query.index] = minHeap.peek()!.length
    }

    return result
}
