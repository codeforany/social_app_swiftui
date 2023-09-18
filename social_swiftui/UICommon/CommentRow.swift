//
//  CommentRow.swift
//  social_swiftui
//
//  Created by CodeForAny on 14/09/23.
//

import SwiftUI

struct CommentRow: View {
    var cObj: [String:String] = [:]
    var body: some View {
        HStack(spacing: 15){
            Image(cObj["image"]  ?? "" )
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack{
                
                HStack{
                    Text(cObj["name"] ?? "")
                        
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        
                    
                    Text("\(cObj["time"]  ?? "")")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(cObj["comment"]  ?? "")
                    
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Text("Replay")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.secondaryText)
            }
            
            Button {
                
            } label: {
                Image("fav")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }

        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(cObj: [
            "name": "Ronald Shores",
            "comment": "Impressive set up",
            "time": "14m ago",
            "image": "u1"
          ])
        .padding(.horizontal, 20)
    }
}
