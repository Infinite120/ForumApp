//
//  Forum.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/30/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Forum: Identifiable, Decodable{
    @DocumentID var id: String?
    let name: String
    let Description: String
    let image: String
    var members: Int
}
