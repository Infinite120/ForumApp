//
//  PostCardView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/27/23.
//

import SwiftUI

struct PostCardView: View {
    let post: Post
    var body: some View {
        
        VStack(alignment: .leading){
            //post information
            HStack(alignment: .top, spacing: 12){
                //forum image
                Image(post.forum)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                //forum post was posted in
                Text(post.forum)
                    .font(.title2)
                    .padding(.horizontal, 8)
                
            } //end HStack
            
            //The username of the post but if not available, default to Anonymous
            Text(post.user?.username ?? "Anonymous")
                .font(.body)
            
            //title of the post
            Text(post.title)
                .font(.title3)
            
            //posts content
            Text(post.body)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
            
            Divider()
                .padding(.top, 15)
        } //end VStack
        
    } //end body
} //end View

//struct PostCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCardView()
//    }
//}
