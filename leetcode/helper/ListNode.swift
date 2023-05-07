//
//  ListNode.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/5.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}
