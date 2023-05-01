//
//  PostView.swift
//  CS4400FinalProject
//
//  Created by Saadat Abbas on 4/11/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct PostView: View {
    @Binding var showPost: Bool
    @State var title = ""
    @State var text = ""
    @State var currentForum = forums[0].name
    
    @State var stored = false
    @State var postColor = Color.blue
    
    @ObservedObject var postModel = PostViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Button(action: {
                    dismiss()
                    
                }, label: {
                    Text("Cancel")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                })
                
                Spacer()
                
                Button(action: {
                    postModel.uploadPost(forum: currentForum, title: self.title, body: self.text)
                    
                }, label: {
                    Text("Post")
                        .font(.title2)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("maroon"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
                
            } //end HStack
            .padding()
            
            Picker("Select a Forum", selection: $currentForum){
                ForEach(forums, id: \.self.name){
                    Text($0.name)
                } //end ForEach
            } //end Picker
            .pickerStyle(.menu)
            .padding(.vertical, 25)
            .background(Color(.systemGray5), in: RoundedRectangle(cornerRadius: 10))
            
            VStack{
                HStack{
                    TextField("Add Title", text: self.$title)
                        .font(.title)
                        .foregroundColor(Color.white)
                        .padding()

                }
                .padding()
                
                HStack{
                    TextArea("Add Text", text: self.$text)
                }
                .padding()
                Spacer()
                    .frame(height: 150)
                
            } //end VStack
            .background(Color(.systemGray5), in: RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 6)
            .padding(.vertical, 10)
            
        } //end VStack
        .onReceive(postModel.$uploaded, perform: { success in
            if success{
                dismiss()
            }
        }) // gets bool from PostViewModel and if true then close page
        .preferredColorScheme(.dark)
    }
}

//custom text area for body
struct TextArea: View{
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View{
        ZStack(alignment: .topLeading){
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
             TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .font(.title3)
            
        } // end ZStack
        .font(.body)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(showPost: .constant(true))
    }
}
