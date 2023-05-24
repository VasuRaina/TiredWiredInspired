//
//  FeedViewTopBar.swift
//  TiredWiredInspired
//
//  Created by Vasu Raina on 5/21/23.
//

import SwiftUI

struct FeedViewTopBar: View {
    var body: some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.red, .pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        HStack (alignment: .center) {
            VStack{
                Spacer()
                Button(action: {}) {
                    
                    VStack(spacing: 4) { // Update VStack layout
                        
                        Text("Tired")
                        Image(systemName: "bed.double")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: geo.size.width / 2, height: 6)
                                .padding(.leading, geo.size.width / 4)
                            
                        }
                    }
                    .frame(height: 60)
                }
                .buttonStyle(PlainButtonStyle())
            }
            VStack{
                Spacer()
                // Other buttons with updated layout
                Button(action: {}) {
                    VStack(spacing: 4) {
                        Text("Wired")
                        Image(systemName: "bolt.heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: geo.size.width / 2, height: 6)
                                .padding(.leading, geo.size.width / 4)
                            
                        }
                        
                    }
                    .frame(height: 60)
                }
                .buttonStyle(PlainButtonStyle())
            }
            VStack{
                Spacer()
                Button(action: {}) {
                    VStack(spacing: 4) {
                        
                        Text("Inspired")
                        Image(systemName: "eye")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        
                        GeometryReader { geo in
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: geo.size.width / 2, height: 6)
                                .padding(.leading, geo.size.width / 4)
                            
                        }
                    }
                    .frame(height: 60)
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(height: 95)
        .background(gradient)
    }
}


struct FeedViewTopBar_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewTopBar()
    }
}
