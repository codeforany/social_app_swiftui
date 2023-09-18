//
//  Step4View.swift
//  social_swiftui
//
//  Created by CodeForAny on 06/09/23.
//

import SwiftUI

struct Step4View: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 15) {
                
                
                
                Spacer()
                
                Text("Turn on notifications")
                    .font(.customfont(.bold, fontSize: 25))
                    .padding(.bottom, 15)
                
                
                Text("Get the most out of Campany by staying up to\ndate with what's happening.")
                    .font(.customfont(.regular, fontSize: 14))
                    .padding(.bottom, 15)
                
               
                
                
                Button {
                    
                } label: {
                    
                        Text("Allow Notifications")
                            .font(.customfont(.regular, fontSize: 15))
                            .foregroundColor(Color.primaryTextW)
                    
                }
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .center)
                .background(Color.primaryApp)
                .cornerRadius(25)
                
                Button {
                    
                } label: {
                    
                        Text("Skip for now")
                            .font(.customfont(.medium, fontSize: 15))
                            .foregroundColor(Color.primaryApp)
                    
                }
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct Step4View_Previews: PreviewProvider {
    static var previews: some View {
        Step4View()
    }
}
