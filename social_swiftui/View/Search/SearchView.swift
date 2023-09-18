//
//  SearchView.swift
//  social_swiftui
//
//  Created by CodeForAny on 13/09/23.
//

import SwiftUI

struct SearchView: View {
    @State var txtSearch = ""
    
    @State var searchArr = [
        [
          "name": "Emily Lerner",
          "image": "u1",
          "tag": "@loveemily"
        ],
        [
          "name": "Erin Anderson",
          "image": "u2",
          "tag": "@erin4life"
        ],
        [
          "name": "Ewan Coffey",
          "image": "u3",
          "tag": "@ewancoffey"
        ],
        [
          "name": "Elis Jimmy",
          "image": "u4",
          "tag": "@its_me_jimmy"
        ],
        [
          "name": "Elisha Gaines",
          "image": "u1",
          "tag": "@elisha22"
        ],
        [
          "name": "Eamon Shores",
          "image": "u2",
          "tag": "@eamon_shores"
        ],
        [
          "name": "Eileen Conners",
          "image": "u3",
          "tag": "@eileen"
        ],
        [
          "name": "Earl Garcia",
          "image": "u4",
          "tag": "@earl-design"
        ],
        [
          "name": "Elliemay Maio",
          "image": "u1",
          "tag": "@elliemay_ny"
        ],
        [
          "name": "Eathen Joy",
          "image": "u2",
          "tag": "@eathen_12"
        ],
        [
          "name": "Ebenezer Fidler",
          "image": "u3",
          "tag": "@ebenezerfidler_"
        ]
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
                    
                    TextField("Search by user name or full name", text: $txtSearch)
                        .font(.customfont(.medium, fontSize: 13))
                   
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                Divider()
                
                if(txtSearch.isEmpty) {
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
                }else{
                    LazyVStack(spacing: 15) {
                        ForEach( 0..<searchArr.count , id: \.self) { index in
                            
                            let uObj = searchArr [index]
                            UserRow(uObj: uObj)
                            
                        }
                    }
                    .padding(.horizontal, 15)
                }
                
                
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
                        
                        Text("Search")
                            
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
