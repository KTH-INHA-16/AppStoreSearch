//
//  SearchViewModel.swift
//  AppStoreSearch
//
//  Created by 김태훈 on 2023/03/18.
//

import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
    @Published var keyword: String = ""
    @Published var isChange: Bool = false
    @Published var isCommit: Bool = false {
        willSet {
            if newValue {
                search()
            }
        }
    }
}

extension SearchViewModel {
    func search() {
        print("hello world")
    }
}
