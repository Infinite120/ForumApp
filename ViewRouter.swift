//
//  ViewRouter.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI

class ViewRouter: ObservableObject{
    //default tab
    @Published var currentItem: TabBarViewModel = .feed
    
    //return the view
    var view: some View{
        return currentItem.view
    }
    
}

//model to return certain view and their image symbol
enum TabBarViewModel: Int, CaseIterable{
    case feed
    case search
    case chat
    case settings
    
    var imageName: String{
        switch self{
        case .feed: return "house.fill"
        case .search: return "magnifyingglass"
        case .chat: return "bubble.left"
        case .settings: return "gearshape"
            
        }
    }
    
    var view: some View{
        switch self{
        case .feed:
            return AnyView(FeedView())
        case .search:
            return AnyView(SearchView())
        case .chat:
            return AnyView(ChatView())
        case .settings:
            return AnyView(SettingsView())
            
        }
    }
}
