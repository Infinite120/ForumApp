//
//  SignUpView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/16/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

struct SignUpView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    
    @State var color = Color.black.opacity(0.7)
    
    @State var visible = false
    @State var revisible = false
    
    @Binding var show: Bool
    //Environment Object so the values from the viewModel are shared between Error, Login, and SignUp Views
    @EnvironmentObject var authModel: AuthViewModel
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading){
                GeometryReader{_ in
                    VStack(alignment: .center){
                        Spacer()
                            .frame(height: 100)
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        Text("Sign Up")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                            .padding(.top, 35)
                        
                        TextField("Enter Email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("maroon") : self.color, lineWidth: 2))
                            .foregroundColor(.black)
                            .padding(.horizontal, 25)
                        
                        TextField("Enter Username", text: self.$username)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.username != "" ? Color("maroon") : self.color, lineWidth: 2))
                            .foregroundColor(.black)
                            .padding(.horizontal, 25)
                        
                        HStack(spacing: 15){
                            VStack{
                                if visible{
                                    TextField("Enter Password", text: $password)
                                }
                                else{
                                    SecureField("Enter Password", text: $password)
                                }
                            }
                            
                            Button(action: {
                                self.visible.toggle()
                            }, label:{
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            })//end Button
                            
                        }//end Password HStack
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("maroon") : color, lineWidth: 2))
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                        .foregroundColor(.black)
                        
                        HStack(spacing: 15){
                            VStack{
                                if self.revisible{
                                    TextField("Re-Enter Password", text: $repassword)
                                }
                                else{
                                    SecureField("Re-Enter Password", text: $repassword)
                                }
                            }
                            
                            Button(action: {
                                self.revisible.toggle()
                            }, label:{
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            })//end Button
                            
                        }//end RePassword HStack
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("maroon") : color, lineWidth: 2))
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                        .foregroundColor(.black)
                        
                        
                        Button(action: {
                            authModel.register(email: email, username: username, password: password, repassword: repassword)
                        }, label: {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        })//end Button
                        .background(Color("maroon"))
                        .cornerRadius(10)
                        .padding(.top, 10)
                        
                        Spacer()
                            .frame(height: 250)
                    }//end VStack
                    
                }//end GeometryReader
                
                Button(action: {
                    self.show.toggle()
                }){
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("maroon"))
                }
                .padding()
                
            }//end ZStack 2
            
            if authModel.alert{
                ErrorView()
                
            }
            
        }//end Zstack 1
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(show: .constant(true))
    }
}
