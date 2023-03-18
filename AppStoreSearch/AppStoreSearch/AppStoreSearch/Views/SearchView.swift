//
//  SearchView.swift
//  AppStoreSearch
//
//  Created by 김태훈 on 2023/03/18.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var appModel: AppStoreSearchModel
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 5)
                            .foregroundColor(.gray)
                        
                        TextField("게임, 앱, 스토리 등", text: $viewModel.keyword, onEditingChanged: {
                            viewModel.isCommit = false
                            viewModel.isChange = $0
                        }, onCommit: {
                            print(viewModel.keyword)
                            viewModel.isCommit = true
                        })
                        .autocorrectionDisabled(true)
                    }
                    .frame(height: 30)
                    .background(Color(red: 238/255, green: 238/255, blue: 239/255))
                    .cornerRadius(8)
                    
                    if viewModel.isChange {
                        Button("취소", action: {
                            viewModel.keyword = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        })
                        .background(Color.white)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                if !viewModel.isChange && viewModel.keyword.isEmpty && !viewModel.isCommit {
                    List {
                        Section() {
                            Text("최근 검색어")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                        }
                        
                        Section {
                            ForEach(appModel.history) {
                                Text($0.keyword)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .background(Color.white.opacity(0.1))
                } else {
                    
                }
                
                Spacer()

            }
            .navigationBarTitle(Text("검색"), displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                
            }, label: {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.top, 75)
            }))
            .navigationBarHidden(viewModel.isChange)
        }
        .onAppear {
            appModel.getHistory()
            print("hello")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(AppStoreSearchModel())
    }
}
