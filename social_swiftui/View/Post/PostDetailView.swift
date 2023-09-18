//
//  PostDetailView.swift
//  social_swiftui
//
//  Created by CodeForAny on 14/09/23.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
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
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    Image("post_detail")
                        .resizable()
                        .scaledToFit()
                    
                    VStack{
                        Spacer()
                            .frame(height: .screenWidth * 0.9)
                        
                        VStack {
                            
                            HStack{
                                Button {
                                    
                                } label: {
                                    Image("fav")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                                
                                NavigationLink {
                                    CommentsView()
                                } label: {
                                    Image("chat")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image("more")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }

                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 15) {
                                
                                
                                AvatarStackView(imageArr: (  ["u1","u2"] ), imageWidth: 50, offsetMultiper: 15, maxDisplay: 2)
                                
                                VStack {
                                    
                                    Text("Liked by")
                                        .font(.customfont(.regular, fontSize: 11))
                                        .foregroundColor(.secondaryText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("Earl Garcia, Nancy Maio")
                                        .font(.customfont(.bold, fontSize: 16))
                                        .foregroundColor(.primaryText)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                }
                                
                            }
                            
                            
                            Divider()
                            
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
                        .padding(25)
                        .background( Rectangle()
                            .fill(Color.white)
                            .cornerRadius(30, corner: [ .topLeft, .topRight])
                            .shadow(radius: 50, y : -50)
                        )
                        
                        .frame(maxWidth: .infinity )
                        .padding(.top, 15)
                    }
                }
                .padding(.top, .topInsets + 46)
                
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
                        
                        Text("Post")
                            
                            .font(.customfont(.bold, fontSize: 26))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
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
                .background(Color.white)
                .shadow(radius: 2, y: 2)
               
                
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostDetailView()
        }
    }
}
