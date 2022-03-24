//
//  ContentView.swift
//  SwiftAPICallTest
//
//  Created by Yushin Kim on 24/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { book in
                    NavigationLink(destination: BookDetailView(book:book), label: {
                        HStack{
                            Text(book.title)
                                .bold()
                        }
                        .padding(3)
                    })
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Books List")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
    
    var searchResults: [BookList] {
           if searchText.isEmpty {
               return viewModel.filteredArray
           } else {
               return viewModel.filteredArray.filter { $0.title.contains(searchText) }
           }
       }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

