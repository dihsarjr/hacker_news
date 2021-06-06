//
//  ContentView.swift
//  HACKER NEWS
//
//  Created by Rashid on 06/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkMannager()
    
    var body: some View {
        NavigationView{
            
            List(networkManager.posts){post in
                NavigationLink(destination:DetailsView(url:post.url)){
                    HStack {
                        Text("\(post.points ?? 0)")
                        Text(post.title ?? "")
                    }
                }
                
                
            }
            .navigationTitle("HACKER NEWS")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



