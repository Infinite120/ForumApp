//
//  User.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable{
    @DocumentID var id: String?
    var username: String
    var profileImage: String
    var email: String
    
    var joinedForums: Array<String>
}
