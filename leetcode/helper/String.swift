//
//  string.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/12.
//

import Foundation

extension String {
    subscript(_ i: Int) -> Character {
        let index = self.index(startIndex, offsetBy: i)
        return self[index]
    }
}
