//
//  ContentView.swift
//  haker-SwiftUI
//
//  Created by asmaa gamal  on 05/06/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(networkManager.posts , id:\.self  ){post in
                        NavigationLink(destination:PostDetailView(post:post)){
                            Text(post.title)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Hakers News")
    }
}

#Preview {
    ContentView()
}
