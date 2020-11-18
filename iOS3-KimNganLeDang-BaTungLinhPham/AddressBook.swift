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
            print("Friend: \(card.firstName) doesn't exist")
        }
        //TODO: delete friends reference in friends list
/* 
                for friend in addressCards {
                    if let i = friend.friends.firstIndex(of: card){
                        friend.friends.remove(at: i)
                    }
                }
 */

    }
    
    func sortByName () {
        addressCards.sort(by: { (s1: AddressCard, s2: AddressCard) -> Bool in
            return s1.lastName < s2.lastName
            })
        // shorter code:  02-Swift-T2 Folie 44. Does it work??
        //addressCards.sort(by: { $0.lastName < $1.lastName } )
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
    
    func save (toFile path : String) { // 05-Foundation-Archivierung Folie 12
        // file for saving data
        let url = URL(fileURLWithPath: path)
        // encode and save
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(self) {
        try? data.write(to: url) }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook? { //05-Foundation-Archivierung Folie 13
        let url = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: url) {
                let decoder = PropertyListDecoder()
                if let addressBook = try? decoder.decode(AddressBook.self, from: data) {
                    return addressBook
                   }
               }
            return nil
    }
}
