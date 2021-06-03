//
//  839.numSimilarGroups.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/1/31.
//

import Foundation

/*
 839. 相似字符串组
 难度
 困难

 82





 如果交换字符串 X 中的两个不同位置的字母，使得它和字符串 Y 相等，那么称 X 和 Y 两个字符串相似。如果这两个字符串本身是相等的，那它们也是相似的。

 例如，"tars" 和 "rats" 是相似的 (交换 0 与 2 的位置)； "rats" 和 "arts" 也是相似的，但是 "star" 不与 "tars"，"rats"，或 "arts" 相似。

 总之，它们通过相似性形成了两个关联组：{"tars", "rats", "arts"} 和 {"star"}。注意，"tars" 和 "arts" 是在同一组中，即使它们并不相似。形式上，对每个组而言，要确定一个单词在组中，只需要这个词和该组中至少一个单词相似。

 给你一个字符串列表 strs。列表中的每个字符串都是 strs 中其它所有字符串的一个字母异位词。请问 strs 中有多少个相似字符串组？

  

 示例 1：

 输入：strs = ["tars","rats","arts","star"]
 输出：2
 示例 2：

 输入：strs = ["omv","ovm"]
 输出：1
  

 提示：

 1 <= strs.length <= 100
 1 <= strs[i].length <= 1000
 sum(strs[i].length) <= 2 * 104
 strs[i] 只包含小写字母。
 strs 中的所有单词都具有相同的长度，且是彼此的字母异位词。
  

 备注：

       字母异位词（anagram），一种把某个字符串的字母的位置（顺序）加以改换所形成的新词。

 */

func numSimilarGroups(_ strs: [String]) -> Int {
    let n = strs.count
    var parents = [Int](0..<n)
    var size = [Int](repeating: 1, count: n)
    var setCount = n

    func find(_ x: Int) -> Int {
        if parents[x] != x {
            parents[x] = find(parents[x])
        }
        return parents[x]
    }

    func union(_ x: Int, _ y: Int) {
        var fx = find(x)
        var fy = find(y)
        if fx == fy {
            return
        }

        if size[fx] < size[fy] {
            (fx, fy) = (fy, fx)
        }

        size[fx] += size[fy]
        parents[fy] = fx
        setCount -= 1
    }

    func inSameSet(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }

    func isSimilar(_ s: String, _ t: String) -> Bool {
        var diff = 0
        let arrT = Array(t)
        for (i, v) in s.enumerated() {
            if v != arrT[i] {
                diff += 1
                if diff > 2 {
                    return false
                }
            }
        }
        return true
    }

    for (i, v1) in strs.enumerated() {
        for j in i+1..<n {
            if !inSameSet(i, j) &&
                isSimilar(v1, strs[j]) {
                union(i, j)
            }
        }
    }

    return setCount
}
