//
//  ForumView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/13/23.
//

import SwiftUI

struct ForumView: View {
    var forum = forums[0]
    @StateObject var forumData = ForumViewMode()
    @ObservedObject var forumModel = ForumViewModel()

    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                GeometryReader{ reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    
                    if -offset >= 0{
                        DispatchQueue.main.async {
                            self.forumData.offset = offset
                        }
                    }
                    return AnyView(
                        Image(forum.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 200 + (offset > 0 ? offset: 0))
                            .offset(y: (offset > 0 ? -offset: 0))
                    )
                    
                    
                    
                }
                .frame(height: 200)
                
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
                })

                Text(forum.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Divider()
                    .padding(.top)
                
                ForEach(forums){ forum in
                    CardView(forum: forum)
                }//end forEach
                
                Divider()
                    .padding(.top)
            })//end LazyVStack
        }//end ScrollView
        
    }//end body
}//end View

struct HeaderView: View{
    var body: some View{
        
        HStack{
            Text("Header")
                .font(.title)
                .fontWeight((.bold))
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .frame(height: 100)
    }
}

struct CardView: View{
    var forum: forum
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10, content:{
                Text(forum.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(forum.description)
                    .font(.caption)
                    .lineLimit(3)
            })//end VStack
            
            Spacer(minLength: 10)
            Image(forum.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130, alignment: .center)
                .cornerRadius(20)
        }//end HStack
        .padding(10)
    }//end body
}// end CardView

class ForumViewMode: ObservableObject{
    @Published var offset: CGFloat = 0
    
    
}

struct ForumView_Previews: PreviewProvider {
    static var previews: some View {
        ForumView(forum: forums[0])
    }
}
