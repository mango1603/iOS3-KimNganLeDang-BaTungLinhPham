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
    var running = true
    while running {
        let command = getMainCommand().lowercased()
        
        switch command {
        case "a":
            addNewAddressCard()
        case "s":
            searchAddressCard()
        case "l":
            listAddressCard()
        case "q":
            myAddressBook.save(toFile: path)
            running = false
        default:
            print("Please enter a valid command! ")
        }
    }
}

func getMainCommand() -> String {
    return read(withPrompt: "(A)dd, (S)earch, (L)ist or (Q)uit? ")
}

func isStringAnInt(string: String) -> Bool {
    return Int(string) != nil
}

func addNewAddressCard(){
    print("Adding a new contact: ")
    
    let firstName = read(withPrompt: "First Name: ")
    
    let lastName = read(withPrompt: "Last Name: ")
    
    let street = read(withPrompt: "Street: ")
    
    var postCode = Int(read(withPrompt: "Post Code: ")) ?? -1
    while postCode == -1 {
        postCode = Int(read(withPrompt: "Invalid Post Code, please enter it again: ")) ?? -1
    }
    
    let city = read(withPrompt: "City: ")
    
    var hobbies: [String] = []
    var insertHobby = true
    while insertHobby {
        let hobby = read(withPrompt: "Hobby: (Cancel with (Q)) ")
        if hobby.lowercased() == "q"{
            insertHobby = false
        }
        else {
            hobbies.append(hobby)
        }
    }
    
    // create the new contact card
    let newContact = AddressCard(firstName: firstName, lastName:lastName, street:street, postCode: postCode, city:city, hobbies: hobbies, friends: [])
    // add contact card to  address book
    myAddressBook.add(card: newContact)
}

func getSearchCommand() -> String {
    return read(withPrompt: "(F)riend adding, (D)elete, (R)eturn ")
}

func addFriend(user : AddressCard) {
    let friendName = read(withPrompt: "Friend's Last Name: ")
    
    if let friend = myAddressBook.searchByName(searchName: friendName) {
        if friend.lastName == friendName {
            if user.friends.contains(friend) { // check duplicate
                print("'\(user.firstName) \(user.lastName)' is already friend with'\(friend.firstName) \(friend.lastName)'.")
            }
            else {
                user.add(friend: friend)
                friend.add(friend: user) // add friend on both side
                print("'\(friend.firstName) \(friend.lastName)' is added.")
            }
        }
    } else {
        print("Friend not found!")
    }
}


func searchAddressCard(){
    if let card = myAddressBook.searchByName(searchName: read(withPrompt: "Search Last Name: ")) {
        card.printInfo()
        var running = true
        while running {
            let command = getSearchCommand().lowercased()
            
            switch command {
            case "f":
                addFriend(user: card)
            case "d" :
                myAddressBook.remove(card: card)
                print("Contact is deleted!")
                running = false
            case "r" :
                running = false
            default:
                print("Please enter a valid command!")
            }
        }
    } else {
        print("Contact not found!")
    }
}

/* List all address cards in the address book */
func listAddressCard(){
    if myAddressBook.addressCards.isEmpty{
        print("Current Address Book is empty")
    } else {
        print("+--------------------------------------")
        myAddressBook.sortByName()
        for contact in myAddressBook.addressCards{
            contact.printInfo()
        }
    }
}

/* Read the console input */
func read(withPrompt: String) -> String {
    print(withPrompt,terminator: "")
    return readLine() ?? "invalid input"
}

main()
