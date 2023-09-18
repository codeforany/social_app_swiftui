//
//  TabButton.swift
//  social_swiftui
//
//  Created by CodeForAny on 07/09/23.
//

import SwiftUI

struct TabButton: View {
    var title: String = "HOME"
    var icon: String = "home_tab"
    var isSelect: Bool = false
    var didTab: (()->())?
    var body: some View {
        Button {
            didTab?()
        } label: {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                Text(title)
                    .font(.customfont(.bold, fontSize: 10))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundColor( isSelect ? Color.primaryApp : Color.primaryText)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton()
    }
}
