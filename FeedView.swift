//
//  HomeView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI
import FirebaseFirestore

struct FeedView: View {
    @ObservedObject var feedModel = HomeViewModel()
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Button(action:{
                    print("Button")
                }, label: {
                    Text("Home")
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .padding(.horizontal, 7)
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                    
                })
                .background(Color.black)
                .frame(height: UIScreen.main.bounds.height / 20)
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGray5))
            .frame(height: UIScreen.main.bounds.height / 7)
            .frame(maxWidth: .infinity)
            
            ScrollView{
                LazyVStack{
                    ForEach(feedModel.posts) { post in
                        PostCardView(post: post)
                            .padding()
                    } //end ForEach
                } //end LazyVStack
            } //end ScrollView
            
            Spacer()
        } //end VStack
        
    } //end body
}

struct DropView: View{
    var body: some View{
        GeometryReader{_ in
            VStack{
                List(forums){ forum in
                    Text(forum.name)
                } //end List
                
                
            } //end VStack
            .background(Color(.systemGray5))
            .frame(width: UIScreen.main.bounds.width)
        } //end Geometry
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }//end  body
}//end DropView

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
