//
//  ContentView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI

struct ContentView: View {

    @State var show = false
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                //if no user is signed in then login page else main interface
                if authModel.userSession == nil{
                    ZStack{
                        //Goes to SignUp page if Sign up link is pressed
                        NavigationLink(destination: SignUpView(show: $show), isActive: $show){
                            Text("")
                        }
                        .hidden()
                        
                        LoginView(show: self.$show)
                    } //end ZStack
                    
                } else{
                    Interface()
                }
            }//end VStack
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }//end Navigation View
    }
}

struct Interface: View{
    @ObservedObject var router = ViewRouter()
    @State private var showPost = false
    
    var body: some View{
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                
                router.view
                
                Spacer()
                
                HStack{
                    TabIconView(viewModel: .feed, router: router)
                    TabIconView(viewModel: .search, router: router)
                    
                    TabPostIcon(newPost: $showPost)
                        .onTapGesture {
                            withAnimation{
                                showPost.toggle()
                            }
                        }.fullScreenCover(isPresented: $showPost, content:{
                            PostView(showPost: $showPost)
                        })
                    
                    TabIconView(viewModel: .chat, router: router)
                    TabIconView(viewModel: .settings, router: router)
                }
                .frame(height: UIScreen.main.bounds.height / 8)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
            }
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}

struct forum: Identifiable{
    var id = UUID()
    var name: String
    var description: String
    var image: String
}

let forums = [
    forum(name: "Computer Science I", description: "A class about aboerating systems", image: "CS1"),
    forum(name: "Computer Science II", description: "A class about aboerating systems", image: "CS2"),
    forum(name: "Operating Systems", description: "A class about operating systems", image: "OS"),
    forum(name: "Mobile Device Programming",description: "A class about developing apps", image: "AppIcon"),

]
