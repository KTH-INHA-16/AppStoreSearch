//
//  AppStoreSearchModel.swift
//  AppStoreSearch
//
//  Created by 김태훈 on 2023/03/18.
//

import Foundation
import Combine

final class AppStoreSearchModel: ObservableObject {
    @Published var history: [History] = []
}

extension AppStoreSearchModel {
    func getHistory() {
        guard let history = UserDefaults.standard.stringArray(forKey: "history") else {
            return
        }
        
        self.history = history.map {
            History(keyword: $0)
        }
    }
    
    func saveHistory(keyword: String) {
        guard var history = UserDefaults.standard.stringArray(forKey: "history") else {
            return
        }
        
        history.append(keyword)
        UserDefaults.standard.set(history, forKey: "history")
    }
}

extension AppStoreSearchModel {
    struct History: Identifiable {
        let id = UUID()
        let keyword: String
    }
}
