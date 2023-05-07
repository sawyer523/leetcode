//
//  22.getKthFromEnd.swift
//  22.getKthFromEnd
//
//  Created by Xiaonan Chen on 2021/9/2.
//

import Foundation

/*
 剑指 Offer 22. 链表中倒数第k个节点
 难度
 简单

 245

 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.
 */

func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
//    var arr: [ListNode] = []
//    var tmp = head
//    while tmp != nil {
//        arr.append(tmp!)
//        tmp = tmp?.next
//    }
//    let n = arr.count
//    return n==1 ? arr.first : arr[n-k]
    if head == nil {
        return nil
    }

    var fast = head
    for _ in 0 ..< k {
        fast = fast?.next
    }

    var slow = head
    while fast != nil {
        slow = slow?.next
        fast = fast?.next
    }

    return slow
}
