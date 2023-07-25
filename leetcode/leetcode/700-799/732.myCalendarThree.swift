//
//  732.myCalendarThree.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/6/8.
//

import Foundation

/*
 732. 我的日程安排表 III
 难度
 困难

 164

 当 k 个日程安排有一些时间上的交叉时（例如 k 个日程安排都在同一时间内），就会产生 k 次预订。

 给你一些日程安排 [start, end) ，请你在每个日程安排添加后，返回一个整数 k ，表示所有先前日程安排会产生的最大 k 次预订。

 实现一个 MyCalendarThree 类来存放你的日程安排，你可以一直添加新的日程安排。

 MyCalendarThree() 初始化对象。
 int book(int start, int end) 返回一个整数 k ，表示日历中存在的 k 次预订的最大值。

 示例：

 输入：
 ["MyCalendarThree", "book", "book", "book", "book", "book", "book"]
 [[], [10, 20], [50, 60], [10, 40], [5, 15], [5, 10], [25, 55]]
 输出：
 [null, 1, 1, 2, 3, 3, 3]

 解释：
 MyCalendarThree myCalendarThree = new MyCalendarThree();
 myCalendarThree.book(10, 20); // 返回 1 ，第一个日程安排可以预订并且不存在相交，所以最大 k 次预订是 1 次预订。
 myCalendarThree.book(50, 60); // 返回 1 ，第二个日程安排可以预订并且不存在相交，所以最大 k 次预订是 1 次预订。
 myCalendarThree.book(10, 40); // 返回 2 ，第三个日程安排 [10, 40) 与第一个日程安排相交，所以最大 k 次预订是 2 次预订。
 myCalendarThree.book(5, 15); // 返回 3 ，剩下的日程安排的最大 k 次预订是 3 次预订。
 myCalendarThree.book(5, 10); // 返回 3
 myCalendarThree.book(25, 55); // 返回 3

 提示：

 0 <= start < end <= 10^9
 每个测试用例，调用 book 函数最多不超过 400次
 */

class MyCalendarThree {
    private var myCaledar: [Int: (Int, Int)]

    init() {
        myCaledar = [:]
    }

    private func update(_ start: Int, _ end: Int, _ l: Int, _ r: Int, _ idx: Int) {
        if r < start || end < l {
            return
        }

        if start <= l,
           r <= end {
            var p = myCaledar[idx, default: (0, 0)]
            p.0 += 1
            p.1 += 1
            myCaledar[idx] = p
        } else {
            let mid = (l + r) >> 1
            update(start, end, l, mid, idx * 2)
            update(start, end, mid + 1, r, idx * 2 + 1)
            var p = myCaledar[idx, default: (0, 0)]
            p.0 = p.1 + max(myCaledar[idx * 2, default: (0, 0)].0, myCaledar[idx * 2 + 1, default: (0, 0)].0)
            myCaledar[idx] = p
        }
    }

    func book(_ start: Int, _ end: Int) -> Int {
        update(start, end - 1, 0, Int(1e9), 1)
        return myCaledar[1, default: (0, 0)].0
    }
}
