//
//  677.mapSum.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2021/11/14.
//

import Foundation

/*
 677. 键值映射
 难度
 中等

 143

 实现一个 MapSum 类，支持两个方法，insert 和 sum：

 MapSum() 初始化 MapSum 对象
 void insert(String key, int val) 插入 key-val 键值对，字符串表示键 key ，整数表示值 val 。如果键 key 已经存在，那么原来的键值对将被替代成新的键值对。
 int sum(string prefix) 返回所有以该前缀 prefix 开头的键 key 的值的总和。

 示例：

 输入：
 ["MapSum", "insert", "sum", "insert", "sum"]
 [[], ["apple", 3], ["ap"], ["app", 2], ["ap"]]
 输出：
 [null, null, 3, null, 5]

 解释：
 MapSum mapSum = new MapSum();
 mapSum.insert("apple", 3);
 mapSum.sum("ap");           // return 3 (apple = 3)
 mapSum.insert("app", 2);
 mapSum.sum("ap");           // return 5 (apple + app = 3 + 2 = 5)

 提示：

 1 <= key.length, prefix.length <= 50
 key 和 prefix 仅由小写英文字母组成
 1 <= val <= 1000
 最多调用 50 次 insert 和 sum
 */

class MapSum {
    private class Trie {
        var val: Int
        var children: [Character: Trie]
        init() {
            val = 0
            children = [:]
        }
    }

    private var root: Trie
    private var cnt: [String: Int] = [:]

    init() {
        root = Trie()
    }

    func insert(_ key: String, _ val: Int) {
        var delta = val
        if let val = cnt[key] {
            delta -= val
        }
        var ws = root
        for char in key {
            var tmp = ws.children[char]
            if tmp == nil {
                tmp = Trie()
            }
            tmp!.val += delta

            ws.children[char] = tmp
            ws = tmp!
        }
        cnt[key] = val
    }

    func sum(_ prefix: String) -> Int {
        var ws = root
        for char in prefix {
            guard let w = ws.children[char] else {
                return 0
            }
            ws = w
        }
        return ws.val
    }
}
