//
//  1719.checkWays.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/2/16.
//

import Foundation

/*
 1719. 重构一棵树的方案数
 难度
 困难

 69

 给你一个数组 pairs ，其中 pairs[i] = [xi, yi] ，并且满足：

 pairs 中没有重复元素
 xi < yi
 令 ways 为满足下面条件的有根树的方案数：

 树所包含的所有节点值都在 pairs 中。
 一个数对 [xi, yi] 出现在 pairs 中 当且仅当 xi 是 yi 的祖先或者 yi 是 xi 的祖先。
 注意：构造出来的树不一定是二叉树。
 两棵树被视为不同的方案当存在至少一个节点在两棵树中有不同的父节点。

 请你返回：

 如果 ways == 0 ，返回 0 。
 如果 ways == 1 ，返回 1 。
 如果 ways > 1 ，返回 2 。
 一棵 有根树 指的是只有一个根节点的树，所有边都是从根往外的方向。

 我们称从根到一个节点路径上的任意一个节点（除去节点本身）都是该节点的 祖先 。根节点没有祖先。

 示例 1：

 输入：pairs = [[1,2],[2,3]]
 输出：1
 解释：如上图所示，有且只有一个符合规定的有根树。
 示例 2：

 输入：pairs = [[1,2],[2,3],[1,3]]
 输出：2
 解释：有多个符合规定的有根树，其中三个如上图所示。
 示例 3：

 输入：pairs = [[1,2],[2,3],[2,4],[1,5]]
 输出：0
 解释：没有符合规定的有根树。

 提示：

 1 <= pairs.length <= 10^5
 1 <= xi < yi <= 500
 pairs 中的元素互不相同。
 */

func checkWays(_ pairs: [[Int]]) -> Int {
    var adj: [Int: [Int: Bool]] = [:]
    for pair in pairs {
        let x = pair[0]
        let y = pair[1]
        if adj[x] == nil {
            adj[x] = [:]
        }
        adj[x]![y] = true
        if adj[y] == nil {
            adj[y] = [:]
        }
        adj[y]![x] = true
    }

    var root = -1
    for (node, neighbours) in adj {
        if neighbours.count == adj.count - 1 {
            root = node
            break
        }
    }

    if root == -1 {
        return 0
    }

    var ans = 1
    for (node, neighbours) in adj {
        if node == root {
            continue
        }

        let currDegree = neighbours.count
        var parent = -1
        var parentdegree = Int.max
        for (neighbour, _) in neighbours {
            if adj[neighbour, default: [:]].count < parentdegree &&
                currDegree <= adj[neighbour, default: [:]].count {
                parent = neighbour
                parentdegree = adj[neighbour, default: [:]].count
            }
        }

        if parent == -1 {
            return 0
        }

        for (neighbour, _) in neighbours {
            if neighbour != parent &&
                !adj[parent, default: [:]][neighbour, default: false] {
                return 0
            }
        }

        if parentdegree == currDegree {
            ans = 2
        }
    }

    return ans
}
