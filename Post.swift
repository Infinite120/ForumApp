//
//  Post.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable{
    @DocumentID var id: String?
    let forum: String
    let title: String
    let body: String
    let timestamp: Timestamp
    let uid: String
    
    var user: User?
}
