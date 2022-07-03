//
//  449.codec.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/11.
//

import Foundation

/*
 449. 序列化和反序列化二叉搜索树
 难度
 中等

 280





 序列化是将数据结构或对象转换为一系列位的过程，以便它可以存储在文件或内存缓冲区中，或通过网络连接链路传输，以便稍后在同一个或另一个计算机环境中重建。

 设计一个算法来序列化和反序列化 二叉搜索树 。 对序列化/反序列化算法的工作方式没有限制。 您只需确保二叉搜索树可以序列化为字符串，并且可以将该字符串反序列化为最初的二叉搜索树。

 编码的字符串应尽可能紧凑。

  

 示例 1：

 输入：root = [2,1,3]
 输出：[2,1,3]
 示例 2：

 输入：root = []
 输出：[]
  

 提示：

 树中节点数范围是 [0, 10^4]
 0 <= Node.val <= 10^4
 题目数据 保证 输入的树是一棵二叉搜索树。
 */

class Codec449 {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var arr: [String] = []
        func postOrder(_ node: TreeNode?) {
            guard let node = node else {
                return
            }
            postOrder(node.left)
            postOrder(node.right)
            arr.append(node.val.description)
        }
        postOrder(root)
        return arr.joined(separator: " ")
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        if data == "" {
            return nil
        }
        
        var arr = data.split(separator: " ")
        func construct(_ lower: Int, _ upper: Int) -> TreeNode? {
            if arr.isEmpty {
                return nil
            }
            
            let val = Int(arr.last!)!
            if val < lower ||
                upper < val {
                return nil
            }
            
            arr.removeLast()
            let right = construct(val, upper)
            let left = construct(lower, val)
            return TreeNode(val, left, right)
        }
        
        return construct(Int.min, Int.max)
    }
}
