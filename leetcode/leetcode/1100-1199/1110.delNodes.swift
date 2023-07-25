//
//  1110.delNodes.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/5/30.
//

import Foundation

/*
 1110. 删点成林
 给出二叉树的根节点 root，树上每个节点都有一个不同的值。

 如果节点值在 to_delete 中出现，我们就把该节点从树上删去，最后得到一个森林（一些不相交的树构成的集合）。

 返回森林中的每棵树。你可以按任意顺序组织答案。

 示例 1：

 输入：root = [1,2,3,4,5,6,7], to_delete = [3,5]
 输出：[[1,2,null,4],[6],[7]]
 示例 2：

 输入：root = [1,2,4,null,3], to_delete = [3]
 输出：[[1,2,4]]

 提示：

 树中的节点数最大为 1000。
 每个节点都有一个介于 1 到 1000 之间的值，且各不相同。
 to_delete.length <= 1000
 to_delete 包含一些从 1 到 1000、各不相同的值。
 */

func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
    var toDeleteSet = Dictionary(uniqueKeysWithValues: zip(to_delete, [Bool](repeating: true, count: to_delete.count)))
    var roots: [TreeNode?] = []
    
    @discardableResult
    func dfs(_ node: TreeNode?, _ isRoot: Bool) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        let deleted = toDeleteSet[node.val] ?? false
        node.left = dfs(node.left, deleted)
        node.right = dfs(node.right, deleted)
        if deleted {
            return nil
        } else if isRoot {
            roots.append(node)
        }
        return node
    }
    
    dfs(root, true)
    return roots
}
