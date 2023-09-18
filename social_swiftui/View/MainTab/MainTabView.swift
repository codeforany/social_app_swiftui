//
//  MainTabView.swift
//  social_swiftui
//
//  Created by CodeForAny on 07/09/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack{
                
                TabView(selection: $selectTab) {
                    HomeView()
                        .ignoresSafeArea()
                    .tag(0)
                    
                    StoriesView()
                    .tag(1)
                    
                    NotificationsView()
                    .tag(2)
                    
                    SearchView()
                    .tag(3)
                }
                .onAppear{
                    UITabBar.appearance().isHidden = true
                }
                
                
                HStack{
                    TabButton(title: "HOME", icon: "home_tab", isSelect: selectTab == 0) {
                        selectTab = 0
                    }
                    
                    TabButton(title: "STORIES", icon: "store_tab", isSelect: selectTab == 1) {
                        selectTab = 1
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    
                    TabButton(title: "NOTIFICATIONS", icon: "notification_tab", isSelect: selectTab == 2) {
                        selectTab = 2
                    }
                    
                    TabButton(title: "SEARCH", icon: "search_tab", isSelect: selectTab == 3) {
                        selectTab = 3
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .padding(.bottom, .bottomInsets)
                .frame(maxWidth: .infinity)
                .background(Rectangle().fill(Color.white).shadow( color: Color.black.opacity(0.15), radius: 5, y: -3))
                
            }
            
            NavigationLink {
                CreatePostView()
                
            } label: {
                ZStack {
                    LinearGradient(colors: Color.primaryG, startPoint: .top, endPoint: .bottom)
                        .overlay( RoundedRectangle(cornerRadius: 35)
                            .stroke( .white, lineWidth: 6))
                        .cornerRadius(35)
                        .shadow(radius: 5)
                       
                    Image("photo_center")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 70, height: 70)
                .padding(.bottom , .bottomInsets + 30)
            }

        }
        
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainTabView()
        }
    }
}
