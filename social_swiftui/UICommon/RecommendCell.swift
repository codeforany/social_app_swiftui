//
//  RecommendCell.swift
//  social_swiftui
//
//  Created by CodeForAny on 08/09/23.
//

import SwiftUI

struct RecommendCell: View {
    
    var rObj: [String: String] = [:]
    var isActive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .center){
                    LinearGradient(colors: Color.secondaryG, startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                    
                    Image( rObj["image"] ?? "" )
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                }
                
                if(isActive) {
                    Rectangle()
                        .fill( Color.base )
                        .frame(width:20, height: 20)
                        .cornerRadius(10)
                        .overlay( RoundedRectangle(cornerRadius: 10 ).stroke( Color.white, lineWidth: 2 ).shadow(radius: 2))
                }
                
            }
               
                
            
            Text(rObj["name"] ?? "")
                .font(.customfont(.regular, fontSize: 13))
                .foregroundColor(.secondaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                
        
        }
        .frame(width: 80)
    }
}

struct RecommendCell_Previews: PreviewProvider {
    static var previews: some View {
        RecommendCell(rObj: ["name": "James McL..", "image": "r1"])
    }
}
