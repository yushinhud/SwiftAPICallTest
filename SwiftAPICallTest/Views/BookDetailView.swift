//
//  BookDetailView.swift
//  SwiftAPICallTest
//
//  Created by Yushin Kim on 24/03/22.
//

import SwiftUI

struct BookDetailView: View {
    
    var book: BookList
    var body: some View {
        VStack {
            Text("Title: " + "\"" + book.title + "\"")
                .bold()
                .padding()
            Text("Author: " + "\"" + book.author + "\"")
                .bold()
                .padding()
            Text("Email: " + "\"" + book.email + "\"")
                .bold()
                .padding()
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: BookList(author: "", email: "", title: ""))
    }
}
