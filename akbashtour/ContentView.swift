//
//  ContentView.swift
//  akbashtour
//
//  Created by Mert AKBAŞ on 10.10.2022.
//

import SwiftUI
import WebKit
import UIKit

struct ContentView: View {
    let appearance = UINavigationBarAppearance()
    
    
    @State private var showWebView = false
       private let urlString: String = "https://www.akbashtour.com"
       
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack {
                Color(red: 61 / 255, green: 47 / 255, blue: 230 / 255).edgesIgnoringSafeArea(.all) // İtem bar rengini kendi sitenize göre ayarlayabilirsiniz.
                VStack() {
                            // Normal WebView
                            WebView(url: URL(string: urlString)!)
                            
                            // Create a link that opens in a new window
                            Link(destination: URL(string: urlString)!, label: {
                              
                            })
                            
                            
                        }
            }.edgesIgnoringSafeArea(.bottom) // bottom da safearea iptal edildi.
        }
       
    }
}

// WebView Struct
struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
