//
//  ErrorView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/16/23.
//

import SwiftUI

struct ErrorView: View {
    @State var color = Color("FordhamBlack")
    //Environment Object so the values from the viewModel are shared between Error, Login, and SignUp Views
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                }// end HStack
                .padding(.horizontal, 25)
                
                Text(self.authModel.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal)
                
                Button(action: {
                    self.authModel.alert.toggle()
                }){
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("maroon"))
                .cornerRadius(10)
                .padding(.top, 25)
                
            }//end VStack
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(.white)
            .cornerRadius(15)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2.5)
            
        }//end GeometryReader
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }//end body
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
