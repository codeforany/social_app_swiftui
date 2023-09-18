//
//  UserChatRow.swift
//  social_swiftui
//
//  Created by CodeForAny on 10/09/23.
//

import SwiftUI

struct UserChatRow: View {
    var uObj: [String: Any] = [:]
    
    var body: some View {
        HStack(spacing: 15) {
            
            
            if( uObj["is_group"] as? Bool ?? false ) {
                AvatarStackView(imageArr: ( uObj["image"] as? [String] ?? [] ), imageWidth: 50, offsetMultiper: 15, maxDisplay: 3)
            }else{
                ZStack(alignment: .topTrailing) {
                   
                        
                    Image( uObj["image"] as? String ?? "" )
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .overlay( RoundedRectangle(cornerRadius: 25 ).stroke( Color.white, lineWidth: 2 ).shadow(radius: 2))
                   
                    
                    if(uObj["is_online"] as? Bool ?? false) {
                        Rectangle()
                            .fill( Color.base )
                            .frame(width:15, height: 15)
                            .cornerRadius(7.5)
                            .overlay( RoundedRectangle(cornerRadius: 7.5 ).stroke( Color.white, lineWidth: 2 ).shadow(radius: 2))
                    }
                    
                }
            }
            
            
         
            
            VStack {
                
                HStack{
                    Text(uObj["name"] as? String ?? "")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(uObj["time"] as? String ?? "")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundColor(.secondaryText)
                }
                
                HStack{
                    Text(uObj["last_message"] as? String ?? "")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if(uObj["is_online"] as? Bool ?? false) {
                        Text("Active")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundColor(.primaryApp)
                    }
                    
                }
                
                
            }
            
        }
    }
}

struct UserChatRow_Previews: PreviewProvider {
    static var previews: some View {
        UserChatRow(uObj: [
            "name": "Scott Horsfall",
            "last_message": "I can't find the location.",
            "image": "u3",
            "time": "30 days ago",
            "is_online": true,
            "is_group": false,
          ])
        .padding(20)
    }
}
