//
//  06.reversePrint.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/3/12.
//

import Foundation

/*
 剑指 Offer 06. 从尾到头打印链表
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

 示例 1：

 输入：head = [1,3,2]
 输出：[2,3,1]

 限制：

 0 <= 链表长度 <= 10000
 */

func reversePrint(_ head: ListNode?) -> [Int] {
    guard let root = head else {
        return []
    }
    var ans = [root.val]
    var tmp = root.next
    while tmp != nil {
        ans.append(tmp!.val)
        tmp = tmp?.next
    }

    return ans.reversed()
}
