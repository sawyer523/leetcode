//
//  36.treeToDoublyList.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/25.
//

import Foundation

/*
 剑指 Offer 36. 二叉搜索树与双向链表
 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的循环双向链表。要求不能创建任何新的节点，只能调整树中节点指针的指向。

 为了让您更好地理解问题，以下面的二叉搜索树为例：

 我们希望将这个二叉搜索树转化为双向循环链表。链表中的每个节点都有一个前驱和后继指针。对于双向循环链表，第一个节点的前驱是最后一个节点，最后一个节点的后继是第一个节点。

 下图展示了上面的二叉搜索树转化成的链表。“head” 表示指向链表中有最小元素的节点。

 特别地，我们希望可以就地完成转换操作。当转化完成以后，树中节点的左指针需要指向前驱，树中节点的右指针需要指向后继。还需要返回链表中的第一个节点的指针。
 */

class SolutionTreeToDoublyList36 {
    class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public init(_ val: Int) {
            self.val = val
            left = nil
            right = nil
        }
    }

    func treeToDoublyList(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        var first: Node?
        var last: Node?
        func dfs(_ node: Node?) {
            guard let node = node else {
                return
            }

            dfs(node.left)

            if last != nil {
                last?.right = node
                node.left = last
            } else {
                first = node
            }

            last = node

            dfs(node.right)
        }

        dfs(root)

        last?.right = first
        first?.left = last
        return first
    }
}
