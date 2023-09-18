//
//  ChatConversationView.swift
//  social_swiftui
//
//  Created by CodeForAny on 11/09/23.
//

import SwiftUI

struct ChatConversationView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var uObj: [String: Any] = [:]
    @State var txtMessage = ""
    
    @State var chatMessageArr: [[String:Any]] = [
        [
            "message": "Hey, nice to meet you Alex",
            "time": "7:50 PM • Seen",
            "is_sender": true,
            "is_text": true,
        ],
        [
            "message": "Hey Jenna!! I see were both at Burning Man! huge fans",
            "time": "7:53 PM • Seen",
            "is_sender": false,
            "is_text": true,
        ],
        [
            "message": "Mar, 7, 10:17PM",
            "is_text": false,
        ],
        [
            "message":
                "OMG me too! Totally wish the City would have more stuff like that",
            "time": "8:00 PM • Seen",
            "is_sender": true,
            "is_text": true,
        ],
        [
            "message": "Wanna grab something to eat?",
            "time": "8:02 PM • Seen",
            "is_sender": false,
            "is_text": true,
        ],
        [
            "message": "I'm down! That sounds aaamazing!!",
            "time": "8:04 PM • Seen",
            "is_sender": true,
            "is_text": true,
        ]
        
        
    ]
    
    var body: some View {
        ZStack {
            
            ScrollView {
                Spacer()
                    .frame(height: . topInsets + 50)
                
                LazyVStack(spacing: 15) {
                    ForEach( 0..<chatMessageArr.count, id: \.self) { index in
                        
                        var cObj = chatMessageArr[index] as? [String: Any] ?? [:]
                        var isLeft = cObj["is_sender"] as? Bool ?? false
                        
                        if(cObj["is_text"] as? Bool ?? false ) {
                            //Message Text

                            ChatTextBubbles(cObj: cObj, uObj: isLeft ? [ "name": "Alex Fish",
                                                                         
                                                                         "image": "user_profile"] : uObj )
                        }else{
                            //Date
                            ChatDateBubble( date: cObj["message"] as? String ?? ""  )
                        }
                        
                    }
                }
                .padding(15)
                .padding(.vertical, 10)
                
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
                            
                            ZStack(alignment: .topTrailing) {
                                Image( uObj["image"] as? String ?? "" )
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)
                                    .overlay( RoundedRectangle(cornerRadius: 20)
                                        .stroke( Color.white, lineWidth: 2 ) )
                                
                                
                                Rectangle()
                                    .fill( Color.base )
                                    .frame(width:10, height: 10)
                                    .cornerRadius(5)
                                    .overlay( RoundedRectangle(cornerRadius: 5 ).stroke( Color.white, lineWidth: 2 ).shadow(radius: 2))
                                
                                
                            }
                            
                            Text(uObj["name"] as? String ?? "")
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primaryText)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        
                        NavigationLink {
                            DetailsView()
                        } label: {
                            Image("info")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
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
                    
                    
                    TextField("Type a message....", text: $txtMessage)
                        .font(.customfont(.medium, fontSize: 13))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .overlay( RoundedRectangle(cornerRadius: 25 ).stroke( Color.black.opacity(0.5), lineWidth: 1 ))
                    
                    
                    Button {
                        
                    } label: {
                        Image("image_picker")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                    }
                    
                    
                    Button {
                        
                    } label: {
                        Image("att")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                    }
                    
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

struct ChatConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ChatConversationView(uObj:  [
            "name": "Alex Fish",
            "last_message": "Hey, nice shoes where are...",
            "image": "u1",
            "is_online": true,
            "time": "7s ago",
            "is_group": false,
        ] )
    }
}
