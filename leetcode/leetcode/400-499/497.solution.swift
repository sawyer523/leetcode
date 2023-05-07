//
//  497.solution.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/9.
//

import Foundation

/*
 497. 非重叠矩形中的随机点
 难度
 中等

 74

 给定一个由非重叠的轴对齐矩形的数组 rects ，其中 rects[i] = [ai, bi, xi, yi] 表示 (ai, bi) 是第 i 个矩形的左下角点，(xi, yi) 是第 i 个矩形的右上角点。设计一个算法来随机挑选一个被某一矩形覆盖的整数点。矩形周长上的点也算做是被矩形覆盖。所有满足要求的点必须等概率被返回。

 在一个给定的矩形覆盖的空间内任何整数点都有可能被返回。

 请注意 ，整数点是具有整数坐标的点。

 实现 Solution 类:

 Solution(int[][] rects) 用给定的矩形数组 rects 初始化对象。
 int[] pick() 返回一个随机的整数点 [u, v] 在给定的矩形所覆盖的空间内。

 示例 1：

 输入:
 ["Solution", "pick", "pick", "pick", "pick", "pick"]
 [[[[-2, -2, 1, 1], [2, 2, 4, 6]]], [], [], [], [], []]
 输出:
 [null, [1, -2], [1, -1], [-1, -2], [-2, -2], [0, 0]]

 解释：
 Solution solution = new Solution([[-2, -2, 1, 1], [2, 2, 4, 6]]);
 solution.pick(); // 返回 [1, -2]
 solution.pick(); // 返回 [1, -1]
 solution.pick(); // 返回 [-1, -2]
 solution.pick(); // 返回 [-2, -2]
 solution.pick(); // 返回 [0, 0]

 提示：

 1 <= rects.length <= 100
 rects[i].length == 4
 -10^9 <= ai < xi <= 10^9
 -10^9 <= bi < yi <= 10^9
 xi - ai <= 2000
 yi - bi <= 2000
 所有的矩形不重叠。
 pick 最多被调用 10^4 次。
 */

class Solution497 {
    private var rects: [[Int]]
    private var sum: [Int]

    init(_ rects: [[Int]]) {
        self.rects = rects
        sum = [Int](repeating: 0, count: rects.count + 1)
        for (i, r) in rects.enumerated() {
            sum[i + 1] = sum[i] + (r[2] - r[0] + 1) * (r[3] - r[1] + 1)
        }
    }

    func pick() -> [Int] {
        let k = Int.random(in: 0 ..< sum.last!)
        let rectIndex = binarySearch(k + 1) - 1
        let r = rects[rectIndex]
        let a = r[0]
        let b = r[1]
        let y = r[3]
        let da = (k - sum[rectIndex]) / (y - b + 1)
        let db = (k - sum[rectIndex]) % (y - b + 1)
        return [a + da, b + db]
    }

    private func binarySearch(_ target: Int) -> Int {
        var low = 0
        var high = sum.count
        while low <= high {
            let mid = (low + high) >> 1
            let num = sum[mid]
            if num == target {
                return mid
            } else if target < num {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
}
