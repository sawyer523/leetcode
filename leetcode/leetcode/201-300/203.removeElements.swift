//
//  203.removeElements.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/5.
//

import Foundation

/*
 203. 移除链表元素
 难度
 简单
 
 636
 
 
 
 
 
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
 
 
 示例 1：
 
 
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]
 示例 2：
 
 输入：head = [], val = 1
 输出：[]
 示例 3：
 
 输入：head = [7,7,7,7], val = 7
 输出：[]
 
 
 提示：
 
 列表中的节点在范围 [0, 104] 内
 1 <= Node.val <= 50
 0 <= k <= 50
 */

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let root: ListNode? = ListNode()
    root?.next = head
    var tmp = root
    while tmp?.next != nil {
        if tmp?.next?.val == val {
            tmp?.next = tmp?.next?.next
        } else {
            tmp = tmp?.next
        }
    }
    return root?.next
}
