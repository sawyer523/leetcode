//
//  433.minMutation.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/5/7.
//

import Foundation

/*
 433. 最小基因变化
 难度
 中等

 128





 基因序列可以表示为一条由 8 个字符组成的字符串，其中每个字符都是 'A'、'C'、'G' 和 'T' 之一。

 假设我们需要调查从基因序列 start 变为 end 所发生的基因变化。一次基因变化就意味着这个基因序列中的一个字符发生了变化。

 例如，"AACCGGTT" --> "AACCGGTA" 就是一次基因变化。
 另有一个基因库 bank 记录了所有有效的基因变化，只有基因库中的基因才是有效的基因序列。

 给你两个基因序列 start 和 end ，以及一个基因库 bank ，请你找出并返回能够使 start 变化为 end 所需的最少变化次数。如果无法完成此基因变化，返回 -1 。

 注意：起始基因序列 start 默认是有效的，但是它并不一定会出现在基因库中。

  

 示例 1：

 输入：start = "AACCGGTT", end = "AACCGGTA", bank = ["AACCGGTA"]
 输出：1
 示例 2：

 输入：start = "AACCGGTT", end = "AAACGGTA", bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]
 输出：2
 示例 3：

 输入：start = "AAAAACCC", end = "AACCCCCC", bank = ["AAAACCCC","AAACCCCC","AACCCCCC"]
 输出：3
  

 提示：

 start.length == 8
 end.length == 8
 0 <= bank.length <= 10
 bank[i].length == 8
 start、end 和 bank[i] 仅由字符 ['A', 'C', 'G', 'T'] 组成
 */

func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
    if start == end {
        return 0
    }
    var mi = Int.max, cur = 0, st = Set<[Character]>()
    let sa = Array(start), ea = Array(end), baa = bank.map { Array($0) }
    
    func backTrace(_ sa: [Character]) {
        if sa == ea { mi = min(mi, cur); return }
        
        baa.filter { ba in
            !st.contains(ba) &&
            1 == (0..<8).reduce(0) { $0 + ((sa[$1] != ba[$1]) ? 1 : 0) }
        }.forEach { v in
            cur += 1; st.insert(v)
            backTrace(v)
            cur -= 1; st.remove(v)
        }
    }
    
    backTrace(sa)
    return mi == Int.max ? -1 : mi
}
