//
//  ProfileVIew.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/21/23.
//

import SwiftUI

struct ProfileView: View {
    @State var forum: Forum
    @ObservedObject var forumModel = ForumViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            HStack{
                Spacer()
                
                Button(action: {
                    forumModel.joinForum(forum: forum.name)
                }, label: {
                    Text("Join")
                        .font(.title2)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("maroon"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }) //end Button
                .padding(.horizontal, 25)
            }
            
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Text(forum.name)
                        .font(.title2).bold()
                } //end HStack
                
                Text(forum.Description)
                    .font(.subheadline)
                    .padding(.vertical)
                
                HStack{
                    Text(String(forum.members))
                        .font(.subheadline)
                        .bold()
                    
                    Text("Members")
                        .font(.subheadline)
                        .foregroundColor(Color("maroon"))
                }
                .padding(.vertical)
            } // end Vstack
            .padding(.horizontal, 25)
            

            
            Divider()
            Spacer()
        } //end VStack
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(forum: Forum(name: "Forum", Description: "This is the description", image: "", members: 0))
    }
}

extension ProfileView{
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color("maroon")
                .ignoresSafeArea()
            
            VStack {
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x:16, y:24)
            }
            
             
        } // end ZStack
        .frame(height: 96)
    }
}
