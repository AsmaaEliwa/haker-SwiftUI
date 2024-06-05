//
//  PostDetailView.swift
//  haker-SwiftUI
//
//  Created by asmaa gamal  on 05/06/2024.
//

import SwiftUI
import WebKit
struct PostDetailView: View {
    var post:HitModel
    var body: some View {
        WebView(url: post.url  )
    }
}

//#Preview {
//    PostDetailView()
//}

struct WebView:UIViewRepresentable{   //using uikit componant to display web page
    let url:String?
    func makeUIView(context: Context) ->  WebView.UIViewType {
       WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string:url ?? "") {
             let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
   
    
}
