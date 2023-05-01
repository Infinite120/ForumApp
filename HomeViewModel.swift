//
//  HomeViewModel.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var posts = [Post]()
    let service = PostService()
    
    init(){
        fetchPost()
    }
    
    func fetchPost(){
        service.fetchPost { posts in
            self.posts = posts
            
            posts.forEach{ post in
                let uid = post.uid
            }
        }
    }
    
}
