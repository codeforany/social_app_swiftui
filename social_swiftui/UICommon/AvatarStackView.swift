//
//  AvatarStackView.swift
//  social_swiftui
//
//  Created by CodeForAny on 10/09/23.
//

import SwiftUI

struct AvatarStackView: View {
    var imageArr: [String] = []
    var imageWidth: CGFloat = 40
    var offsetMultiper: CGFloat = 10
    var maxDisplay: Int = 3
    
    var body: some View {
        
        let lastIndex = (imageArr.count > maxDisplay) ? maxDisplay : imageArr.count
        let isMore = imageArr.count - maxDisplay
        
        let itemCount: Int = isMore > 0 ? maxDisplay + 1  : lastIndex
        let framWidth: CGFloat = ( (imageWidth - offsetMultiper) *  CGFloat(itemCount)  ) + CGFloat(offsetMultiper)
        
        ZStack(alignment: .leading) {
            
            ForEach(0..<lastIndex, id: \.self) { index in
                
                Image(imageArr[index])
                    .resizable()
                    .scaledToFill()
                    .frame(width:imageWidth, height: imageWidth )
                    .cornerRadius( imageWidth / 2 )
                    .overlay( RoundedRectangle(cornerRadius: imageWidth / 2).stroke( Color.white, lineWidth: 2 ).shadow(color: Color.black.opacity(0.15), radius: 1) )
                    .offset(x: (imageWidth - offsetMultiper) * CGFloat(index) )
            }
            
            if(isMore > 0) {
                Text("+\(isMore)")
                    .font(.customfont(.regular, fontSize: 13))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: imageWidth, alignment: .center)
                    .offset(x: (imageWidth - offsetMultiper) * CGFloat(maxDisplay) )
            }
            
        }
        .frame(width:framWidth, alignment: .leading)
    }
}

