//
//  WelcomeView.swift
//  social_swiftui
//
//  Created by CodeForAny on 05/09/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: Color.primaryG, startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack{
                    Text("Hove an account already?")
                        .font(.customfont(.regular, fontSize: 14))
                    
                    NavigationLink {
                        LoginView() 
                    } label: {
                        Text("Login")
                            .font(.customfont(.regular, fontSize: 14))
                            .underline()
                    }

                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, .topInsets + 15)
                
                Spacer()
                
                Image("app_logo" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                HStack{
                    Text("Welcome to")
                        .font(.customfont(.regular, fontSize: 25))
                    
                    Text("Company.")
                        .font(.customfont(.bold, fontSize: 25))

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 15)
                
                
                Button {
                    
                } label: {
                    HStack {
                        Image("facebook" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                        
                        Text("Continue with Facebook")
                            .font(.customfont(.regular, fontSize: 15))
                            .foregroundColor(Color.primaryApp)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .center)
                .background(Color.bg)
                .cornerRadius(25)
                
                
                NavigationLink {
                    Step1View()
                } label: {
                    Text("Create Account")
                        .font(.customfont(.regular, fontSize: 15))
                }
                .frame(maxWidth: .infinity, minHeight: 54, alignment: .center)
                .overlay( RoundedRectangle(cornerRadius: 25).stroke( .white , lineWidth: 2) )
                .cornerRadius(25)
                
                VStack(alignment: .leading){
                    Text("By tapping Continue, Create account, I agree to Company's")
                        .font(.customfont(.regular, fontSize: 12))
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Terms of Service,")
                                .font(.customfont(.regular, fontSize: 12))
                                .underline()
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Payments Terms of Service,")
                                .font(.customfont(.regular, fontSize: 12))
                                .underline()
                        }

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Text("Privacy Policy, and Non-discrimination Policy.")
                            .font(.customfont(.regular, fontSize: 12))
                            .underline()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, .bottomInsets + 60)
                
            }
            .foregroundColor(Color.primaryTextW)
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            WelcomeView()
        }
        
    }
}
