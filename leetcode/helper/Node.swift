//
//  Node.swift
//  Node
//
//  Created by Xiaonan Chen on 2021/7/22.
//

import Foundation

// MARK: - BNode

public class BNode {
    public var val: Int
    public var next: BNode?
    public var random: BNode?
    public var child: BNode?
    public var prev: BNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
        random = nil
        child = nil
    }
}

// MARK: Equatable

extension BNode: Equatable {
    public static func == (_ lhs: BNode, _ rhs: BNode) -> Bool {
        return lhs.val == rhs.val
    }
}

// MARK: Hashable

extension BNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

// MARK: - Node

public class Node {
    public var val: Int
    public var next: Node?
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        children = []
    }
}

// MARK: Equatable

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
}

// MARK: Hashable

extension Node: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

// MARK: - Node2

public class Node2 {
    public var val: Bool
    public var isLeaf: Bool
    public var topLeft: Node2?
    public var topRight: Node2?
    public var bottomLeft: Node2?
    public var bottomRight: Node2?
    public init(_ val: Bool, _ isLeaf: Bool) {
        self.val = val
        self.isLeaf = isLeaf
        topLeft = nil
        topRight = nil
        bottomLeft = nil
        bottomRight = nil
    }

    public init(_ val: Bool, _ isLeaf: Bool, _ topLeft: Node2?, _ topRight: Node2?, _ bottomLeft: Node2?, _ bottomRight: Node2?) {
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
}
