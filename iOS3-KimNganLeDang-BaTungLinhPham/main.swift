//
//  main.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

var myAddressBook = AddressBook()
let path = "book.plist"
if let book = AddressBook.addressBook(fromFile: path) {
    myAddressBook = book
}

func main() {
    while let order = read(withPrompt: "(A)dd, (S)earch, (L)ist or (Q)uit?") as? String {
        switch order.lowercased() {
        case "a":
            addNewAddressCard()
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
}

func addNewAddressCard(){
    print("Adding a new contact: ")
    let firstName = read(withPrompt: "First Name: ") as! String
    let lastName = read(withPrompt: "Last Name: ") as! String
    let street = read(withPrompt: "Street: ") as! String
    let postCode = read(withPrompt: "Post Code: ") as! Int
    let city = read(withPrompt: "City: ")as! String
    var hobbies: [String] = []
    var hobby = ""
    var insertHobby = true
    while insertHobby {
        hobby = read(withPrompt: "Hobby: (Cancel with (Q)) ") as! String
        if !hobbies.contains(hobby) && hobby.lowercased() != "q"{
            hobbies.append(hobby)
        }
        else {insertHobby = false}
    }
    
    // create the new contact card
    let newContact = AddressCard(firstName: firstName, lastName:lastName, street:street, postCode: postCode, city:city, hobbies: hobbies, friends: [])
    // add contact card to  address book
    myAddressBook.add(card: newContact)
}

func searchAddressCard(){
    let name = read(withPrompt: "Search Last Name: ") as! String
    
    if let card = myAddressBook.searchByName(searchName: name){
        card.printInfo()
        while let order = read(withPrompt: "(F)riend adding, (D)elete, (R)eturn ") as? String{
            switch order.lowercased(){
            case "f":
                if let friendName = read(withPrompt: "Friend's Last Name: ") as? String {
                    if myAddressBook.searchByName(searchName: friendName) != nil{
                        let friend = myAddressBook.searchByName(searchName: friendName)!
                        if friend.lastName == friendName {
                            if card.friends.contains(friend) { // check duplicate
                                print("'\(card.firstName) \(card.lastName)' is already friend with'\(friend.firstName) \(friend.lastName)'.")
                            }
                            else {
                                card.add(friend: friend)
                                friend.add(friend: card) // add friend on both side 
                                print("'\(friend.firstName) \(friend.lastName)' is added.")
                            }
                        }
                    }
                    else {
                        print("Friend not found!")
                        break
                    }
                }
                
            case "d" :
                myAddressBook.remove(card: card)
                print("Contact is deleted!")
                
            case "r" :
                return
                
            default:
                print("Please enter a valid command!")
            }
        }
    }
    else { // could not find any contact
        print("Contact not found!")
    }
}

/* List all address cards in the address book */
func listAddressCard(){
    if myAddressBook.addressCards.isEmpty{
        print("+--------------------------------------")
    }
    myAddressBook.sortByName()
    for contact in myAddressBook.addressCards{
        contact.printInfo()
    }
}

/* Quit Program */
func quit(){
    myAddressBook.save(toFile: path)
    exit(0)
}

/* Read the console input */
func read(withPrompt: String) -> Any? {
    print(withPrompt,terminator: "")
    
    if let input = readLine() {
        if let postcode = Int(input) {
            return postcode
        }
        return input
    }
    return nil
}

/* Test print */
//func printTest () {
//    let name = read(withPrompt: "Input your name: ")
//    let age = read(withPrompt: "Input your age: ")
//    print("Name: ", name)
//    print("Age: ", age)
//}
//
//printTest()

/* Help function to create contact address for testing*/
func helpFunction(){
    
    let person1 = AddressCard(firstName: "Kim Ngan", lastName: "Le Dang", street: "Goethestrasse 38", postCode: 12345, city:"Berlin", hobbies: ["Cook", "Photography"], friends: [])
    let person2 = AddressCard(firstName: "Tung Linh", lastName: "Pham Ba", street: "Storkowerstrasse 10", postCode: 12345, city:"Berlin", hobbies: ["Code", "Read"], friends: [])
    let person3 = AddressCard(firstName: "Valentin", lastName: "Boehmer", street: "Emserstrasse 10", postCode: 12345, city:"Berlin", hobbies: ["Swim", "Jogging"], friends: [])
    
    myAddressBook.add(card: person1)
    myAddressBook.add(card: person2)
    myAddressBook.add(card: person3)
}

//helpFunction()

main()
