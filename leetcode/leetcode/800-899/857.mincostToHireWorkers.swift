//
//  857.mincostToHireWorkers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/11.
//

import Foundation

/*
 857. 雇佣 K 名工人的最低成本
 难度
 困难

 185

 有 n 名工人。 给定两个数组 quality 和 wage ，其中，quality[i] 表示第 i 名工人的工作质量，其最低期望工资为 wage[i] 。

 现在我们想雇佣 k 名工人组成一个工资组。在雇佣 一组 k 名工人时，我们必须按照下述规则向他们支付工资：

 对工资组中的每名工人，应当按其工作质量与同组其他工人的工作质量的比例来支付工资。
 工资组中的每名工人至少应当得到他们的最低期望工资。
 给定整数 k ，返回 组成满足上述条件的付费群体所需的最小金额 。在实际答案的 10-5 以内的答案将被接受。。

 示例 1：

 输入： quality = [10,20,5], wage = [70,50,30], k = 2
 输出： 105.00000
 解释： 我们向 0 号工人支付 70，向 2 号工人支付 35。
 示例 2：

 输入： quality = [3,1,10,10,1], wage = [4,8,2,2,7], k = 3
 输出： 30.66667
 解释： 我们向 0 号工人支付 4，向 2 号和 3 号分别支付 13.33333。

 提示：

 n == quality.length == wage.length
 1 <= k <= n <= 10^4
 1 <= quality[i], wage[i] <= 10^4
 */

func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
    var workers = [(Int, Int)]()
    for i in 0 ..< quality.count {
        workers.append((quality[i], wage[i]))
    }
    workers.sort {
        return Double($0.1) / Double($0.0) <= Double($1.1) / Double($1.0)
    }

    var heap = [0]
    var totalQ = 0
    var minCost: Double = 0

    for i in 0 ..< workers.count {
        let costPerQ = Double(workers[i].1) / Double(workers[i].0)

        if heap.count == k + 1 {
            if workers[i].0 < heap[1] {
                totalQ -= heap[1]
                heap[1] = workers[i].0
                totalQ += heap[1]

                var toHeapify = 1
                while toHeapify <= ((heap.count - 1) / 2) {
                    var toSwitch = toHeapify
                    if heap[toHeapify * 2] > heap[toHeapify] {
                        toSwitch = toHeapify * 2
                    }
                    if heap.count > toHeapify * 2 + 1 && heap[toHeapify * 2 + 1] > heap[toSwitch] {
                        toSwitch = toHeapify * 2 + 1
                    }
                    if toSwitch == toHeapify {
                        break
                    } else {
                        let tmp = heap[toHeapify]
                        heap[toHeapify] = heap[toSwitch]
                        heap[toSwitch] = tmp
                        toHeapify = toSwitch
                    }
                }
                minCost = min(minCost, Double(totalQ) * costPerQ)
            }
        } else {
            totalQ += workers[i].0
            heap.append(workers[i].0)

            var toHeapify = heap.count - 1
            while toHeapify != 1 {
                let parent = toHeapify / 2
                if heap[parent] < heap[toHeapify] {
                    let tmp = heap[parent]
                    heap[parent] = heap[toHeapify]
                    heap[toHeapify] = tmp
                    toHeapify = parent
                } else {
                    break
                }
            }
            if heap.count == k + 1 {
                minCost = Double(totalQ) * costPerQ
            }
        }
    }
    return minCost
}
