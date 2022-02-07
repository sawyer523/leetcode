//
//  407.trapRainWater.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/3.
//

import Foundation

/*
 407. 接雨水 II
 难度
 困难
 
 416
 
 
 
 
 
 给你一个 m x n 的矩阵，其中的值均为非负整数，代表二维高度图每个单元的高度，请计算图中形状最多能接多少体积的雨水。
 
 
 
 示例 1:
 
 
 
 输入: heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
 输出: 4
 解释: 下雨后，雨水将会被上图蓝色的方块中。总的接雨水量为1+2+1=4。
 示例 2:
 
 
 
 输入: heightMap = [[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]
 输出: 10
 
 
 提示:
 
 m == heightMap.length
 n == heightMap[i].length
 1 <= m, n <= 200
 0 <= heightMap[i][j] <= 2 * 10^4
 */

func trapRainWater(_ heightMap: [[Int]]) -> Int {
    struct Point: Hashable {
        let x: Int
        let y: Int
        let height: Int
        init(_ x: Int, _ y: Int, _ height: Int) {
            self.x = x
            self.y = y
            self.height = height
        }
    }
    
    // heap definition
    class Heap {
        private var heap = [Point]()
        
        private let comparator: (_ top: Point, _ bottom: Point) -> Bool
        init(topToBottom comparator: @escaping (Point, Point) -> Bool) {
            self.comparator = comparator
        }
        
        var count: Int {
            return heap.count
        }
        
        func isEmpty() -> Bool {
            return count == 0
        }
        
        func add(_ num: Point) {
            heap.append(num)
            var curr = heap.count - 1
            while curr > 0 {
                let parent = (curr - 1) / 2
                if !comparator(heap[parent], heap[curr]) {
                    heap.swapAt(curr, parent)
                    curr = parent
                } else {
                    break
                }
            }
        }
        
        func extract() -> Point? {
            guard heap.count > 0 else { return nil }
            let result = heap[0]
            let last = heap.removeLast()
            if heap.count > 0 {
                heap[0] = last
                var curr = 0
                while curr < heap.count {
                    let next: Int
                    let left = curr * 2 + 1, right = curr * 2 + 2
                    if right < heap.count {
                        next = comparator(heap[left], heap[right]) ? left : right
                    } else if left < heap.count {
                        next = left
                    } else {
                        break
                    }
                    
                    if !comparator(heap[curr], heap[next]) {
                        heap.swapAt(curr, next)
                        curr = next
                    } else {
                        break
                    }
                }
            }
            return result
        }
        
        func peek() -> Point? {
            return heap.first
        }
    }
    guard heightMap.count > 0, heightMap[0].count > 0 else { return 0 }
    
    let col = heightMap[0].count
    let row = heightMap.count
    var visited = Set<Point>()
    
    // init minHeap, push all surrounding into minHeap
    let minHeap = Heap { (p0, p1) -> Bool in p0.height < p1.height }
    
    for j in 0..<col {
        let p0 = Point(0, j, heightMap[0][j])
        minHeap.add(p0)
        visited.insert(p0)
        
        let p1 = Point(row-1, j, heightMap[row-1][j])
        minHeap.add(p1)
        visited.insert(p1)
    }
    
    for i in 0..<row {
        
        let p0 = Point(i, 0, heightMap[i][0])
        if visited.contains(p0) { continue }
        
        minHeap.add(p0)
        visited.insert(p0)
        
        let p1 = Point(i, col-1, heightMap[i][col-1])
        if visited.contains(p1) { continue }
        minHeap.add(p1)
        visited.insert(p1)
    }
    
    // four directions
    let dxy = [(1,0), (0, 1), (-1, 0), (0, -1)]
    var result = 0
    var currentMax = Int.min
    
    while !minHeap.isEmpty() {
        let p = minHeap.extract()!
        currentMax = max(p.height, currentMax)
        
        for d in dxy {
            let nx = p.x + d.0
            let ny = p.y + d.1
            
            guard nx >= 0 && nx < row, ny >= 0 && ny < col else { continue }
            let np = Point(nx, ny, heightMap[nx][ny])
            guard !visited.contains(np) else { continue }
            
            if currentMax > heightMap[nx][ny] {
                result = result + (currentMax - heightMap[nx][ny])
            }
            minHeap.add(np)
            visited.insert(np)
        }
    }
    return result
}
