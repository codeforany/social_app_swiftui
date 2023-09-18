//
//  NotificationRow.swift
//  social_swiftui
//
//  Created by CodeForAny on 13/09/23.
//

import SwiftUI

struct NotificationRow: View {
    var notiObj: [String:Any] = [:]
    var body: some View {
        HStack(spacing: 15){
            Image(notiObj["image"] as? String ?? "" )
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack{
                Text(notiObj["name"] as? String ?? "")
                    
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(notiObj["message"] as? String ?? "") | \(notiObj["time"] as? String ?? "")")
                    
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(.secondaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                
            } label: {
                Image("more")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }

        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(notiObj: [
            "name": "Tom Joy",
            "image": "u3",
            "message": "Started following you",
            "time": "2w ago"
          ])
        .padding(.horizontal, 20)
    }
}
