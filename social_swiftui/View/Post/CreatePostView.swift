//
//  CreatePostView.swift
//  social_swiftui
//
//  Created by CodeForAny on 14/09/23.
//

import SwiftUI

struct CreatePostView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var imageArr = ["po_1","po_2","po_3","po_4","po_5"]
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                    .frame(height: . topInsets + 70)
                
                Text("What's on your mind?")
                    
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                HStack{
                    
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                    
                    Text("Toronto, Ontario")
                        
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.primaryText)
                        
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                
                Spacer()
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack{
                        ForEach(0..<imageArr.count, id: \.self, content: {
                            index in
                            
                            NavigationLink {
                                PostDetailView()
                            } label: {
                                Image(imageArr[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }
                            
                        })
                    }
                    .padding(20)
                    
                }
                .frame(height: .bottomInsets + 100)
                    
                
            }
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        Text("Post")
                            
                            .font(.customfont(.bold, fontSize: 26))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        NavigationLink {
                            DetailsView()
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            CreatePostView()
        }
        
    }
}
