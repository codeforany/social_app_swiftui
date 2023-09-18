//
//  ChatsView.swift
//  social_swiftui
//
//  Created by CodeForAny on 10/09/23.
//

import SwiftUI

struct ChatsView: View {
    @State var txtSearch = ""
    @State var recommendArr = [
        ["name": "James McL..", "image": "r1"],
            ["name": "Bessie Sima...", "image": "r2"],
            ["name": "Jeffery Hall", "image": "r3"],
            ["name": "Judy Adler", "image": "r4"]
    ]
    
    @State var myChatArr = [
            [
                  "name": "Alex Fish",
                  "last_message": "Hey, nice shoes where are...",
                  "image": "u1",
                  "is_online": true,
                  "time": "7s ago",
                  "is_group": false,
                ],
              [
                  "name": "Johny Vino",
                  "last_message": "I'm at Batch bar waiting to...",
                  "image": "u2",
                  "time": "20mins ago",
                  "is_online": false,
                  "is_group": false,
                ],
              [
                  "name": "Scott Horsfall",
                  "last_message": "I can't find the location.",
                  "image": "u3",
                  "time": "30 days ago",
                  "is_online": true,
                  "is_group": false,
                ],
              [
                  "name": "Group:",
                  "last_message": "Andrew, Rob, +21",
                  "image": [
                    "p10",
                    "p11",
                    "p12"
                  ],
                  "time": "20 days ago",
                  "is_online": false,
                  "is_group": true,
                ]
        ]
        
        @State var myGroupArr = [
            [
                  "name": "Parties in Toronto downtown",
                  "image": [
                    "u1",
                    "u2",
                    "u3",
                    "u2",
                    "u1",
                    "u4",
                    "u1",
                    "u2",
                    "u3"
                  ],
                  "time": "3 days ago",
                  "members": "381",
                  "comments": "210"
                ],
                [
                  "name": "Thoughts on F45 classes?",
                  "image": [
                    "u2",
                    "u3",
                    "u1",
                    "u3",
                    "u1",
                    "u2",
                    "u3"
                  ],
                  "time": "8 days ago",
                  "members": "651",
                  "comments": "192"
                ],
                [
                  "name": "UX Meet ups and coffee",
                  "image": [
                    "u1",
                    "u2",
                    "u3",
                    "u1",
                    "u2",
                    "u3"
                  ],
                  "time": "10 days ago",
                  "members": "540",
                  "comments": "192"
                ]
        ]
    
        
    
    var body: some View {
        ZStack {
            
            ScrollView {
                Spacer()
                    .frame(height: . topInsets + 50)
                
                Divider()
                
                HStack{
                    Image("search_tab")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    TextField("Search Messages", text: $txtSearch)
                        .font(.customfont(.medium, fontSize: 13))
                    
                    Button {
                        
                    } label: {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }

                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Active")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 15) {
                            
                            ForEach( 0..<recommendArr.count , id: \.self) {
                                index in
                                                     
                                

                                RecommendCell(rObj: recommendArr[index], isActive: true)
                                
                            }

                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    }
                }
                .background(Rectangle().fill(Color.white).shadow( color: Color.black.opacity(0.15), radius: 2, y: 2))
                
                HStack{
                    Text("My Chats")
                        .font(.customfont(.bold, fontSize: 19))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 40)
                
                LazyVStack {
                    ForEach( 0..<myChatArr.count, id: \.self) { index in
                        
                        NavigationLink {
                            ChatConversationView(uObj: myChatArr[index] )
                        } label: {
                            UserChatRow(uObj: myChatArr[index])
                        }
                        
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Divider()
                
                HStack{
                    Text("What people are talking about...")
                        .font(.customfont(.bold, fontSize: 19))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 20)
                .frame(height: 40)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        
                        ForEach( 0..<myGroupArr.count , id: \.self) {
                            index in
                                                            
                            GroupCell(gObj: myGroupArr[index])
                            
                        }

                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 3)
                }
                .padding(.bottom, 40)
            }
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        Text("Messages")
                            
                            .font(.customfont(.bold, fontSize: 26))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
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
                .background(Color.white)
               
                
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ChatsView()
        }
       
    }
}
