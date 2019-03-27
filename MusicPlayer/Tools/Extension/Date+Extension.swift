//
//  Date+Extension.swift
//  swift-BatteryBox
//
//  Created by 苏强 on 2018/10/19.
//  Copyright © 2018 苏强. All rights reserved.
//

import Foundation

extension Date {
    
    // 时间戳转日期
    public static func timeToDateString(timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue/1000
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
    }
    
    // 时间戳转日期 yyyy-MM-dd HH:mm:ss
    public static func timeToDateString2(timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue/1000
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
    }
    
    // 时间戳转日期 yyyy年MM月
    public static func timeToDateString3(timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue/1000
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy年MM月"
        let date = NSDate(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date as Date)
    }
    
    // 获取当前时间戳 
    public static func timeStamp() -> String {
        let date = NSDate()
        let timeInterval: TimeInterval = date.timeIntervalSince1970 * 1000
        let timeStamp = Int(timeInterval)
        return String(timeStamp)
    }
    
    // 时间转时间戳 今天是10-10 -> 2018-10-10 00:00:00。
    public static func stringToTimeStamp(stringTime:String)->String {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = dfmatter.date(from: stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970 * 1000
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
    
    // 时间转时间戳直接到第二天0晨 今天是10-10 -> 2018-10-11 00:00:00。 
    public static func stringToZeroTimeStamp(stringTime:String)->String {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd"
        let date = dfmatter.date(from: stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970 * 1000
        let dateSt:Int = Int(dateStamp + 24*60*60*1000)
        return String(dateSt)
    }
    
    // string转data
    public static func stringToData(stringTime:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringTime)
        return date!
    }
    
    // 今天日期
    public static func todayToDay() -> String {
        let todayDate = Date() //给定的时间
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let todayString = formatter.string(from: todayDate)
        return todayString
    }
    
    // 今天 00:00:00 的时间戳
    public static func todayToTimeStamp() -> String {
        let nowDate = Date() //给定的时间
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let currentTimeString = formatter.string(from: nowDate)
        let date = formatter.date(from: currentTimeString)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970 * 1000
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
    
    // 昨天日期
    public static func yestodayToDay() -> String {
        let date = Date() //当前时间
        let lastDay = Date(timeInterval: -24 * 60 * 60, since: date) //前一天
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let yestodayString = formatter.string(from: lastDay)
        return yestodayString
    }
    
    // 昨天 00:00:00 的时间戳
    public static func yestodayToTimeStamp() -> String {
        let toStamp = self.todayToTimeStamp()
        let yesStamp:Int = Int(toStamp)! - 24*60*60*1000
        return String(yesStamp)
    }
    
    // 本周日期（星期天）
    public static func weekToDay() -> String {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.yearForWeekOfYear, .weekOfYear]), from: date)
        let startOfWeek = calendar.date(from: components)!
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let weekString = formatter.string(from: startOfWeek)
        return weekString
    }
    
    // 本周开始日期（星期天）00:00:00 的时间戳
    public static func weekToTimeStamp() -> String {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.yearForWeekOfYear, .weekOfYear]), from: date)
        let startOfWeek = calendar.date(from: components)!
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let currentTimeString = formatter.string(from: startOfWeek)
        let thisWeekdate = formatter.date(from: currentTimeString)
        let dateStamp:TimeInterval = thisWeekdate!.timeIntervalSince1970 * 1000
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
    
    // 本月开始日期（1号)
    public static func monthToDay() -> String  {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        let startOfMonth = calendar.date(from: components)!
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let monthString = formatter.string(from: startOfMonth)
        return monthString
    }
    
    // 本月开始日期（1号）00:00:00 的时间戳
    public static func monthToTimeStamp() -> String  {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        let startOfMonth = calendar.date(from: components)!
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let currentTimeString = formatter.string(from: startOfMonth)
        let thisWeekdate = formatter.date(from: currentTimeString)
        let dateStamp:TimeInterval = thisWeekdate!.timeIntervalSince1970 * 1000
        let dateSt:Int = Int(dateStamp)
        return String(dateSt)
    }
    
    // 比较两个日期
    public static func compareDate(_ date01: String?, withDate date02: String?) -> Int {
        var i = 1
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        var dt1 = Date()
        var dt2 = Date()
        dt1 = formatter.date(from: date01!)!
        dt2 = formatter.date(from: date02!)!
        let result: ComparisonResult = dt1.compare(dt2)
        switch (result) {
            //date02比date01大
            case .orderedAscending: i = 1
            break
            //date02比date01小
            case .orderedDescending: i = -1
            break
            //date02=date01
            case .orderedSame: i = 0
            break
        }
        return i
    }
    
    //判断时间戳是否在今日
    public static func judgeDateIsToday(needJudgeDate: String) -> String {
        
        // 获取今日
        
        let todayDate = Date() //给定的时间
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        let todayString = formatter.string(from: todayDate)
        
        // 获取时间戳所对应的日期
        let timeSta:TimeInterval = Double(needJudgeDate)!/1000
        let date = Date.init(timeIntervalSince1970: timeSta)
        let dateString = formatter.string(from: date)
        
        if todayString == dateString {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:ss"
            return formatter.string(from: date)
        
        } else {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM月dd日"
            return formatter.string(from: date)
            
        }
    }
    
    
}
