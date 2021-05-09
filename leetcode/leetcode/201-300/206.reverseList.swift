//
//  206.reverseList.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/18.
//

import Foundation

/*
 206. 反转链表
 难度
 简单

 1588





 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution206 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}
