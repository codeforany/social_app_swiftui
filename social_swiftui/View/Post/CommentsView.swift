//
//  CommentsView.swift
//  social_swiftui
//
//  Created by CodeForAny on 14/09/23.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var txtComment = ""
    
    @State var commentsArr = [
        [
              "name": "Ronald Shores",
              "comment": "Impressive set up",
              "time": "14m ago",
              "image": "u1"
            ],
            [
              "name": "Jimmy Love",
              "comment": "Where's you office?",
              "time": "30m ago",
              "image": "u2"
            ],
            [
              "name": "Sha Gaines",
              "comment": "I remember being away that day",
              "time": "31m ago",
              "image": "u3"
            ],
            [
              "name": "Ivey Wilson",
              "comment": "Hahaha you made me clean your...",
              "time": "35m ago",
              "image": "u4"
            ],
            [
              "name": "Bradley Dame",
              "comment": "That was the day we got nothing...",
              "time": "1h ago",
              "image": "u1"
            ]
    ]
    
    var body: some View {
        ZStack {
            
            ScrollView {
               
                Spacer()
                    .frame(height: . topInsets + 65)
                VStack{
                    Text("Obsessed with my desk at work. All cleaned & organized after 5 years")
                        .font(.customfont(.regular, fontSize: 15))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("#workdesk #worklife #agency")
                        .font(.customfont(.regular, fontSize: 15))
                        .foregroundColor(.primaryApp)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 1)
                    
                    Text("22 hours ago")
                        .font(.customfont(.regular, fontSize: 13))
                        .foregroundColor(.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                  
                    Divider()
                    
                    
                    LazyVStack(spacing: 15) {
                            
                        ForEach( 0..<commentsArr.count, id: \.self) { index in
                            
                            CommentRow(cObj: commentsArr[index] )
                        }
                        
                    }
                    .padding(.vertical, 15)
                }
                .padding(.horizontal, 15)
                
                
                
                Spacer()
                    .frame(height: .bottomInsets + 44)
            }
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        HStack{
                            
                            Text("Comments")
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        NavigationLink {
                            DetailsView()
                        } label: {
                            Image("user_profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .cornerRadius(17.5)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, .topInsets)
                    .padding(.bottom, 15)
                }
                .background(RoundedRectangle(cornerRadius: 0).fill(Color.white).shadow(radius: 2, y: 2))
                
                
                
                
                Spacer()
                
                HStack(spacing: 8){
                    Button {
                        
                    } label: {
                        Image("emoji")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    }
                    
                    
                    TextField("Type a message....", text: $txtComment)
                        .font(.customfont(.medium, fontSize: 13))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .overlay( RoundedRectangle(cornerRadius: 25 ).stroke( Color.black.opacity(0.5), lineWidth: 1 ))
                   
                    
                }
                .padding(10)
                .padding(.horizontal, 5)
                .padding(.bottom, .bottomInsets)
                .background(RoundedRectangle(cornerRadius: 0).fill(Color.white).shadow(radius: 3, y: -5))
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
