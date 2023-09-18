//
//  GroupCell.swift
//  social_swiftui
//
//  Created by CodeForAny on 10/09/23.
//

import SwiftUI

struct GroupCell: View {
    var gObj: [ String : Any] = [:]
    
    
    var body: some View {
        VStack(alignment: .center){
            
            AvatarStackView(imageArr: ( gObj["image"] as? [String] ?? [] ), imageWidth: 40, offsetMultiper: 10, maxDisplay: 3)
            
            Text(gObj["name"] as? String ?? "")
                .font(.customfont(.bold, fontSize: 14))
                .multilineTextAlignment(.center)
                .foregroundColor(.primaryText)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text(gObj["time"] as? String ?? "")
                .font(.customfont(.regular, fontSize: 11))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondaryText)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Divider()
            
            Text( "\(gObj["members"] as? String ?? "") Members" )
                .font(.customfont(.regular, fontSize: 11))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondaryText)
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            Text("\(gObj["comments"] as? String ?? "") Comments")
                .font(.customfont(.regular, fontSize: 11))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondaryText)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(8)
        .frame(width: 150, height: 180)
        .background( RoundedRectangle(cornerRadius: 5)
            .fill(Color.white)
            .shadow(radius: 3,y:2)
        )
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(gObj: [
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
          ])
    }
}
