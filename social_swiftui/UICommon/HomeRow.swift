//
//  HomeRow.swift
//  social_swiftui
//
//  Created by CodeForAny on 08/09/23.
//

import SwiftUI

struct HomeRow: View {
    
    var uObj: [String:Any]
    
    
    var body: some View {
        var imageArr = uObj["images"] as? [String] ?? []
        
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image(uObj["image"] as? String ?? "" )
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                VStack {
                    Text(uObj["name"] as? String ?? "")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(uObj["status"] as? String ?? "") | \(uObj["time"] as? String ?? "")")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button {
                    
                } label: {
                    Image("more")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                   
                    ForEach( 0..<imageArr.count , id: \.self) {
                        index in
                        
                        var img = imageArr[index]
                        
                        
                        Image( img )
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 120)
                            .cornerRadius(14)
                            .clipped()
                        
                        
                    }
                    Button {
                        
                    } label: {
                        
                    }

                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
        }
    }
}
