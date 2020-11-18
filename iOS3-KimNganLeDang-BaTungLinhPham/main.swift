//
//  main.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

func setOrder() {
    let order = read(withPrompt: "(E)ingabe, (S)uche, (L)iste oder (Q)uit?").lowercased()
    
    switch order{
    case "e":
        setNewAddressCard()
    case "s":
        searchAddressCard()
    case "l":
        listAddressCard()
    case "q":
        quit()
    default:
        print("Bitte geben Sie ein gültiger Befehl!!!")
    }
}

func setNewAddressCard(){
    
}

func searchAddressCard(){
    
}

func listAddressCard(){
    
}

func quit(){
    
}

func read(withPrompt: String) -> String {
    print(withPrompt,terminator: "")
    
    let input = readLine(strippingNewline: false)!
    
    return input
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
