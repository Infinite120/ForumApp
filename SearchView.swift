//
//  SearchView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    @State var url = URL(string: "")
    @ObservedObject var forumModel = ForumViewModel()
    
    var body: some View {
        VStack{
//         HStack{
//                SearchBar(text: $search)
//                    .padding(.top, 30)
//            }
//            .padding()
//            .background(Color(.systemGray5))
//            .frame(height: UIScreen.main.bounds.height / 7)
//            .frame(maxWidth: .infinity)
            
            NavigationView {
                List(forumModel.forums.filter({search.isEmpty ? true: $0.name.contains(search) })) {
                    forum in NavigationLink(destination: ProfileView(forum: forum)){
                        HStack{
                            AsyncImage(url: URL(string: forum.image)){ image in
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            } placeholder: {
                                Color.gray
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10){
                                Text(forum.name)
                                    .font(.system(size: 18, weight: .bold))
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always))
        
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
