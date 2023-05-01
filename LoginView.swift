//
//  LoginView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/15/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    //email and password
    @State var email: String = ""
    @State var password: String = ""
    //visible variable for password(TexxtField vs SecureField)
    @State var visible = false

    @State var color = Color.black.opacity(0.7)
    
    @Binding var show: Bool
    //Environment Object so the values from the viewModel are shared between Error, Login, and SignUp Views
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing){
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
                            
                        Text("Log into your Account")
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
                        

                        HStack(spacing: 15){
                            VStack{
                                if visible{
                                    TextField("Enter Password", text: $password)
                                }
                                else{
                                    SecureField("Enter Password", text: $password)
                                }
                            }
                            
                            //make password visible or not with eye button
                            Button(action: {
                                self.visible.toggle()
                            }, label:{
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(color)
                            })//end Button
                            
                        }//end Password HStack
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color("maroon") : color, lineWidth: 2))
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                        .foregroundColor(.black)
                        
                        //button to login
                        Button(action: {
                            authModel.login(email: self.email, password: self.password)
                        }, label: {
                            Text("Log In")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        })//end Button
                        .background(Color("maroon"))
                        .cornerRadius(10)
                        .padding(.top, 10)
                        
                        Spacer()
                            .frame(height: 250)
                        
                        HStack(alignment: .center){
                            
                            Text("Don't have an account")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            
                            
                            Button(action: {
                                self.show.toggle()
                            }, label: {
                                Text("Sign Up")
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            })
       
                        }//end bottom HStack
                        .background(Rectangle().fill(.black))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    }//end VStack                    
                }//end GeometryReader
                
                
            }//end ZStack
            .ignoresSafeArea()
            
            //Pop up Error
            if authModel.alert{
                ErrorView()
            }
        }
        
    }//end body
}//end LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(show: .constant(true))
    }
}
