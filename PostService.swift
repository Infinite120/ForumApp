//
//  PostService.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import Firebase

struct PostService{
    func uploadPost(forum: String, title: String, body: String, completion: @escaping(Bool) -> Void){
        
        if forum != "" && title != "" && body != ""{
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let data = ["uid": uid,
                        "forum": forum,
                        "title": title,
                        "body": body,
                        "timestamp": Timestamp(date: Date())] as [String : Any]
            
            Firestore.firestore().collection("posts").document()
                .setData(data){ error in
                    if let err = error{
                        completion(false)
                        return
                    }
                    completion(true)
                }
        } else {
            completion(false)
        }
    } //end func
    
    func fetchPost(completion: @escaping([Post]) -> Void){
        Firestore.firestore().collection("posts").getDocuments { snapshot, err in
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.compactMap( { try? $0.data(as: Post.self)})
            completion(posts)
        }
    } //end func
    
}
