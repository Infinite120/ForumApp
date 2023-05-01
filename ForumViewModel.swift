//
//  ForumViewModel.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/30/23.
//

import Foundation

class ForumViewModel: ObservableObject{
    @Published var forums = [Forum]()
    @Published var joined = false
    let service = ForumService()
    
    init(){
        fetchForums()
    }
    
    func fetchForums(){
        service.fetchForums { forums in
            self.forums = forums
        }
    }
    
    func joinForum(forum: String){
        service.joinForum(forum: forum)
    }
}
