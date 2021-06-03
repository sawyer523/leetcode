//
//  103.zigzagLevelOrder.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/22.
//

import Foundation

/*
 给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回锯齿形层序遍历如下：

 [
   [3],
   [20,9],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class SolutionLevelOrder {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        return BFS(root)
    }

    func BFS(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var queue = [root]
        var ans: [[Int]] = []
        var height = 0
        var row: [Int] = []

        while 0 < queue.count {
           let q = queue
            queue.removeAll()
            row.removeAll()
            for node in q {
                row.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            if height & 1 == 1 {
                ans.append(row.reversed())
            } else {
                ans.append(row)
            }

            height += 1
        }
        return ans
    }

    func DFS(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }

        var ans: [[Int]] = []

        func _dfs(_ root: TreeNode?, _ level: Int, _ positive: Bool) {
            guard let root = root else {
                return
            }

            if ans.count == level {
                ans.append([])
            }

            if positive {
                ans[level].append(root.val)
            } else {
                ans[level].insert(root.val, at: 0)
            }

            _dfs(root.left, level+1, !positive)
            _dfs(root.right, level+1, !positive)
        }

        _dfs(root, 0, true)
        return ans
    }
}
