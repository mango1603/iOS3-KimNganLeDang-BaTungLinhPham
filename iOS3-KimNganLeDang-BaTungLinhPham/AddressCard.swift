//
//  AddressCard.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

func == (left: AddressCard, right: AddressCard) -> Bool {
return left.vorname == right.vorname
}


class AddressCard : Codable, Equatable {
    var vorname : String
    var nachname : String
    var straße : String
    var hausnummer : Int
    var postleitzahl : Int
    var ort : Int
    var hobbys = [String]()
    var freunde = [AddressCard]()
    
    func add(hobby: String) {
        hobbys.append(hobby)
    }
    
    func remove(hobby: String) {
        if let i = hobbys.firstIndex(of: hobby) {
            hobbys.remove(at: i)
        }
        else {
            print("Hobby: \(hobby) ist nicht existiert")
        }
    }
    
    func add(friend: AddressCard) {
        freunde.append(friend)
    }
    
    func remove(friend: AddressCard) {
        if let i = freunde.firstIndex(of: friend) {
            freunde.remove(at: i)
        }
        else {
            print("Freund: \(friend.vorname) ist nicht existiert")
        }
    }
}
