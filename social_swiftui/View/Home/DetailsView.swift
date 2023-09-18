//
//  DetailsView.swift
//  social_swiftui
//
//  Created by CodeForAny on 09/09/23.
//

import SwiftUI

struct DetailsView: View {
    
    @State var imagesArr = ["d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12"]
    
    @State var colums = [ GridItem( .flexible(), spacing: 8 ), GridItem( .flexible(), spacing: 8 ), GridItem( .flexible(), spacing: 8 ), ]
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    Image("user_profile")
                        .resizable()
                        .scaledToFit()
                    
                    VStack{
                        Spacer()
                            .frame(height: .screenWidth)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("135")
                                    .font(.customfont(.bold, fontSize: 17))
                                    .foregroundColor(.white)
                                
                                Text("posts")
                                    .font(.customfont(.bold, fontSize: 15))
                                    .foregroundColor(.secondaryText)
                            }
                            
                            
                            VStack(alignment: .leading){
                                Text("5,321k")
                                    .font(.customfont(.bold, fontSize: 17))
                                    .foregroundColor(.white)
                                
                                Text("followers")
                                    .font(.customfont(.bold, fontSize: 15))
                                    .foregroundColor(.secondaryText)
                            }
                            
                            
                            VStack(alignment: .leading){
                                Text("99")
                                    .font(.customfont(.bold, fontSize: 17))
                                    .foregroundColor(.white)
                                
                                Text("following")
                                    .font(.customfont(.bold, fontSize: 15))
                                    .foregroundColor(.secondaryText)
                            }
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("Friend Request")
                                    .font(.customfont(.bold, fontSize: 15))
                                    .foregroundColor(.white)
                                    .padding(8)
                            }
                            .background( Color.primaryApp )
                            .cornerRadius(15)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        VStack {
                            Text("Jenna Feranandez")
                                .font(.customfont(.bold, fontSize: 15))
                                .foregroundColor(.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack{
                                Text("Creative Designer")
                                    .font(.customfont(.regular, fontSize: 15))
                                    .foregroundColor(.primaryText)
                                
                                Text("@ArgoRadius")
                                    .font(.customfont(.regular, fontSize: 15))
                                    .foregroundColor(.primaryApp)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .padding(.bottom, 8)
                            
                            Text("Obsessed with Fahim MD's YouTube channel, love to go shopping on weekends and loveee food")
                                .font(.customfont(.regular, fontSize: 15))
                                .foregroundColor(.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("#foodielife")
                                .font(.customfont(.regular, fontSize: 15))
                                .foregroundColor(.primaryApp)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 15)
                            
                            
                            LazyVGrid(columns: colums, spacing: 8) {
                                
                                ForEach( 0..<imagesArr.count, id: \.self) { index in
                                    Image( imagesArr[index] )
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio( 116 / 100 , contentMode: .fill)
                                        .cornerRadius(14)
                                        .clipped()
                                }
                            }
                            
                            
                        }
                        .padding(25)
                        .background( Rectangle()
                            .fill(Color.white)
                            .cornerRadius(30, corner: [ .topLeft, .topRight])
                            .shadow(radius: 50, y : -50)
                        )
                        
                        .frame(maxWidth: .infinity )
                        .padding(.top, 15)
                    }
                }
                .padding(.top, .topInsets + 46)
                
            }
            VStack {
                ZStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image("chat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Text("Logo")
                            
                            .font(.customfont(.bold, fontSize: 26))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Button {
                            
                        } label: {
                            Image("user_profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .cornerRadius(17.5)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, .topInsets)
                    .padding(.bottom, 15)
                }
                .background(Color.white)
                .shadow(radius: 2, y: 2)
               
                
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
