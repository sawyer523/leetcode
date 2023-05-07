//
//  1743.restoreArray.swift
//  1743.restoreArray
//
//  Created by Xiaonan Chen on 2021/7/25.
//

import Foundation

/*
 1743. 从相邻元素对还原数组
 难度
 中等

 84

 存在一个由 n 个不同元素组成的整数数组 nums ，但你已经记不清具体内容。好在你还记得 nums 中的每一对相邻元素。

 给你一个二维整数数组 adjacentPairs ，大小为 n - 1 ，其中每个 adjacentPairs[i] = [ui, vi] 表示元素 ui 和 vi 在 nums 中相邻。

 题目数据保证所有由元素 nums[i] 和 nums[i+1] 组成的相邻元素对都存在于 adjacentPairs 中，存在形式可能是 [nums[i], nums[i+1]] ，也可能是 [nums[i+1], nums[i]] 。这些相邻元素对可以 按任意顺序 出现。

 返回 原始数组 nums 。如果存在多种解答，返回 其中任意一个 即可。

 示例 1：

 输入：adjacentPairs = [[2,1],[3,4],[3,2]]
 输出：[1,2,3,4]
 解释：数组的所有相邻元素对都在 adjacentPairs 中。
 特别要注意的是，adjacentPairs[i] 只表示两个元素相邻，并不保证其 左-右 顺序。
 示例 2：

 输入：adjacentPairs = [[4,-2],[1,4],[-3,1]]
 输出：[-2,4,1,-3]
 解释：数组中可能存在负数。
 另一种解答是 [-3,1,4,-2] ，也会被视作正确答案。
 示例 3：

 输入：adjacentPairs = [[100000,-100000]]
 输出：[100000,-100000]

 提示：

 nums.length == n
 adjacentPairs.length == n - 1
 adjacentPairs[i].length == 2
 2 <= n <= 10^5
 -10^5 <= nums[i], ui, vi <= 10^5
 题目数据保证存在一些以 adjacentPairs 作为元素对的数组 nums
 */

func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
    let n = adjacentPairs.count + 1
    var map: [Int: [Int]] = [:]
    for adj in adjacentPairs {
        let v = adj[0]
        let w = adj[1]
        if var arr = map[v] {
            arr.append(w)
            map[v] = arr
        } else {
            map[v] = [w]
        }
    }

    var ans: [Int] = []
    for (k, v) in map {
        if v.count == 1 {
            ans[0] = k
            break
        }
    }

    ans[1] = map[ans.first!]![0]
    for i in 2 ..< n {
        let adj = map[ans[i - 1]]!
        if ans[i - 2] == adj[0] {
            ans[i] = adj[1]
        } else {
            ans[i] = adj[0]
        }
    }

    return ans
}

/*
 n := len(adjacentPairs) + 1
 g := make(map[int][]int, n)
 for _, p := range adjacentPairs {
 v, w := p[0], p[1]
 g[v] = append(g[v], w)
 g[w] = append(g[w], v)
 }

 ans := make([]int, n)
 for e, adj := range g {
 if len(adj) == 1 {
 ans[0] = e
 break
 }
 }

 ans[1] = g[ans[0]][0]
 for i := 2; i < n; i++ {
 adj := g[ans[i-1]]
 if ans[i-2] == adj[0] {
 ans[i] = adj[1]
 } else {
 ans[i] = adj[0]
 }
 }
 return ans

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/restore-the-array-from-adjacent-pairs/solution/cong-xiang-lin-yuan-su-dui-huan-yuan-shu-v55t/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
