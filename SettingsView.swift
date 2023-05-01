//
//  SettingsView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @State var show = false

    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            Text("Settings")
//            NavigationView{
//                NavigationLink(destination: ProfileVIew()){
//                    HStack{
//                        Circle()
//                            .frame(width: 50, height: 50)
//
//                        Text(username)
//                            .font(.title2)
//
//                    }
//                }
//            } //end NavView
            
            Button(action: {
                viewModel.signOut()
                
            }, label: {
                Text("Log Out")
                    .foregroundColor(.red)
                    .background(Color("FDarkGray"))
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width)
            }) //end Button
        } //end VStack
        
//        if !self.status {
//            LoginView(show: self.$show)
//        }
        
        //Profile
        //change username
        //change password
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
//        SettingsView(email: .constant(""), passsword: .constant(""), username: .constant(""))
    }
}
