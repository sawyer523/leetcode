//
//  25.mergeTwoLists.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/22.
//

import Foundation

/*
 剑指 Offer 25. 合并两个排序的链表
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000
 */

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let root: ListNode? = ListNode(-1)
    var prev = root
    while l1 != nil, l2 != nil {
        if l1!.val <= l2!.val {
            prev?.next = l1
            l1 = l1?.next
        } else {
            prev?.next = l2
            l2 = l2?.next
        }

        prev = prev?.next
    }

    prev?.next = l1 == nil ? l2 : l1
    return root?.next
}
