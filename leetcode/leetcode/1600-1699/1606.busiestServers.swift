//
//  1606.busiestServers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/3/30.
//

import Foundation

/*
 1606. 找到处理最多请求的服务器
 难度
 困难

 41

 你有 k 个服务器，编号为 0 到 k-1 ，它们可以同时处理多个请求组。每个服务器有无穷的计算能力但是 不能同时处理超过一个请求 。请求分配到服务器的规则如下：

 第 i （序号从 0 开始）个请求到达。
 如果所有服务器都已被占据，那么该请求被舍弃（完全不处理）。
 如果第 (i % k) 个服务器空闲，那么对应服务器会处理该请求。
 否则，将请求安排给下一个空闲的服务器（服务器构成一个环，必要的话可能从第 0 个服务器开始继续找下一个空闲的服务器）。比方说，如果第 i 个服务器在忙，那么会查看第 (i+1) 个服务器，第 (i+2) 个服务器等等。
 给你一个 严格递增 的正整数数组 arrival ，表示第 i 个任务的到达时间，和另一个数组 load ，其中 load[i] 表示第 i 个请求的工作量（也就是服务器完成它所需要的时间）。你的任务是找到 最繁忙的服务器 。最繁忙定义为一个服务器处理的请求数是所有服务器里最多的。

 请你返回包含所有 最繁忙服务器 序号的列表，你可以以任意顺序返回这个列表。

 示例 1：

 输入：k = 3, arrival = [1,2,3,4,5], load = [5,2,3,3,3]
 输出：[1]
 解释：
 所有服务器一开始都是空闲的。
 前 3 个请求分别由前 3 台服务器依次处理。
 请求 3 进来的时候，服务器 0 被占据，所以它呗安排到下一台空闲的服务器，也就是服务器 1 。
 请求 4 进来的时候，由于所有服务器都被占据，该请求被舍弃。
 服务器 0 和 2 分别都处理了一个请求，服务器 1 处理了两个请求。所以服务器 1 是最忙的服务器。
 示例 2：

 输入：k = 3, arrival = [1,2,3,4], load = [1,2,1,2]
 输出：[0]
 解释：
 前 3 个请求分别被前 3 个服务器处理。
 请求 3 进来，由于服务器 0 空闲，它被服务器 0 处理。
 服务器 0 处理了两个请求，服务器 1 和 2 分别处理了一个请求。所以服务器 0 是最忙的服务器。
 示例 3：

 输入：k = 3, arrival = [1,2,3], load = [10,12,11]
 输出：[0,1,2]
 解释：每个服务器分别处理了一个请求，所以它们都是最忙的服务器。
 示例 4：

 输入：k = 3, arrival = [1,2,3,4,8,9,10], load = [5,2,10,3,1,2,2]
 输出：[1]
 示例 5：

 输入：k = 1, arrival = [1], load = [1]
 输出：[0]

 提示：

 1 <= k <= 10^5
 1 <= arrival.length, load.length <= 10^5
 arrival.length == load.length
 1 <= arrival[i], load[i] <= 10^9
 arrival 保证 严格递增 。

 */

func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {
    class Heap<T> {
        private var data: [T] = []
        var count: Int {
            return data.count
        }

        private var sort: ((T, T) -> Bool)!
        init(_ sort: @escaping ((T, T) -> Bool)) {
            self.sort = sort
        }

        private func p(_ i: Int) -> Int { return (i - 1) / 2 }
        private func l(_ i: Int) -> Int { return i * 2 + 1 }
        private func r(_ i: Int) -> Int { return i * 2 + 2 }
        func isEmpty() -> Bool {
            return data.isEmpty
        }

        func add(_ val: T) {
            data.append(val)
            swim(data.count - 1)
        }

        private func swim(_ i: Int) {
            if sort(data[i], data[p(i)]) {
                data.swapAt(i, p(i))
                swim(p(i))
            }
        }

        func remove() -> T? {
            if data.isEmpty {
                return nil
            }
            if data.count == 1 {
                return data.removeLast()
            }
            let node = data[0]
            data[0] = data.removeLast()
            dive(0)
            return node
        }

        private func dive(_ i: Int) {
            let left = l(i) >= data.count ? data[i] : data[l(i)]
            let right = r(i) >= data.count ? data[i] : data[r(i)]
            if sort(left, data[i]) || sort(right, data[i]) {
                if sort(left, right) {
                    data.swapAt(i, l(i))
                    dive(l(i))
                } else {
                    data.swapAt(i, r(i))
                    dive(r(i))
                }
            }
        }

        func top() -> T? {
            return data.first
        }
    }

    let sessions = Heap<(Int, Int)> { $0.0 < $1.0 }

    var currentRound = Heap<Int> { $0 < $1 }

    var nextRound = Heap<Int> { $0 < $1 }
    for i in 0 ..< k {
        nextRound.add(i)
    }

    var timesheet = Array(repeating: 0, count: k)

    var requests: [(Int, Int)] = []
    for i in 0 ..< arrival.count {
        requests.append((arrival[i], load[i]))
    }

    for (index, (startTime, duration)) in requests.enumerated() {
        let roundRobinServer = index % k
        // it is time to go back
        if roundRobinServer == 0 {
            currentRound = nextRound
            nextRound = Heap<Int> { $0 < $1 }
        }

        while !sessions.isEmpty(), sessions.top()!.0 <= startTime {
            let freeServer = sessions.remove()!.1

            if freeServer < roundRobinServer {
                nextRound.add(freeServer)
            } else {
                currentRound.add(freeServer)
            }
        }

        var chosenServer = -1
        if !currentRound.isEmpty() {
            chosenServer = currentRound.remove()!
        } else if !nextRound.isEmpty() {
            chosenServer = nextRound.remove()!
        }

        if chosenServer == -1 {
            continue
        }

        timesheet[chosenServer] += 1
        sessions.add((startTime + duration, chosenServer))
    }

    var ans: [Int] = []
    var maxRequest = 0
    for server in 0 ..< timesheet.count {
        if maxRequest < timesheet[server] {
            maxRequest = timesheet[server]
            ans = []
        }
        if maxRequest == timesheet[server] {
            ans.append(server)
        }
    }

    return ans
}
