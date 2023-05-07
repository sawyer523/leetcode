//
//  24.reverseList.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/12.
//

import Foundation

/*
 剑指 Offer 24. 反转链表
 定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL

 限制：

 0 <= 节点个数 <= 5000
 */

func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var cur = head
    
    while cur != nil {
        let next = cur?.next
        cur?.next = prev
        prev = cur
        cur = next
    }
    
    return prev
}
