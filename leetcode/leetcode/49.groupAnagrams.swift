//
//  groupAnagrams.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2020/12/14.
//

import Foundation

/*
 49. 字母异位词分组
 难度
 中等

 602

 收藏

 分享
 切换为英文
 接收动态
 反馈
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

 示例:

 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
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

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict: [Float64: [String]] = [:]
    let d: [Character: Float64] = ["a":2,"b":3,"c":5,"d":7,"e":11,"f":13,"g":17,"h":19,"i":23,"j":29,"k":31,"l":37,"m":41,"n":43,"o":47,"p":53,"q":59,"r":61,"s":67,"t":71,"u":73,"v":79,"w":83,"x":89,"y":97,"z":101]
    var a: [String]
    var key: Float64
    for v in strs {
        key = 1
        for i in v {
            key *= d[i]!
        }
        a = dict[key, default: [String]()]
        a.append(v)
        dict[key] = a
    }
    
    var res: [[String]] = []
    for (_, v) in dict {
        res.append(v)
    }
    
    return res
    }
