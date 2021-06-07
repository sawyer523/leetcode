//
//  82.deleteDuplicates.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/3/25.
//

import Foundation

/*
 82. 删除排序链表中的重复元素 II
 难度
 中等

 535





 存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。

 返回同样按升序排列的结果链表。

  

 示例 1：


 输入：head = [1,2,3,3,4,4,5]
 输出：[1,2,5]
 示例 2：


 输入：head = [1,1,1,2,3]
 输出：[2,3]
  

 提示：

 链表中节点数目在范围 [0, 300] 内
 -100 <= Node.val <= 100
 题目数据保证链表已经按升序排列

 */

func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }

    let root = ListNode(0, head)
    var slow: ListNode? = root
    var fast: ListNode? = head

    while fast != nil {
        while fast?.next != nil, fast?.val == fast?.next?.val {
            fast = fast?.next
        }
        if slow?.next !== fast {
            slow?.next = fast?.next
            fast = slow?.next
        } else {
            slow = fast
            fast = fast?.next
        }
    }
    return root.next
}
