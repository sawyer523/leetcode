//
//  1305.getAllElements.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/1.
//

import Foundation

/*
 1305. 两棵二叉搜索树中的所有元素
 难度
 中等

 120

 给你 root1 和 root2 这两棵二叉搜索树。请你返回一个列表，其中包含 两棵树 中的所有整数并按 升序 排序。.

 示例 1：

 输入：root1 = [2,1,4], root2 = [1,0,3]
 输出：[0,1,1,2,3,4]
 示例 2：

 输入：root1 = [1,null,8], root2 = [8,1]
 输出：[1,1,8,8]

 提示：

 每棵树的节点数在 [0, 5000] 范围内
 -10^5 <= Node.val <= 10^5
 */

func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    func inorder(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            dfs(node.left)
            res.append(node.val)
            dfs(node.right)
        }
        dfs(root)
        return res
    }

    let nums1 = inorder(root1)
    let nums2 = inorder(root2)

    var p1 = 0
    let n1 = nums1.count
    var p2 = 0
    let n2 = nums2.count
    var merged: [Int] = []
    while true {
        if p1 == n1 {
            merged.append(contentsOf: nums2[p2...])
            return merged
        }
        if p2 == n2 {
            merged.append(contentsOf: nums1[p1...])
            return merged
        }
        if nums1[p1] < nums2[p2] {
            merged.append(nums1[p1])
            p1 += 1
        } else {
            merged.append(nums2[p2])
            p2 += 1
        }
    }
}
