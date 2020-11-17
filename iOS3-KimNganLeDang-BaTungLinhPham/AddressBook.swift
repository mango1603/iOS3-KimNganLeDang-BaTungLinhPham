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
        sortByName()
    }
    
    func remove (card : AddressCard){
        if let i = addressCards.firstIndex(of: card) {
            addressCards.remove(at: i)
        }
        else {
            print("Freund: \(card.firstName) ist nicht existiert")
        }
    }
    
    func sortByName () {
        addressCards.sort(by: { (s1: AddressCard, s2: AddressCard) -> Bool in
            return s1.lastName < s2.lastName
            })
    }
    
    func searchByName (searchName : String) -> [AddressCard] {
        var matchAddressCards = [AddressCard]()
        for AddressCard in addressCards {
            if AddressCard.lastName.lowercased() == searchName.lowercased() {
                matchAddressCards.append(AddressCard)
            }
        }
        return matchAddressCards
    }
    
    func save (toFile path : String) {
        
    }
    
    class func addressBook(fromFile path: String) -> AddressBook? {
        
    }
}
