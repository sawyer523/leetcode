//
//  1373.maxSumBST.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/20.
//

import Foundation

/*
 1373. 二叉搜索子树的最大键值和
 给你一棵以 root 为根的 二叉树 ，请你返回 任意 二叉搜索子树的最大键值和。

 二叉搜索树的定义如下：

 任意节点的左子树中的键值都 小于 此节点的键值。
 任意节点的右子树中的键值都 大于 此节点的键值。
 任意节点的左子树和右子树都是二叉搜索树。

 示例 1：

 输入：root = [1,4,3,2,4,2,5,null,null,null,null,null,null,4,6]
 输出：20
 解释：键值为 3 的子树是和最大的二叉搜索树。
 示例 2：

 输入：root = [4,3,null,1,2]
 输出：2
 解释：键值为 2 的单节点子树是和最大的二叉搜索树。
 示例 3：

 输入：root = [-4,-2,-5]
 输出：0
 解释：所有节点键值都为负数，和最大的二叉搜索树为空。
 示例 4：

 输入：root = [2,1,3]
 输出：6
 示例 5：

 输入：root = [5,4,8,3,null,6,3]
 输出：7

 提示：

 每棵树有 1 到 40000 个节点。
 每个节点的键值在 [-4 * 10^4 , 4 * 10^4] 之间。
 */

func maxSumBST(_ root: TreeNode?) -> Int {
    let INF = 0x3F_3F3F_3F3F
    struct SubTree {
        var isBST: Bool
        var minVal: Int
        var maxVal: Int
        var sumVal: Int
    }
    var res = 0
    @discardableResult
    func dfs(_ root: TreeNode?) -> SubTree {
        guard let node = root else {
            return SubTree(isBST: true, minVal: INF, maxVal: -INF, sumVal: 0)
        }
        let left = dfs(node.left)
        let right = dfs(node.right)

        if left.isBST &&
            right.isBST &&
            left.maxVal < node.val &&
            node.val < right.minVal {
            let sum = node.val + left.sumVal + right.sumVal
            res = max(res, sum)
            return SubTree(isBST: true, minVal: min(left.minVal, node.val), maxVal: max(right.maxVal, node.val), sumVal: sum)
        } else {
            return SubTree(isBST: false, minVal: 0, maxVal: 0, sumVal: 0)
        }
    }

    dfs(root)
    return res
}
