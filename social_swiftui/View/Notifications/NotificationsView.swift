//
//  NotificationsView.swift
//  social_swiftui
//
//  Created by CodeForAny on 13/09/23.
//

import SwiftUI

struct NotificationsView: View {
   
    
    @State var notificationArr = [
        [
                "name": "New",
                "list": [
                  [
                    "name": "Cathy Lerner",
                    "image": "u1",
                    "message": "liked your post",
                    "time": "7s ago"
                  ],
                  [
                    "name": "Marvin Anderson",
                    "image": "u2",
                    "message": "Started following you",
                    "time": "30s ago"
                  ],
                  [
                    "name": "Timothy Coffey",
                    "image": "u3",
                    "message": "Commented: Impressive App design",
                    "time": "6m ago"
                  ]
                ]
              ],
              [
                "name": "Today",
                "list": [
                  [
                    "name": "Jimmy Love",
                    "image": "u4",
                    "message": "liked your post",
                    "time": "14m ago"
                  ],
                  [
                    "name": "Sha Gaines",
                    "image": "u1",
                    "message": "Started following you",
                    "time": "30m ago"
                  ],
                  [
                    "name": "Ronald Shores",
                    "image": "u2",
                    "message": "Commented: Impressive App design",
                    "time": "1h ago"
                  ],
                  [
                    "name": "Eileen Conners",
                    "image": "u3",
                    "message": "liked your post",
                    "time": "2h ago"
                  ],
                  [
                    "name": "Earl Garcia",
                    "image": "u4",
                    "message": "Started following you",
                    "time": "6h ago"
                  ]
                ]
              ],
              [
                "name": "This Week",
                "list": [
                  [
                    "name": "Ivey Wilson",
                    "image": "u1",
                    "message": "Started following you",
                    "time": "2d ago"
                  ],
                  [
                    "name": "Bradley Dame",
                    "image": "u2",
                    "message": "Started following you",
                    "time": "3d ago"
                  ]
                ]
              ],
              [
                "name": "This Month",
                "list": [
                  [
                    "name": "Tom Joy",
                    "image": "u3",
                    "message": "Started following you",
                    "time": "2w ago"
                  ],
                  [
                    "name": "Francis Fidler",
                    "image": "u4",
                    "message": "Started following you",
                    "time": "3w ago"
                  ]
                ]
              ]
    ]
        
    var body: some View {
        ZStack {
            
            ScrollView {
                Spacer()
                    .frame(height: . topInsets + 50)
                
                
                
                LazyVStack(spacing: 15) {
                    ForEach( 0..<notificationArr.count , id: \.self) { index in
                        
                        let nObj = notificationArr [index] as? NSDictionary ?? [:]
                        
                        VStack(alignment: .leading){
                            Text(nObj["name"] as? String ?? "")
                                
                                .font(.customfont(.bold, fontSize: 19))
                                .foregroundColor(.primaryText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            let notiArr = nObj["list"] as? NSArray ?? []
                            LazyVStack(spacing: 15) {
                                
                                ForEach( 0..<notiArr.count , id: \.self) { index in
                                    
                                    let notiObj = notiArr[index] as? [String:Any] ?? [:]
                                    NotificationRow(notiObj: notiObj)
                                }
                                
                                Divider()
                                
                            }
                            
                        }
                    }
                }
                .padding(.horizontal, 15)
                
                
                
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
                        
                        Text("Notifications")
                            
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

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
