//
//  Employee.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/5/1.
//

import Foundation

public class Employee {
    public var id: Int
    public var importance: Int
    public var subordinates: [Int]
    public init(_ id: Int, _ importance: Int, _ subordinates: [Int]) {
        self.id = id
        self.importance = importance
        self.subordinates = subordinates
    }
}
