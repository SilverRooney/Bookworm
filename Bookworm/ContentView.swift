//
//  ContentView.swift
//  Bookworm
//
//  Created by Silver on 7/3/22.
//

import SwiftUI

struct ContentView: View {
    // to store book data
    @Environment(\.managedObjectContext) var moc
    // all books saved so far, show updates in our ui
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    // bool to track add screen is showing or not
    @State private var showingAddScreen = false
    
    var body: some View {
        //add a little navigation view plus a button to add a new book
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        Text(book.title ?? "Unknown Title")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
