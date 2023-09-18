//
//  UserRow.swift
//  social_swiftui
//
//  Created by CodeForAny on 13/09/23.
//

import SwiftUI

struct UserRow: View {
    var uObj: [String: String] = [:]
    var body: some View {
        HStack(spacing: 15){
            Image(uObj["image"]  ?? "" )
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack{
                Text(uObj["name"]  ?? "")
                    
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(uObj["tag"]  ?? "")
                    
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            

        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(uObj: [
            "name": "Emily Lerner",
            "image": "u1",
            "tag": "@loveemily"
          ])
        .padding(20)
    }
}
