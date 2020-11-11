//
//  AddressBook.swift
//  iOS3-KimNganLeDang-BaTungLinhPham
//
//  Created by Tùng Linh Phạm Bá on 11.11.20.
//

import Foundation

class AddressBook : Codable {
    var addressCards = [AddressCard]()
    
    func add (card : AddressCard) {
        addressCards.append(card)
    }
    
    func remove (card : AddressCard){
        if let i = addressCards.firstIndex(of: card) {
            addressCards.remove(at: i)
        }
        else {
            print("Freund: \(card.vorname) ist nicht existiert")
        }
    }
}
