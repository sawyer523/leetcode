//
//  38.permutation.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/6/22.
//

import Foundation

func permutation(_ s: String) -> [String] {
    var list: Set<String> = []
    var visited = [Bool](repeating: false, count: s.count)
    
    func dfs(_ str: String) {
        if str.count == s.count {
            list.insert(str)
            return
        }
        
        for i in 0..<s.count {
            if visited[i] {
                continue
            }
            visited[i] = true
            dfs(str+String(s[i]))
            visited[i] = false
        }
    }
    dfs("")
    return Array(list)
}
