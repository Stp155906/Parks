//
//  ParksResponse.swift
//  Parks
//
//  Created by Shantalia Z on 3/29/24.
//

import Foundation
import SwiftUI

struct ParksResponse: Codable{
    let data: [Park]
}

struct Park: Codable, Identifiable, Hashable {
    
    let id : String
    let fullName: String
    let description: String
    let latitude: String
    let longitude: String
    let images: [ParkImage]
    let name: String
    
    //added
    func hash(into hasher: inout Hasher) { // <-- Add required hash function
            hasher.combine(id)
        }
}
struct ParkImage: Codable, Identifiable, Equatable{
    let title: String
    let caption : String
    let url: String
    // added for identifiable protocol
    var id: String { // <-- Add id property to conform to Identifiable
            return url // <-- Use the url string as t he id since it will be unique for a given image
        }
}
