//
//  86.partition.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/3.
//

import Foundation

/*
 86. 分隔链表
 难度
 中等

 293





 给你一个链表和一个特定值 x ，请你对链表进行分隔，使得所有小于 x 的节点都出现在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

  

 示例：

 输入：head = 1->4->3->2->5->2, x = 3
 输出：1->2->2->4->3->5
 */


class Solution86 {
   
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
   
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var p = head
        var p1 = ListNode(0)
        var p1Head = p1
        
        var p2 = ListNode(0)
        var p2Head = p2
        
        while p != nil {
            if p!.val < x {
                p1.next = p
                p1 = p1.next!
            } else {
                p2.next = p
                p2 = p2.next!
            }
            p = p?.next
        }
        
        p1.next = nil
        p2.next = nil
        p1.next = p2Head.next
        return p1Head.next
    }
}
