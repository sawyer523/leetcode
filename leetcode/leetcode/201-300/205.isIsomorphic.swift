//
//  205.isIsomorphic.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/27.
//

import Foundation

/*
 205. 同构字符串
 难度
 简单
 
 279
 
 
 
 
 
 给定两个字符串 s 和 t，判断它们是否是同构的。
 
 如果 s 中的字符可以被替换得到 t ，那么这两个字符串是同构的。
 
 所有出现的字符都必须用另一个字符替换，同时保留字符的顺序。两个字符不能映射到同一个字符上，但字符可以映射自己本身。
 
 示例 1:
 
 输入: s = "egg", t = "add"
 输出: true
 示例 2:
 
 输入: s = "foo", t = "bar"
 输出: false
 示例 3:
 
 输入: s = "paper", t = "title"
 输出: true
 说明:
 你可以假设 s 和 t 具有相同的长度。
 */

class Solution205 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map = [Character: Character]()
        var set = Set<Character>()
        var idx = s.startIndex
        while idx != s.endIndex {
            let c1 = s[idx]
            let c2 = t[idx]
            if let mapped1 = map[c1] {
                if mapped1 != c2 {
                    return false

                }
            } else {
                map[c1] = c2
                set.insert(c2)
                if map.keys.count != set.count {
                    return false

                }
            }

            idx = s.index(after: idx)
        }

        return true
    }
}

extension String {
    subscript(_ i: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: i)
        return self[index]
    }
}
