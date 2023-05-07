//
//  1669.mergeInBetween.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2023/1/30.
//

import Foundation

/*
 1669. 合并两个链表
 难度
 中等

 63

 给你两个链表 list1 和 list2 ，它们包含的元素分别为 n 个和 m 个。

 请你将 list1 中下标从 a 到 b 的全部节点都删除，并将list2 接在被删除节点的位置。

 下图中蓝色边和节点展示了操作后的结果：

 请你返回结果链表的头指针。

 示例 1：

 输入：list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
 输出：[0,1,2,1000000,1000001,1000002,5]
 解释：我们删除 list1 中下标为 3 和 4 的两个节点，并将 list2 接在该位置。上图中蓝色的边和节点为答案链表。
 示例 2：

 输入：list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 = [1000000,1000001,1000002,1000003,1000004]
 输出：[0,1,1000000,1000001,1000002,1000003,1000004,6]
 解释：上图中蓝色的边和节点为答案链表。

 提示：

 3 <= list1.length <= 10^4
 1 <= a <= b < list1.length - 1
 1 <= list2.length <= 10^4
 */

func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
    let list1 = list1
    var preA = list1
    for _ in 0 ..< a - 1 {
        preA = preA?.next
    }

    var preB = preA
    for _ in 0 ..< b - a + 2 {
        preB = preB?.next
    }

    var list2 = list2
    preA?.next = list2
    while list2?.next != nil {
        list2 = list2?.next
    }
    list2?.next = preB
    return list1
}
