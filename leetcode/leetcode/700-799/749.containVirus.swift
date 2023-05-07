//
//  749.containVirus.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/7/18.
//

import Foundation

/*
 749. 隔离病毒
 难度
 困难

 60

 病毒扩散得很快，现在你的任务是尽可能地通过安装防火墙来隔离病毒。

 假设世界由 m x n 的二维矩阵 isInfected 组成， isInfected[i][j] == 0 表示该区域未感染病毒，而  isInfected[i][j] == 1 表示该区域已感染病毒。可以在任意 2 个相邻单元之间的共享边界上安装一个防火墙（并且只有一个防火墙）。

 每天晚上，病毒会从被感染区域向相邻未感染区域扩散，除非被防火墙隔离。现由于资源有限，每天你只能安装一系列防火墙来隔离其中一个被病毒感染的区域（一个区域或连续的一片区域），且该感染区域对未感染区域的威胁最大且 保证唯一 。

 你需要努力使得最后有部分区域不被病毒感染，如果可以成功，那么返回需要使用的防火墙个数; 如果无法实现，则返回在世界被病毒全部感染时已安装的防火墙个数。

 示例 1：

 输入: isInfected = [[0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,1],[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0]]
 输出: 10
 解释:一共有两块被病毒感染的区域。
 在第一天，添加 5 墙隔离病毒区域的左侧。病毒传播后的状态是:

 第二天，在右侧添加 5 个墙来隔离病毒区域。此时病毒已经被完全控制住了。

 示例 2：

 输入: isInfected = [[1,1,1],[1,0,1],[1,1,1]]
 输出: 4
 解释: 虽然只保存了一个小区域，但却有四面墙。
 注意，防火墙只建立在两个不同区域的共享边界上。
 示例 3:

 输入: isInfected = [[1,1,1,0,0,0,0,0,0],[1,0,1,0,1,1,1,1,1],[1,1,1,0,0,0,0,0,0]]
 输出: 13
 解释: 在隔离右边感染区域后，隔离左边病毒区域只需要 2 个防火墙。

 提示:

 m == isInfected.length
 n == isInfected[i].length
 1 <= m, n <= 50
 isInfected[i][j] is either 0 or 1
 在整个描述的过程中，总有一个相邻的病毒区域，它将在下一轮 严格地感染更多未受污染的方块

 */

func containVirus(_ isInfected: [[Int]]) -> Int {
    var isInfected = isInfected
    struct pair: Hashable {
        var x: Int
        var y: Int
    }
    let dirs = [pair(x: -1, y: 0), pair(x: 1, y: 0), pair(x: 0, y: -1), pair(x: 0, y: 1)]
    let m = isInfected.count
    let n = isInfected[0].count
    var ans = 0
    while true {
        var neighbors: [[pair: Int]] = []
        var firewalls: [Int] = []
        for i in 0 ..< m {
            for j in 0 ..< n {
                if isInfected[i][j] != 1 {
                    continue
                }

                var q = [pair(x: i, y: j)]
                var neighbor: [pair: Int] = [:]
                var firewall = 0
                let idx = neighbors.count + 1
                isInfected[i][j] = -idx
                var index = 0
                while index < q.count {
                    let p = q[index]
                    for d in dirs {
                        let x = p.x + d.x
                        let y = p.y + d.y
                        if x >= 0 &&
                            x < m &&
                            y >= 0 &&
                            y < n {
                            if isInfected[x][y] == 1 {
                                q.append(pair(x: x, y: y))
                                isInfected[x][y] = -idx
                            } else if isInfected[x][y] == 0 {
                                firewall += 1
                                neighbor[pair(x: x, y: y)] = 1
                            }
                        }
                    }
                    index += 1
                }
                neighbors.append(neighbor)
                firewalls.append(firewall)
            }
        }

        if neighbors.isEmpty {
            break
        }

        var idx = 0
        for i in 1 ..< neighbors.count {
            if neighbors[idx].count < neighbors[i].count {
                idx = i
            }
        }

        ans += firewalls[idx]
        for (i, row) in isInfected.enumerated() {
            for (j, v) in row.enumerated() {
                if v < 0 {
                    if v != -idx - 1 {
                        isInfected[i][j] = 1
                    } else {
                        isInfected[i][j] = 2
                    }
                }
            }
        }

        for (i, neighbor) in neighbors.enumerated() {
            if i != idx {
                for (p, _) in neighbor {
                    isInfected[p.x][p.y] = 1
                }
            }
        }

        if neighbors.count == 1 {
            break
        }
    }

    return ans

//    struct InfectedZone {
//        var infected: Set<Int>
//        var willBeInfected: Set<Int>
//        var needWalls: Int
//    }
//
//    let dx = [0,0,1,-1]
//    let dy = [1,-1,0,0]
//
//    let M = isInfected.count
//    let N = isInfected[0].count
//
//    var isInfected = isInfected
//    var totalWalls = 0
//
//    var infected = Set<Int>()
//    var blocked = Set<Int>()
//
//    func valid(_ x: Int, _ y: Int) -> Bool {
//        return x < M && x >= 0 && y >= 0 && y < N
//    }
//
//    var varius = [Int:InfectedZone]() //key: infected source value: varius
//    func dfs(currentPosition: Int, source: Int) {
//        for index in 0..<4 {
//            let nextX = currentPosition >> 8 + dx[index]
//            let nextY = currentPosition & 0xff + dy[index]
//            if valid(nextX, nextY) {
//                let p = nextX << 8 | nextY
//                if isInfected[nextX][nextY] == 0 {
//                    varius[source]?.willBeInfected.insert(p)
//                    varius[source]?.needWalls += 1
//                }
//                if isInfected[nextX][nextY] == 1 && !infected.contains(p) && !blocked.contains(p){
//                    infected.insert(p)
//                    varius[source]?.infected.insert(p)
//                    dfs(currentPosition: p, source: source)
//                }
//            }
//        }
//    }
//
//    while true {
//
//        varius = [:]
//        infected = []
//        var infectedCount = 0
//
//        for r in 0..<M {
//            for c in 0..<N {
//                if isInfected[r][c] == 1 {
//                    infectedCount += 1
//                    let source = r << 8 | c
//                    if !infected.contains(source) && !blocked.contains(source) {
//                        infected.insert(source)
//                        varius[source] = InfectedZone(infected: [source], willBeInfected: [], needWalls: 0)
//                        dfs(currentPosition: source, source: source)
//                    }
//                }
//            }
//        }
//
//        if varius.isEmpty || infectedCount == M * N{
//            break
//        }
//        if varius.count == 1 {
//            totalWalls += (varius.first?.value.needWalls ?? 0)
//            break
//        }
//        let sortedVarius = varius.sorted { (varius1, varius2) -> Bool in
//            varius1.value.willBeInfected.count > varius2.value.willBeInfected.count
//        }
//        totalWalls += sortedVarius[0].value.needWalls
//        blocked = blocked.union(sortedVarius[0].value.infected)
//        for index in 1..<sortedVarius.count {
//            for nxt in sortedVarius[index].value.willBeInfected {
//                isInfected[nxt >> 8][nxt & 0xff] = 1
//            }
//        }
//    }
//
//    return totalWalls
}
