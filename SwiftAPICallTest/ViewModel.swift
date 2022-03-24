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
    @Published var filteredArray : [BookList] = []

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
                let books = try JSONDecoder().decode([BookList].self, from: data)
                
                DispatchQueue.main.async {
                    self?.books = books
                    self?.updateSortedArray()
                }
            }
            
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func updateSortedArray()
    {
        filteredArray = books.sorted { (user1, user2) -> Bool in
            return user1.title < user2.title
        }
    }
}
