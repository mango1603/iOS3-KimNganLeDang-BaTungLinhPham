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
    var houseNumber : Int
    var postCode : Int
    var city : Int
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
            print("Hobby: \(hobby) ist nicht existiert")
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
            print("Freund: \(friend.firstName) ist nicht existiert")
        }
    }
}
