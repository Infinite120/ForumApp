//
//  PostViewModel.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import Foundation

class PostViewModel: ObservableObject{
    @Published var uploaded = false
    let service = PostService()
    
    func uploadPost(forum: String, title: String, body: String){
        service.uploadPost(forum: forum, title: title, body: body){ success in
            if success{
                self.uploaded = true
            } else {
                self.uploaded = false
            }
        }
    } //end func
}
