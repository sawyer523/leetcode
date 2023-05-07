//
//  34.pathSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/25.
//

import Foundation

/*
 剑指 Offer 34. 二叉树中和为某一值的路径
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。

 示例 1：

 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：[[5,4,11,2],[5,8,4,5]]
 示例 2：

 输入：root = [1,2,3], targetSum = 5
 输出：[]
 示例 3：

 输入：root = [1,2], targetSum = 0
 输出：[]

 提示：

 树中节点总数在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 */

func pathSum2(_ root: TreeNode?, _ target: Int) -> [[Int]] {
    guard let node = root else {
        return []
    }

    var path: [Int] = []
    var ans: [[Int]] = []
    func dfs(_ node: TreeNode?, _ left: Int) {
        guard let node = node else {
            return
        }

        let t = left - node.val
        path.append(node.val)
        defer {
            path.removeLast()
        }
        if node.left == nil, node.right == nil, t == 0 {
            ans.append(path)
            return
        }

        dfs(node.left, t)
        dfs(node.right, t)
    }

    dfs(node, target)
    return ans
}
