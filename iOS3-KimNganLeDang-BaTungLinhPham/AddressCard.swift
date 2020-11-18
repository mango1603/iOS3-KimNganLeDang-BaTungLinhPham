//
//  AddressCard.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

func == (left: AddressCard, right: AddressCard) -> Bool {
return left.firstName == right.firstName
}


class AddressCard : Codable, Equatable {
    var firstName : String
    var lastName : String
    var street : String
    var houseNumber : String
    var postCode : String
    var city : String
    var hobbies = [String]()
    var friends = [AddressCard]()
    
    func add(hobby: String) {
        hobbies.append(hobby)
    }
    
    func remove(hobby: String) {
        if let i = hobbies.firstIndex(of: hobby) {
            hobbies.remove(at: i)
        }
        else {
            print("Hobby: \(hobby) doesn't exist")
        }
    }
    
    func add(friend: AddressCard) {
        friends.append(friend)
    }
    
    func remove(friend: AddressCard) {
        if let i = friends.firstIndex(of: friend) {
            friends.remove(at: i)
        }
        else {
            print("Friend: \(friend.firstName) doesn't exist")
        }
    }
    
    func addFirstName(firstName : String) {
        self.firstName = firstName
    }
    
    func addLastName(lastName : String) {
        self.lastName = lastName
    }
    
    func addStreet(street : String) {
        self.street = street
    }
    
    func addHouseNumber(houseNumber : String) {
        self.houseNumber = houseNumber
    }
    
    func addPostcode(postcode : String) {
        self.postCode = postcode
    }
    
    func addCity(city : String) {
        self.city = city
    }
    
    func printInfo() {
        print("| \(firstName) \(lastName)")
        print("| \(street) \(houseNumber)")
        print("| \(postCode) \(city)")
        print("| Hobbies:")
        for String in hobbies {
            print("|      \(String)")
        }
        print("| Friends:")
        for AddressCard in friends {
            print("|      \(AddressCard.firstName) \(AddressCard.lastName), \(AddressCard.postCode) \(AddressCard.city)")
        }
    }
}
