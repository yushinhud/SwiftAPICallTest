//
//  ViewModel.swift
//  SwiftAPICallTest
//
//  Created by Yushin Kim on 24/03/22.
//

import Foundation
import SwiftUI

struct BookList : Hashable, Codable {
    let author : String
    let email : String
    let title : String
}

class ViewModel : ObservableObject {
    
    @Published var books : [BookList] = []
    @Published var filteredBooks : [BookList] = []

    func fetch() {
        guard let url = URL(string: "https://training.xcelvations.com/data/books.json") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with:url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //convert to JSON
            do {
                var books = try JSONDecoder().decode([BookList].self, from: data)
                
                DispatchQueue.main.async {
                    books = books.sorted{ $0.title < $1.title }
                    self?.books = books
                }
            }
            
            catch{
                print(error)
            }
        }
        task.resume()
    }
}
