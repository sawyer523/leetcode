//
//  1080.sufficientSubset.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/22.
//

import Foundation

/*
 1080. 根到叶路径上的不足节点
 给你二叉树的根节点 root 和一个整数 limit ，请你同时删除树中所有 不足节点 ，并返回最终二叉树的根节点。

 假如通过节点 node 的每种可能的 “根-叶” 路径上值的总和全都小于给定的 limit，则该节点被称之为 不足节点 ，需要被删除。

 叶子节点，就是没有子节点的节点。

 示例 1：

 输入：root = [1,2,3,4,-99,-99,7,8,9,-99,-99,12,13,-99,14], limit = 1
 输出：[1,2,3,4,null,null,7,8,9,null,14]
 示例 2：

 输入：root = [5,4,8,11,null,17,4,7,1,null,null,5,3], limit = 22
 输出：[5,4,8,11,null,17,4,7,null,null,null,5]
 示例 3：

 输入：root = [1,2,-3,-5,null,4,null], limit = -1
 输出：[1,null,-3,4]

 提示：

 树中节点数目在范围 [1, 5000] 内
 -10^5 <= Node.val <= 10^5
 -10^9 <= limit <= 10^9
 */

func sufficientSubset(_ root: TreeNode?, _ limit: Int) -> TreeNode? {
    func checkSufficientLeaf(_ node: TreeNode?, _ sum: Int) -> Bool {
        guard let node = node else {
            return false
        }

        if node.left == nil &&
            node.right == nil {
            return limit <= node.val + sum
        }

        let haveLeft = checkSufficientLeaf(node.left, sum + node.val)
        let haveRight = checkSufficientLeaf(node.right, sum + node.val)

        if !haveLeft {
            node.left = nil
        }

        if !haveRight {
            node.right = nil
        }

        return haveLeft || haveRight
    }

    let haveSuff = checkSufficientLeaf(root, 0)
    return haveSuff ? root : nil
}
