//
//  2532.findCrossingTime.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/7.
//

import Foundation

/*
 2532. 过桥的时间
 共有 k 位工人计划将 n 个箱子从旧仓库移动到新仓库。给你两个整数 n 和 k，以及一个二维整数数组 time ，数组的大小为 k x 4 ，其中 time[i] = [leftToRighti, pickOldi, rightToLefti, putNewi] 。

 一条河将两座仓库分隔，只能通过一座桥通行。旧仓库位于河的右岸，新仓库在河的左岸。开始时，所有 k 位工人都在桥的左侧等待。为了移动这些箱子，第 i 位工人（下标从 0 开始）可以：

 从左岸（新仓库）跨过桥到右岸（旧仓库），用时 leftToRighti 分钟。
 从旧仓库选择一个箱子，并返回到桥边，用时 pickOldi 分钟。不同工人可以同时搬起所选的箱子。
 从右岸（旧仓库）跨过桥到左岸（新仓库），用时 rightToLefti 分钟。
 将箱子放入新仓库，并返回到桥边，用时 putNewi 分钟。不同工人可以同时放下所选的箱子。
 如果满足下面任一条件，则认为工人 i 的 效率低于 工人 j ：

 leftToRighti + rightToLefti > leftToRightj + rightToLeftj
 leftToRighti + rightToLefti == leftToRightj + rightToLeftj 且 i > j
 工人通过桥时需要遵循以下规则：

 如果工人 x 到达桥边时，工人 y 正在过桥，那么工人 x 需要在桥边等待。
 如果没有正在过桥的工人，那么在桥右边等待的工人可以先过桥。如果同时有多个工人在右边等待，那么 效率最低 的工人会先过桥。
 如果没有正在过桥的工人，且桥右边也没有在等待的工人，同时旧仓库还剩下至少一个箱子需要搬运，此时在桥左边的工人可以过桥。如果同时有多个工人在左边等待，那么 效率最低 的工人会先过桥。
 所有 n 个盒子都需要放入新仓库，请你返回最后一个搬运箱子的工人 到达河左岸 的时间。

 示例 1：

 输入：n = 1, k = 3, time = [[1,1,2,1],[1,1,3,1],[1,1,4,1]]
 输出：6
 解释：
 从 0 到 1 ：工人 2 从左岸过桥到达右岸。
 从 1 到 2 ：工人 2 从旧仓库搬起一个箱子。
 从 2 到 6 ：工人 2 从右岸过桥到达左岸。
 从 6 到 7 ：工人 2 将箱子放入新仓库。
 整个过程在 7 分钟后结束。因为问题关注的是最后一个工人到达左岸的时间，所以返回 6 。
 示例 2：

 输入：n = 3, k = 2, time = [[1,9,1,8],[10,10,10,10]]
 输出：50
 解释：
 从 0 到 10 ：工人 1 从左岸过桥到达右岸。
 从 10 到 20 ：工人 1 从旧仓库搬起一个箱子。
 从 10 到 11 ：工人 0 从左岸过桥到达右岸。
 从 11 到 20 ：工人 0 从旧仓库搬起一个箱子。
 从 20 到 30 ：工人 1 从右岸过桥到达左岸。
 从 30 到 40 ：工人 1 将箱子放入新仓库。
 从 30 到 31 ：工人 0 从右岸过桥到达左岸。
 从 31 到 39 ：工人 0 将箱子放入新仓库。
 从 39 到 40 ：工人 0 从左岸过桥到达右岸。
 从 40 到 49 ：工人 0 从旧仓库搬起一个箱子。
 从 49 到 50 ：工人 0 从右岸过桥到达左岸。
 从 50 到 58 ：工人 0 将箱子放入新仓库。
 整个过程在 58 分钟后结束。因为问题关注的是最后一个工人到达左岸的时间，所以返回 50 。

 提示：

 1 <= n, k <= 10^4
 time.length == k
 time[i].length == 4
 1 <= leftToRighti, pickOldi, rightToLefti, putNewi <= 1000
 */
