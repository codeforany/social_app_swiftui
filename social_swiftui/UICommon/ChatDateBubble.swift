//
//  ChatDateBubble.swift
//  social_swiftui
//
//  Created by CodeForAny on 11/09/23.
//

import SwiftUI

struct ChatDateBubble: View {
    var date: String = ""
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame( maxWidth: .infinity, maxHeight: 0.5 )
            
            Text(date)
                .font(.customfont(.regular, fontSize: 13))
                .padding(.horizontal, 15)
                .foregroundColor(.secondaryText)
            
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame( maxWidth: .infinity, maxHeight: 0.5 )
        }
        .frame(height: 30)
    }
}

struct ChatDateBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatDateBubble()
    }
}
