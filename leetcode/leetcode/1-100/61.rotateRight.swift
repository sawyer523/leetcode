//
//  61.rotateRight.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/27.
//

import Foundation

/*
 61. 旋转链表
 难度
 中等

 517





 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。

  

 示例 1：


 输入：head = [1,2,3,4,5], k = 2
 输出：[4,5,1,2,3]
 示例 2：


 输入：head = [0,1,2], k = 4
 输出：[2,0,1]
  

 提示：

 链表中节点的数目在范围 [0, 500] 内
 -100 <= Node.val <= 100
 0 <= k <= 2 * 109
 */

private class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

private func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if k == 0 || head == nil || head?.next == nil {
        return head
    }

    var tmp = head
    var n = 1
    while tmp?.next != nil {
        tmp = tmp?.next
        n += 1
    }

    var add = n - k%n
    if n == add {
        return head
    }

    tmp?.next = head
    while 0 < add {
        tmp = tmp?.next
        add -= 1
    }

    let res = tmp?.next
    tmp?.next = nil
    return res
}
