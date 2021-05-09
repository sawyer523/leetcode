//
//  92.reverseBetween.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/18.
//

import Foundation


/*
 92. 反转链表 II
 难度
 中等

 735





 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution92 {
        
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 0..<(left - 1) {
            pre = pre?.next
        }
        
        let cur: ListNode? = pre?.next
        var next: ListNode? = cur?.next
        for _ in 0..<(right - left) {
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
            next = cur?.next
        }
        
        return dummy.next
    }
}

