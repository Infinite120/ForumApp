//
//  UserService.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import Firebase

struct UserService{
    func fetchUser(){
        Firestore.firestore().collection("users")
        
    }
}


