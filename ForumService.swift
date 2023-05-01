//
//  ForumService.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/30/23.
//

import Firebase

struct ForumService{
    func fetchForums(completion: @escaping([Forum]) -> Void){
        Firestore.firestore().collection("forums").getDocuments { snapshot, err in
            guard let documents = snapshot?.documents else { return }
            
            let forums = documents.compactMap( { try? $0.data(as: Forum.self)})
            completion(forums)
        }
    }
    
    func joinForum(forum: String){
        if forum != ""{
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            
            let data = ["name": forum, "timestamp":  Timestamp(date: Date())] as [String : Any]
            
            let db = Firestore.firestore().collection("users").document(uid)
            try db.collection("joinedForums").document(forum).setData(data)
        }
    }
    
    
}
