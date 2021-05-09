//
//  1723..swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/8.
//

import Foundation

/*
 1723. 完成所有工作的最短时间
 难度
 困难
 
 98
 
 
 
 
 
 给你一个整数数组 jobs ，其中 jobs[i] 是完成第 i 项工作要花费的时间。
 
 请你将这些工作分配给 k 位工人。所有工作都应该分配给工人，且每项工作只能分配给一位工人。工人的 工作时间 是完成分配给他们的所有工作花费时间的总和。请你设计一套最佳的工作分配方案，使工人的 最大工作时间 得以 最小化 。
 
 返回分配方案中尽可能 最小 的 最大工作时间 。
 
 
 
 示例 1：
 
 输入：jobs = [3,2,3], k = 3
 输出：3
 解释：给每位工人分配一项工作，最大工作时间是 3 。
 示例 2：
 
 输入：jobs = [1,2,4,7,8], k = 2
 输出：11
 解释：按下述方式分配工作：
 1 号工人：1、2、8（工作时间 = 1 + 2 + 8 = 11）
 2 号工人：4、7（工作时间 = 4 + 7 = 11）
 最大工作时间是 11 。
 
 
 提示：
 
 1 <= k <= jobs.length <= 12
 1 <= jobs[i] <= 107
 */

func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
//    func check(_ limit: Int) -> Bool {
//        var workloads = [Int](repeating: 0, count: k)
//        return backtrack(&workloads, 0, limit)
//    }
//
//    func backtrack(_ workloads: inout [Int], _ i: Int, _ limit: Int) -> Bool {
//        if jobs2.count <= i {
//            return true
//        }
//
//        let cur = jobs2[i]
//        for i in 0..<workloads.count {
//            if workloads[i] + cur <= limit {
//                workloads[i] += cur
//                if backtrack(&workloads, i+1, limit) {
//                    return true
//                }
//                workloads[i] -= cur
//            }
//
//            if workloads[i] == 0 || workloads[i] + cur == limit {
//                break
//            }
//        }
//        return false
//    }
    
//    let jobs2 = jobs.sorted(by: >)
    var works = [Int](repeating: 0, count: k)
    var res = Int.max
    func backtrack(_ i: Int, _ preMax: Int) {
        if i == jobs.count {
            res = min(res, preMax)
            return
        }
        
        var use = Set<Int>()
        for j in 0..<k {
            if use.contains(works[j]) {
                continue
            }
            use.insert(works[j])
            if res < works[j] + jobs[i] {
                continue
            }
            works[j] += jobs[i]
            backtrack(i+1, max(works[j], preMax))
            works[j] -= jobs[i]
        }
    }
    backtrack(0, 0)
    return res
}

//var maxSum: Int = 0
//func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
//    let ks: [Int] = Array(repeating: 0, count: k)
//    maxSum = Int(INT32_MAX)
//    reverse(jobs, 0, ks, ks.count)
//    return maxSum
//}
//func reverse(_ jobs: [Int], _ start: Int, _ ks: [Int], _ emptyCount: Int) {
//
//    let newMaxSum = ks.max()!
//    if newMaxSum >= maxSum {
//        return
//    }
//    if start == jobs.count {
//        maxSum = newMaxSum
//        return
//    }
//
//    let job = jobs[start]
//    var _ks = ks
//    for (i,sum) in ks.enumerated() {
//
//        let leftCount = jobs.count - start - 1
//        let newEmptyCount = sum == 0 ? emptyCount - 1 : emptyCount
//        if leftCount < newEmptyCount {
//            continue
//        }
//
//        _ks[i] += job
//        reverse(jobs, start + 1, _ks, newEmptyCount)
//        _ks[i] -= job
//
//        if sum == 0 {
//            break
//        }
//    }
//}
