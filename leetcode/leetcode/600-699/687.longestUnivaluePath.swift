//
//  687.longestUnivaluePath.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/9/2.
//

import Foundation

/*
 687. 最长同值路径
 难度
 中等

 626

 给定一个二叉树的 root ，返回 最长的路径的长度 ，这个路径中的 每个节点具有相同值 。 这条路径可以经过也可以不经过根节点。

 两个节点之间的路径长度 由它们之间的边数表示。

 示例 1:

 输入：root = [5,4,5,1,1,5]
 输出：2
 示例 2:

 输入：root = [1,4,5,4,4,5]
 输出：2

 提示:

 树的节点数的范围是 [0, 10^4]
 -1000 <= Node.val <= 1000
 树的深度将不超过 1000
 */

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    var ans = 0
    func dfs(_ node: TreeNode?) -> Int {
        guard let root = node else {
            return 0
        }
        let left = dfs(root.left)
        let right = dfs(root.right)

        var left1 = 0
        var right1 = 0
        if let l = root.left, l.val == root.val {
            left1 = left + 1
        }
        if let r = root.right, r.val == root.val {
            right1 = right + 1
        }
        ans = max(ans, left1 + right1)
        return max(left1, right1)
    }
    _ = dfs(root)
    return ans
}
