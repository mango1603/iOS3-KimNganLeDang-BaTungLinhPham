//
//  main.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

//func readOrder() -> String{
//    let order = readLine()!
//    return order
//}
//

func read(withPrompt: String) -> Any? {
    print(withPrompt,terminator: "")
    
    if let input = readLine() {
        if let num = Int(input) {//if input is integer
            return num
        }
        return input
    }
    return nil
}

///* Test print */
//func printTest () {
//    let name = read(withPrompt: "Input your name: ")
//    let age = read(withPrompt: "Input your age: ")
//    print("Name: ", name!)
//    print("Age: ", age!)
//}
//
//printTest()
