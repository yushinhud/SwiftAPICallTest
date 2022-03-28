//
//  ContentView.swift
//  SwiftAPICallTest
//
//  Created by Yushin Kim on 24/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
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
                        .padding(10)
                    })
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Books")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
    
    var searchResults: [BookList] {
           if searchText.isEmpty {
               return viewModel.books
           } else {
               return viewModel.books.filter { $0.title.contains(searchText) }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

