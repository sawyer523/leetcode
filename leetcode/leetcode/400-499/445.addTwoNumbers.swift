//
//  445.addTwoNumbers.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/7/3.
//

import Foundation

/*
 445. 两数相加 II
 给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。

 你可以假设除了数字 0 之外，这两个数字都不会以零开头。

 示例1：

 输入：l1 = [7,2,4,3], l2 = [5,6,4]
 输出：[7,8,0,7]
 示例2：

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[8,0,7]
 示例3：

 输入：l1 = [0], l2 = [0]
 输出：[0]

 提示：

 链表的长度范围为 [1, 100]
 0 <= node.val <= 9
 输入数据保证链表代表的数字无前导 0

 进阶：如果输入链表不能翻转该如何解决？
 */

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var stack1: [Int] = []
    var stack2: [Int] = []
    var l1 = l1
    while l1 != nil {
        stack1.append(l1!.val)
        l1 = l1?.next
    }

    var l2 = l2
    while l2 != nil {
        stack2.append(l2!.val)
        l2 = l2?.next
    }

    var carry = 0
    var ans: ListNode?
    while !stack1.isEmpty ||
        !stack2.isEmpty ||
        carry != 0 {
        let a = stack1.popLast() ?? 0
        let b = stack2.popLast() ?? 0
        var cur = a + b + carry
        carry = cur / 10
        cur %= 10
        let curNode = ListNode(cur)
        curNode.next = ans
        ans = curNode
    }
    return ans
}
