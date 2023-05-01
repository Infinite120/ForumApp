//
//  TabIconView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI

struct TabIconView: View {
    let viewModel: TabBarViewModel
    @ObservedObject var router = ViewRouter()
    
    var body: some View {
        Button(action: {
            router.currentItem = viewModel
        }, label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25, height: 25)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        })    }
}

struct TabPostIcon: View {
    @Binding var newPost: Bool
    
    var body: some View{
        ZStack{
            Circle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .shadow(radius: 4)
            
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
                .foregroundColor(Color("maroon"))
                .rotationEffect(Angle(degrees: newPost ? 45 : 0))
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabIconView(viewModel: .feed, router: ViewRouter())
    }
}
