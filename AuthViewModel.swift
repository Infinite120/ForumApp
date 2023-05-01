//
//  AuthViewModel.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject{
    //if user is in session
    @Published var userSession: FirebaseAuth.User?
    
    //for error and alerts
    @Published var error: String
    @Published var alert: Bool
    
    //gets current user session
    init(){
        self.userSession = Auth.auth().currentUser
        self.error = ""
        self.alert = false
    }
    
    //login with email and password
    func login(email: String, password: String){
        //email and password can not be empty
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email, password: password){ result, err in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                guard let user = result?.user else { return }
                self.userSession = user
            }
        } else{
            error = "Please fill all the contents"
            self.alert.toggle()
        }
    }
    
    func register(email: String, username: String, password: String, repassword: String){
        if email != "" && username != "" && password != "" && repassword != ""{
            if password == repassword{
                Auth.auth().createUser(withEmail: email, password: password){ result,
                    err in
                    if err != nil{
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    guard let user = result?.user else {return}
                    self.userSession = user
                    
                    //dictionary to store new users with ther username
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "uid": user.uid]
                    
                    //user data is stored in Firestore Database
                    Firestore.firestore().collection("users")
                        .document(user.uid)
                        .setData(data) { _ in

                        }
                }
            } else {
                self.error = "Password does not match"
                self.alert.toggle()
            }
        }
        else{
            self.error = "Please fill all the contents"
            self.alert.toggle()
        }
    }
    
    func signOut(){
        //usersession ended
        userSession = nil
        try! Auth.auth().signOut()
    }
}
