//
//  ChatTextBubbles.swift
//  social_swiftui
//
//  Created by CodeForAny on 11/09/23.
//

import SwiftUI

struct ChatTextBubbles: View {
    var cObj: [String: Any] = [:]
    var uObj: [String: Any] = [:]
    var body: some View {
        
        let isLeft = cObj["is_sender"] as? Bool ?? false
        
        HStack{
            ZStack(alignment: .topTrailing) {
                Image( uObj["image"] as? String ?? "" )
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .overlay( RoundedRectangle(cornerRadius: 30)
                        .stroke( Color.white, lineWidth: 2 ).shadow(radius: 2) )
                
                
                Rectangle()
                    .fill( Color.base )
                    .frame(width:15, height: 15)
                    .cornerRadius(7.5)
                    .overlay( RoundedRectangle(cornerRadius: 7.5 ).stroke( Color.white, lineWidth: 2 ).shadow(radius: 2))
                
                
            }
            
            VStack{
                VStack(alignment: isLeft ? .leading : .trailing) {
                    Text(cObj["message"] as? String ?? "")
                        .font(.customfont(.regular, fontSize: 15))
                        
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                        .padding(.bottom, 1)
                    
                    Text(cObj["time"] as? String ?? "")
                        .font(.customfont(.regular, fontSize: 12))
                        .padding(.horizontal, 15)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(10)
                .background( isLeft ? Color.primaryApp : Color(hex: "434B56") )
                .cornerRadius(20)
            }
            .frame(maxWidth: 260, alignment: .leading )
            .environment(\.layoutDirection, .leftToRight)
            
        }
        .environment(\.layoutDirection, isLeft ? .leftToRight : .rightToLeft )
        .frame(maxWidth: .infinity, alignment: isLeft ? .leading : .trailing )
    }
}

struct ChatTextBubbles_Previews: PreviewProvider {
    static var previews: some View {
        ChatTextBubbles( cObj: [
            "message": "Hey, nice to meet you Alex",
            "time": "7:50 PM • Seen",
            "is_sender": true,
            "is_text": true,
        ], uObj:  [
            "name": "Alex Fish",
            "last_message": "Hey, nice shoes where are...",
            "image": "u1",
            "is_online": true,
            "time": "7s ago",
            "is_group": false,
        ] )
    }
}
