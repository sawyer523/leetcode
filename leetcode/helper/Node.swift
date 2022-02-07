//
//  Node.swift
//  Node
//
//  Created by Xiaonan Chen on 2021/7/22.
//

import Foundation

public class BNode {
    public var val: Int
    public var next: BNode?
    public var random: BNode?
    public var child: BNode?
    public var prev: BNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
        self.child = nil
    }
}

extension BNode: Equatable {
    public static func == (_ lhs: BNode, _ rhs: BNode) -> Bool {
        return lhs.val == rhs.val
    }
}

extension BNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}



public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
        
    }
}

