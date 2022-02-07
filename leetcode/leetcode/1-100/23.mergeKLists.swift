//
//  23.mergeKLists.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/12/28.
//

import Foundation

/*
 23. 合并K个升序链表
 难度
 困难
 
 1669
 
 
 
 
 
 给你一个链表数组，每个链表都已经按升序排列。
 
 请你将所有链表合并到一个升序链表中，返回合并后的链表。
 
 
 
 示例 1：
 
 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：
 
 输入：lists = []
 输出：[]
 示例 3：
 
 输入：lists = [[]]
 输出：[]
 
 
 提示：
 
 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4

 */

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    let input = lists
    if(input.count == 0) {
        return nil
    }
    if(input.count == 1) {
        return input[0]
    }
    
    func partition(_ list:[ListNode?], _ start:Int, _ end:Int) -> ListNode?{
        if(start == end) {
            return list[start]
        }
        if(start < end) {
            let middle = (start + end)/2
            let l1 = partition(list, start,middle)
            let l2 = partition(list, middle + 1,end)
            return mergeTwoList(l1,l2)
        }
        return nil
    }
    
    func mergeTwoList(_ l1:ListNode?, _ l2:ListNode?) ->ListNode? {
        if(l1 == nil) {return l2}
        if(l2 == nil) {return l1}
        var result:ListNode?
        
        if(l1!.val <= l2!.val) {
            result = l1
            result!.next = mergeTwoList(l1!.next,l2)
        }
        else {
            result = l2
            result!.next = mergeTwoList(l1,l2!.next)
        }
        return result
    }
    
    return partition(lists,0,input.count - 1)
}
