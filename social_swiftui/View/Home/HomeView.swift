//
//  HomeView.swift
//  social_swiftui
//
//  Created by CodeForAny on 08/09/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var recommendArr = [
        ["name": "James McL..", "image": "r1"],
            ["name": "Bessie Sima...", "image": "r2"],
            ["name": "Jeffery Hall", "image": "r3"],
            ["name": "Judy Adler", "image": "r4"]
    ]
    
    @State var allArr = [ [
        "name": "Georgia Bates",
        "image": "u1",
        "status": "Toronto, Ontario",
        "is_online": false,
        "time": "30s ago",
        "images": ["p1", "p2", "p3"]
      ],
      [
        "name": "Johny Vino",
        "image": "u2",
        "status": "Mississauga, Ontario",
        "time": "5mins ago",
        "is_online": false,
        "images": ["p4", "p5", "p6"]
      ],
      [
        "name": "Scott Horsfall",
        "image": "u3",
        "status": "Markham, Ontario",
        "time": "10mins ago",
        "is_online": true,
        "images": ["p7", "p8", "p9"]
      ],
      [
        "name": "Meagan Ryan",
        "image": "u4",
        "status": "Oakvill Ontario",
        "time": "2days ago",
        "is_online": false,
        "images": [
          "p10",
          "p11",
          "p12"
        ]
      ]
    ]
    
    
    var body: some View {
        ZStack {
            
            ScrollView {
                Spacer()
                    .frame(height: . topInsets + 50)
                
                VStack(alignment: .leading) {
                    Text("Recommendations")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 15) {
                            
                            ForEach( 0..<recommendArr.count , id: \.self) {
                                index in
                                                                
                                RecommendCell(rObj: recommendArr[index])
                                
                            }
                            Button {
                                
                            } label: {
                                
                            }

                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    }
                }
                .background(Rectangle().fill(Color.white).shadow( color: Color.black.opacity(0.15), radius: 2, y: 2))
                
                LazyVStack {
                    ForEach( 0..<allArr.count, id: \.self) { index in
                       
                        HomeRow(uObj: allArr[index])
                    }
                }
                .padding(.vertical, 10)
            }
            
            VStack {
                ZStack {
                    HStack {
                        NavigationLink {
                            ChatsView()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
       
    }
}
