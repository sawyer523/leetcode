//
//  37.codec.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/30.
//

import Foundation

/*
 剑指 Offer 37. 序列化二叉树
 难度
 困难
 
 586
 
 
 
 
 
 序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。
 
 请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。
 
 提示: 输入输出格式与 LeetCode 目前使用的方式一致，详情请参阅 LeetCode 序列化二叉树的格式。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。
 
 
 
 示例 1：
 
 
 输入：root = [1,2,3,null,null,4,5]
 输出：[1,2,3,null,null,4,5]
 示例 2：
 
 输入：root = []
 输出：[]
 示例 3：
 
 输入：root = [1]
 输出：[1]
 示例 4：
 
 输入：root = [1,2]
 输出：[1,2]
 
 
 提示：
 
 树中结点数在范围 [0, 104] 内
 -1000 <= Node.val <= 1000
 */

class Codec2 {
    func serialize(_ root: TreeNode?) -> String {
        var vals = [String]()
        var queue = [TreeNode?]()
        queue.append(root)
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                vals.append(node.val.description)
                queue.append(node.left)
                queue.append(node.right)
            } else {
                vals.append("nil")
            }
        }
        return vals.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data != "nil" else { return nil }
        var queue = [TreeNode]()
        let vals = data.split(separator: ",").map { String($0) }
        let root = TreeNode(Int(vals[0])!)
        queue.append(root)
        var idx = 1
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if vals[idx] != "nil" {
                node.left = TreeNode(Int(vals[idx])!)
                queue.append(node.left!)
            }
            idx += 1
            if vals[idx] != "nil" {
                node.right = TreeNode(Int(vals[idx])!)
                queue.append(node.right!)
            }
            idx += 1
        }
        
        return root
    }
}
