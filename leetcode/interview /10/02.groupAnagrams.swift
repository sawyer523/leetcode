//
//  02.groupAnagrams.swift
//  02.groupAnagrams
//
//  Created by Xiaonan Chen on 2021/7/18.
//

import Foundation

/*
 面试题 10.02. 变位词组
 难度
 中等

 41

 编写一种方法，对字符串数组进行排序，将所有变位词组合在一起。变位词是指字母相同，但排列不同的字符串。

 注意：本题相对原题稍作修改

 示例:

 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 说明：

 所有输入均为小写字母。
 不考虑答案输出的顺序。

 */

func groupAnagrams2(_ strs: [String]) -> [[String]] {
    var map: [String: [String]] = [:]
    for str in strs {
        map[String(str.sorted()), default: []].append(str)
    }
    var ans: [[String]] = []
    for (_, v) in map {
        ans.append(v)
    }
    return ans
}
