//
//  05ControlFlow.swift
//  Swift3Tutorial
//
//  Created by daoquan on 2017/3/7.
//  Copyright © 2017年 daoquan. All rights reserved.
//

import Foundation


func forinLoopInfo() -> Void {
    /// 无参数循环
    var x = 1
    for _ in 1...5 {
        x += 1 // ++运算符被3.0移除
    }
}

func whilerepeatLoop() -> Void {
    let condition = 5
    var x = 0
    
    repeat {
        x += 1
    } while condition > x
    
}

func switchInfo() -> Void {
    /// switch不需要break语句
    /// 每个case必须包含至少一条语句
    let x = (1, 1)
    
    switch x {
        case (0, 0):
            print("x是原点")
        case (_, 0):
            print("x在x轴")
        case (0, _):
            print("x在y轴")
        case (-2...2, -2...2):
            print("x在(-2...2, -2...2)的区间里")
        default:
            print("不在规定区间内")
    }
    
    /// 多条件匹配
    // case value1, value2:
    
    /// 范围判断
    // case 1..<5:

    /// 值绑定（value bindings）
    let point = (2, 0)
    switch point {
    case (let x, 0):
        print("point在x轴上, x的坐标为\(x)")
    case (0, let y):
        print("point在y轴上, y的坐标为\(y)")
    default:
        print("point不在轴上")
    }
    
    /// where语句额外判断，限定值范围（过滤）
    let anotherPoint = (1, -1)
    switch anotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) 在x == y的线上")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) 在x == -y的线上")
    case let (x, y):
        print("(\(x), \(y)) 是个任意点")
    }
    
    /// 复合匹配（compound cases）
    let stillAnotherPoint = (9, 0)
    switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    default:
        print("Not on an axis")
    }
    // 匹配(_, 0)(0, _)xy轴上的数值，都绑定了distance，只要case匹配，就可以获取distance值
    
    
    /// 贯穿fallthrough
    // 让case语句匹配之后，可以继续向下匹配
    let fallthroughStr = "a"
    switch fallthroughStr {
    case "a":
        print("first matching")
        // 继续向下执行
        fallthrough
    default:
        print("fallthrough matching")
    }
    
    /// 标签 labeled statements
    // label name: while condition {
    //     statements
    // }
    
    // 在switch语句中，break掉外面的while循环，而不是break出switch语句
    let integerA = 6
    gameLoop: while integerA > 5 {
        switch integerA {
        case 1:
            break gameLoop
        case 2:
            continue gameLoop
        default:
            break
        }
    }
    
}

/// Early Exit (guard语句)
func guardTest() -> Void {
    var airPorts = ["YYZ": "Pearson", "DUB": "Dublin"]
    // 不符合判定 走else语句
    guard let name = airPorts["name"] else {
        print("I can't get name")
        return
    }
    // 代码可读性增强
    print("I get name: \(name)")
}

/// Checking API Availability
// availability condition
func checkAPIAvailable() -> Void {
    if #available(iOS 10, macOS 10.12, *) {
        // Use iSO 10 APIs on iOS, and use macOS 10.12 APIs on macOS
        // *表示适配其他所有平台（版本高于指定的标准的系统）
    }
    
//    if #available(platform name version, ..., *) {
//        // APIs 可用，语句将执行
//    } else {
//        // APIs 不可用，语句将不执行
//    }
    
}



