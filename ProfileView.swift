//
//  ProfileView.swift
//  MyTin
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI

struct ProfileView: View {
    var image : Image

    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }){
                    ZStack{
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .cornerRadius(15)
                        Image(systemName: "arrow.left")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                Spacer()
                
                Text("profile")
                    .font(.headline)
                Spacer()
                
                Text("edit")
                    .font(.headline)
            }
            .padding(.trailing, 15)
            
            Image("Satoru Gojo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow( radius: 5)
            
            Text("Gojo satoru")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 10)
            
            Text("Gojosatoru@Gmail.com")
                .font(.subheadline)
                .foregroundColor(.black)
            
            Text("+62 81234567898")
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView(image: Image("Satoru Gojo"))
}
