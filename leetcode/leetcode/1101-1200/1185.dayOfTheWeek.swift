//
//  1185.dayOfTheWeek.swift
//  leetcode
//
//  Created by Xiaonan Chen on 2022/1/3.
//

import Foundation

/*
 1185. 一周中的第几天
 难度
 简单
 
 75
 
 
 
 
 
 给你一个日期，请你设计一个算法来判断它是对应一周中的哪一天。
 
 输入为三个整数：day、month 和 year，分别表示日、月、年。
 
 您返回的结果必须是这几个值中的一个 {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}。
 
 
 
 示例 1：
 
 输入：day = 31, month = 8, year = 2019
 输出："Saturday"
 示例 2：
 
 输入：day = 18, month = 7, year = 1999
 输出："Sunday"
 示例 3：
 
 输入：day = 15, month = 8, year = 1993
 输出："Sunday"
 
 
 提示：
 
 给出的日期一定是在 1971 到 2100 年之间的有效日期。
 */

func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
    let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
    var days = 365 * (year - 1971) + (year - 1969) / 4
    
    for d in monthDays[0..<month-1] {
        days += d
    }
    
    if 3 <= month && (year % 400 == 0 || year % 4 == 0 && year % 100 != 0) {
        days += 1
    }
    
    days += day
        // 1970 年 12 月 31 日是星期四
    return week[(days + 3) % 7]
}
