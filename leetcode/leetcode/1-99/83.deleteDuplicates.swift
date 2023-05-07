//
//  83.deleteDuplicates.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/25.
//

import Foundation

/*
 83. 删除排序链表中的重复元素
 难度
 简单

 495

 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

 示例 1:

 输入: 1->1->2
 输出: 1->2
 示例 2:

 输入: 1->1->2->3->3
 输出: 1->2->3

 */

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }

    let root = head
    var temp = root

    while temp?.next != nil {
        if temp?.val == temp?.next?.val {
            temp?.next = temp?.next?.next
            continue
        }
        temp = temp?.next
    }
    return root
}
