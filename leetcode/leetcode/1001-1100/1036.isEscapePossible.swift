    //
    //  1036.isEscapePossible.swift
    //  leetcode
    //
    //  Created by Xiaonan Chen on 2022/1/11.
    //

import Foundation

/*
 1036. 逃离大迷宫
 难度
 困难
 
 80
 
 
 
 
 
 在一个 10^6 x 10^6 的网格中，每个网格上方格的坐标为 (x, y) 。
 
 现在从源方格 source = [sx, sy] 开始出发，意图赶往目标方格 target = [tx, ty] 。数组 blocked 是封锁的方格列表，其中每个 blocked[i] = [xi, yi] 表示坐标为 (xi, yi) 的方格是禁止通行的。
 
 每次移动，都可以走到网格中在四个方向上相邻的方格，只要该方格 不 在给出的封锁列表 blocked 上。同时，不允许走出网格。
 
 只有在可以通过一系列的移动从源方格 source 到达目标方格 target 时才返回 true。否则，返回 false。
 
 
 
 示例 1：
 
 输入：blocked = [[0,1],[1,0]], source = [0,0], target = [0,2]
 输出：false
 解释：
 从源方格无法到达目标方格，因为我们无法在网格中移动。
 无法向北或者向东移动是因为方格禁止通行。
 无法向南或者向西移动是因为不能走出网格。
 示例 2：
 
 输入：blocked = [], source = [0,0], target = [999999,999999]
 输出：true
 解释：
 因为没有方格被封锁，所以一定可以到达目标方格。
 
 
 提示：
 
 0 <= blocked.length <= 200
 blocked[i].length == 2
 0 <= xi, yi < 10^6
 source.length == target.length == 2
 0 <= sx, sy, tx, ty < 10^6
 source != target
 题目数据保证 source 和 target 不在封锁列表内
 */

func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
    struct pair: Hashable {
        var x: Int
        var y: Int
    }
    let dirs = [pair(x: -1, y: 0), pair(x: 1, y: 0), pair(x: 0, y: -1), pair(x: 0, y: 1)]
    let block = -1
    let valid = 0
    let found = 1
    let boundary = Int(1e6)
    
    let n = blocked.count
    if n < 2 {
        return true
    }
    
    var blcokSet: [pair: Bool] = [:]
    
    for block in blocked {
        blcokSet[pair(x: block[0], y: block[1])] = true
    }
    
    func check(_ start: [Int], _ finish: [Int]) -> Int {
        let sx = start[0]
        let sy = start[1]
        let fx = finish[0]
        let fy = finish[1]
        var countdown = n * (n - 1) / 2
        
        var q = [pair(x: sx, y: sy)]
        var vis = [pair(x: sx, y: sy): true]
        
        while !q.isEmpty && 0 < countdown {
            let p = q.removeFirst()
            for dir in dirs {
                let x = p.x + dir.x
                let y = p.y + dir.y
                let np = pair(x: x, y: y)
                if 0 <= x &&
                    x < boundary &&
                    0 <= y &&
                    y < boundary &&
                    !blcokSet[np, default: false] &&
                    !vis[np, default: false] {
                    if x == fx &&
                        y == fy {
                        return found
                    }
                    countdown -= 1
                    vis[np] = true
                    q.append(np)
                }
            }
        }
        
        if 0 < countdown {
            return block
        }
        
        return valid
    }
    
    let res = check(source, target)
    
    return res == found ||
    res == valid && check(target, source) != block
}
