//
//  1202.smallesStringWithSwaps.swift
//  debugTest
//
//  Created by Xiaonan Chen on 2021/1/11.
//

import Foundation

/*
 1202. 交换字符串中的元素
 难度
 中等

 150





 给你一个字符串 s，以及该字符串中的一些「索引对」数组 pairs，其中 pairs[i] = [a, b] 表示字符串中的两个索引（编号从 0 开始）。

 你可以 任意多次交换 在 pairs 中任意一对索引处的字符。

 返回在经过若干次交换后，s 可以变成的按字典序最小的字符串。

  

 示例 1:

 输入：s = "dcab", pairs = [[0,3],[1,2]]
 输出："bacd"
 解释：
 交换 s[0] 和 s[3], s = "bcad"
 交换 s[1] 和 s[2], s = "bacd"
 示例 2：

 输入：s = "dcab", pairs = [[0,3],[1,2],[0,2]]
 输出："abcd"
 解释：
 交换 s[0] 和 s[3], s = "bcad"
 交换 s[0] 和 s[2], s = "acbd"
 交换 s[1] 和 s[2], s = "abcd"
 示例 3：

 输入：s = "cba", pairs = [[0,1],[1,2]]
 输出："abc"
 解释：
 交换 s[0] 和 s[1], s = "bca"
 交换 s[1] 和 s[2], s = "bac"
 交换 s[0] 和 s[1], s = "abc"
  

 提示：

 1 <= s.length <= 10^5
 0 <= pairs.length <= 10^5
 0 <= pairs[i][0], pairs[i][1] < s.length
 s 中只含有小写英文字母
 */

func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let n = s.count
        var fa: [Int] = [Int](repeating: 0, count: n)
        var rand = [Int](repeating: 1, count: n)
        for i in 0..<n {
            fa[i] = i
        }
        func find(_ x: Int) -> Int {
            if fa[x] != x {
                fa[x] = find(fa[x])
            }
            return fa[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            var (fx, fy) = (find(x), find(y))
            if fx == fy {
                return
            }
            
            if rand[fx] < rand[fy] {
                (fx, fy) = (fy, fx)
            }
            rand[fx] += rand[fy]
            fa[fy] = fx
        }
        
        for p in pairs {
            union(p[0], p[1])
        }
        
        let sArr = Array(s)
        var groups = [[Character]](repeating: [], count: n)
    for (i, v) in groups.enumerated() {
            let f = find(i)
        if v.isEmpty {
            groups[f] = [s[i]]
        } else {
            print(groups[f], sArr[i])
//            var t = groups[f] as [Character]
//            groups[f] = t.append(sArr[i])
        }
        }
        for (i, v) in groups.enumerated() {
            groups[i] = v.sorted()
        }
        
        var ans = [Character](repeating: " ", count: n)
        for i in 0..<ans.count {
//            let f = find(i)
//            ans[i] = groups[f][0]
//            groups[f] = Array(groups[f].dropFirst())
        }
        
        return String(ans)
}
