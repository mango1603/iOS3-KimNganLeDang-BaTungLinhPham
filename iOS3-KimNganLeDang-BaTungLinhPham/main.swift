//
//  main.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation


// Read the address book when the program starts
    var myAddressBook = AddressBook()
    let path = "book.plist"
        if let book = AddressBook.addressBook(fromFile: path) {
            myAddressBook = book
        }

func setOrder() {
    // Did not work?!
    let order = read(withPrompt: "(A)dd, (S)earch, (L)ist or (Q)uit?")
    
    switch order.lowercased() {
    case "a":
        enterNewAddressCard()
    case "s":
        searchAddressCard()
    case "l":
        listAddressCard()
    case "q":
        quit()
    default:
        print("Please enter a valid command! ")
    }
}

func enterNewAddressCard(){
    //TODO: TEST!!
    print("Add a new contact: ")
    let firstName = read(withPrompt: "First Name: ")
    let lastName = read(withPrompt: "Last Name: ")
    let street = read(withPrompt: "Street: ")
    let houseNumber = read(withPrompt: "House Number: ")
    let postCode = read(withPrompt: "Post Code: ")
    let city = read(withPrompt: "City: ")
    var hobbies: [String] = []
        var hobby = ""
        
        while hobby.lowercased() != "q"{
            hobby = read(withPrompt: "Hobby: (Abbruch mit (Q)) ")
            if hobby != "Q" && hobby != "q" {
                hobbies.append(hobby)
            }
        }
    // create the new contact card
    let newContact = AddressCard(firstName: firstName, lastName:lastName, street:street, houseNumber: houseNumber, postCode: postCode, city:city, hobbies: hobbies, friends: [])
    // add contact card to  address book
    myAddressBook.add(card: newContact)
}

func searchAddressCard(){
    //TODO : finish searching
    let searchName = read(withPrompt: "Search Last Name: ")
    
}

func listAddressCard(){
    //TODO: TEST!!
    if myAddressBook.addressCards.isEmpty{
        print("+--------------------------------------")
    }
    myAddressBook.sortByName()
    for contact in myAddressBook.addressCards{
        contact.printInfo()
    }
}

func quit(){
    myAddressBook.save(toFile: path)
    //TODO: how to exit??
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
//    print("Name: ", name)
//    print("Age: ", age)
//}
//
//printTest()

setOrder()
