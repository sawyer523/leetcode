//
//  872.leafSimilar.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/10.
//

import Foundation

func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    var nodeArr1: [Int] = []
    var nodeArr2: [Int] = []
    
    func leaf(_ node: TreeNode?, _ arr: inout [Int]) {
        if node == nil {
            return
        }
        
        var ok = true
        if let left = node?.left {
            leaf(left, &arr)
        } else {
            ok = false
        }
        
        if let right = node?.right {
            leaf(right, &arr)
        } else {
            if !ok {
                arr.append(node!.val)
            }
        }
    }
    
    leaf(root1, &nodeArr1)
    leaf(root2, &nodeArr2)
    
    return nodeArr1 == nodeArr2
}
