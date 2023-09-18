//
//  StoriesView.swift
//  social_swiftui
//
//  Created by CodeForAny on 12/09/23.
//

import SwiftUI

struct StoriesView: View {
    @State var txtSearch = ""
    @State var friendArr = [
        ["name": "James McL..", "image": "r1"],
            ["name": "Bessie Sima...", "image": "r2"],
            ["name": "Jeffery Hall", "image": "r3"],
            ["name": "Judy Adler", "image": "r4"]
    ]
    
    @State var storieArr = [
        [
             "name": "Megan Rae",
             "image": "s1",
             "user_image": "u1"
           ],
           [
             "name": "Charles Dixon",
             "image": "s2",
             "user_image": "u2"
           ],
           [
             "name": "Rebecca Taylor",
             "image": "s3",
             "user_image": "u3"
           ],
           [
             "name": "Deanna Walser",
             "image": "s4",
             "user_image": "u4"
           ],
           [
             "name": "Janice Williams",
             "image": "s5",
             "user_image": "u1"
           ],
           [
             "name": "Adam Neumann",
             "image": "s6",
             "user_image": "u2"
           ],
           [
             "name": "Mary Hennen",
             "image": "s7",
             "user_image": "u3"
           ],
           [
             "name": "Joe Terpstra",
             "image": "s8",
             "user_image": "u4"
           ],
           [
             "name": "William Yoshioka",
             "image": "s9",
             "user_image": "u1"
           ],
           [
             "name": "Megan Rae",
             "image": "s10",
             "user_image": "u2"
           ],
           [
             "name": "Charles Dixon",
             "image": "s11",
             "user_image": "u3"
           ],
           [
             "name": "Rebecca Taylor",
             "image": "s12",
             "user_image": "u4"
           ]
        ]
    
    @State var colums = [ GridItem( .flexible(), spacing: 8 ), GridItem( .flexible(), spacing: 8 ), GridItem( .flexible(), spacing: 8 ) ]
        
    var body: some View {
        ZStack {
            
            ScrollView {
                Spacer()
                    .frame(height: . topInsets + 50)
                
                Divider()
                
                HStack{
                    Image("search_tab")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    TextField("Search friends / or user name to find their stories", text: $txtSearch)
                        .font(.customfont(.medium, fontSize: 13))
                   
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Friends")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 15) {
                            
                            ForEach( 0..<friendArr.count , id: \.self) {
                                index in
                                RecommendCell(rObj: friendArr[index], isActive: true)
                                
                            }

                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    }
                }
                .background(Rectangle().fill(Color.white).shadow( color: Color.black.opacity(0.15), radius: 2, y: 2))
                
                
                LazyVGrid(columns: colums, spacing: 15) {
                    
                    ForEach( 0..<storieArr.count , id: \.self) {
                        index in
                        var sObj = storieArr[index] as? [ String : String] ?? [:]
                        
                        ZStack(alignment: .bottom ){
                            Image(sObj["image"] ?? "" )
                                .resizable()
                                .scaledToFill()
                                .aspectRatio( 1 / 1.05 , contentMode: .fill)
                                .padding(.bottom, 30)
                            
                            VStack(spacing: 4){
                                
                                Image(sObj["user_image"] ?? "" )
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:30, height:30)
                                
                                Text(sObj["name"] ?? "")
                                    .font(.customfont(.regular, fontSize: 13))
                                    .lineLimit(1)
                                    .foregroundColor(Color.secondaryText)
                            }
                            
                        }
                        
                    }
                }
                .padding(15)
                
                Spacer()
                    .frame(height: .bottomInsets + 50)
                
            }
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        Text("Stories")
                            
                            .font(.customfont(.bold, fontSize: 26))
                            .foregroundColor(.primaryText)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
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
               
                
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