func findCrossingTime(_ n: Int, _ k: Int, _ time: [[Int]]) -> Int {
    struct PriorityQueue<Element> {
        private var elements: [Element]
        private let comparator: (Element, Element) -> Bool

        init(comparator: @escaping (Element, Element) -> Bool) {
            self.elements = []
            self.comparator = comparator
        }

        var isEmpty: Bool {
            return elements.isEmpty
        }

        func peek() -> Element? {
            return elements.first
        }

        mutating func offer(_ element: Element) {
            elements.append(element)
            siftUp(elements.count - 1)
        }

        mutating func poll() -> Element? {
            if elements.isEmpty {
                return nil
            }

            if elements.count == 1 {
                return elements.removeLast()
            }

            let first = elements[0]
            elements[0] = elements.removeLast()
            siftDown(0)
            return first
        }

        private mutating func siftUp(_ index: Int) {
            var childIndex = index
            var parentIndex = (childIndex - 1) / 2

            while childIndex > 0 && comparator(elements[childIndex], elements[parentIndex]) {
                elements.swapAt(childIndex, parentIndex)
                childIndex = parentIndex
                parentIndex = (childIndex - 1) / 2
            }
        }

        private mutating func siftDown(_ index: Int) {
            var parentIndex = index

            while true {
                let leftChildIndex = 2 * parentIndex + 1
                let rightChildIndex = 2 * parentIndex + 2
                var nextIndex = parentIndex

                if leftChildIndex < elements.count && comparator(elements[leftChildIndex], elements[nextIndex]) {
                    nextIndex = leftChildIndex
                }

                if rightChildIndex < elements.count && comparator(elements[rightChildIndex], elements[nextIndex]) {
                    nextIndex = rightChildIndex
                }

                if nextIndex == parentIndex {
                    return
                }

                elements.swapAt(parentIndex, nextIndex)
                parentIndex = nextIndex
            }
        }
    }

    // Define the comparison rule for workers in the waiting queue.
    // The higher the sum of their times, the lower the efficiency, and the lower the priority.
    // They are prioritized based on higher total time and lower index.
    var waitLeft = PriorityQueue<Int>(comparator: { x, y in
        let timeX = time[x][0] + time[x][2]
        let timeY = time[y][0] + time[y][2]
        return (timeX != timeY ? timeY - timeX : y - x) != 0
    })

    var waitRight = PriorityQueue<Int>(comparator: { x, y in
        let timeX = time[x][0] + time[x][2]
        let timeY = time[y][0] + time[y][2]
        return (timeX != timeY ? timeY - timeX : y - x) != 0
    })

    // Priority queues for workers on the left and right side, respectively.
    // Workers are prioritized based on lower time and lower index.
    var workLeft = PriorityQueue<[Int]>(comparator: { x, y in
        if x[0] != y[0] {
            return (x[0] - y[0]) != 0
        } else {
            return (x[1] - y[1]) != 0
        }
    })

    var workRight = PriorityQueue<[Int]>(comparator: { x, y in
        if x[0] != y[0] {
            return (x[0] - y[0]) != 0
        } else {
            return (x[1] - y[1]) != 0
        }
    })

    var remain = n
    var curTime = 0

    // Add all workers to the left waiting queue initially.
    for i in 0 ..< k {
        waitLeft.offer(i)
    }

    while remain > 0 || !workRight.isEmpty || !waitRight.isEmpty {
        // 1. If a worker in workLeft or workRight finishes their work, remove them and place them in waitLeft or waitRight, respectively.
        while !workLeft.isEmpty && workLeft.peek()![0] <= curTime {
            waitLeft.offer(workLeft.poll()![1])
        }

        while !workRight.isEmpty && workRight.peek()![0] <= curTime {
            waitRight.offer(workRight.poll()![1])
        }

        if !waitRight.isEmpty {
            // 2. If there are workers waiting on the right side, take out the one with the lowest priority and let them cross the bridge.
            let id = waitRight.poll()!
            curTime += time[id][2]
            workLeft.offer([curTime + time[id][3], id])
        } else if remain > 0 && !waitLeft.isEmpty {
            // 3. If there are still boxes on the right side and there are workers waiting on the left side, take out the one with the lowest priority and let them cross the bridge.
            let id = waitLeft.poll()!
            curTime += time[id][0]
            workRight.offer([curTime + time[id][1], id])
            remain -= 1
        } else {
            // 4. Otherwise, no one needs to cross the bridge, so the time transitions to the earliest completion time in workLeft and workRight.
            var nextTime = Int.max

            if !workLeft.isEmpty {
                nextTime = min(nextTime, workLeft.peek()![0])
            }

            if !workRight.isEmpty {
                nextTime = min(nextTime, workRight.peek()![0])
            }

            if nextTime != Int.max {
                curTime = max(nextTime, curTime)
            }
        }
    }

    return curTime
}
