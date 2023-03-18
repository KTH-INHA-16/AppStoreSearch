//
//  MainView.swift
//  AppStoreSearch
//
//  Created by 김태훈 on 2023/03/18.
//

import SwiftUI

struct MainView: View {
    @State private var appModel: AppStoreSearchModel = AppStoreSearchModel()
    @State private var tabViewSelection = 4
    
    var body: some View {
        TabView(selection: $tabViewSelection) {
            EmptyView()
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("투데이")
                }
                .tag(0)
            
            EmptyView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("게임")
                }
                .tag(1)
            
            EmptyView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("앱")
                }
                .tag(2)
            
            EmptyView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("아케이드")
                }
                .tag(3)
            
            SearchView()
                .environmentObject(appModel)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
                .tag(4)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
