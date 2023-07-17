//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Fauzan Dwi Prasetyo on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    // MARK: - Views as properties
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }

    var body: some View {
        
        // MARK: - Behind the main SwiftUI
//        Text("Hello, world!")
//                    .padding()
//                    .background(.red)
        
        // fill the screen
//        Text("Hello, world!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
        
        
        // MARK: - Modifier order matters
        
        // switch between frame and background
//            Button("Hello, world!") {
//                print(type(of: self.body))
//            }
//            .font(.title.bold())
//            .background(.red)
//            .frame(width: 200, height: 200)
        
//        Text("Hello, world!")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)
        
        
        // MARK: - some View
        // not allowed
        // var body: View {
        //        Text("Hello World")
        //    }
        
        // allowed
        // var body: Text {
        //           Text("Hello World")
        //      }
        
//        Button("Hello World") {
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)
        
        // TupleView
//        TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>
        
        // wrapping multiple views in one TupleView
//        @ViewBuilder var body: Self.Body { get }
        

        // MARK: - Conditionals Modifiers
        // prefer use ternary operator
//        Button("Hello World") {
//            // flip the Boolean between true and false
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
//
//        // if else
//        if useRedText {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.red)
//        } else {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.blue)
//        }
        
        
        // MARK: - Environment Modifier
        // font() is environment modifier
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
//
//        // blur() is regular modifier
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 0)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .blur(radius: 5)
        
        
        // MARK: - View Composition
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//                .foregroundColor(.white)
//            CapsuleText(text: "Second")
//                .foregroundColor(.yellow)
//        }
        
        
        // MARK: - Custom Modifiers
//                Color.blue
//                    .frame(width: 300, height: 200)
//                    .watermarked(with: "Hacking with Swift")
        
        
        // MARK: - Custom Containers
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "\(row * 4 + col).circle")
//            Text("R\(row) C\(col)")
//        }
        
        // MARK: - Challenge 3 Project3
        Text("Custom View and Modifiers")
            .largeBlueTitle()
    }
}

// MARK: - View composition
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}


// MARK: - Custom Modifiers
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

// MARK: - Challenge 3 Project3
struct LargeBlueTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
    
    func largeBlueTitle() -> some View {
        modifier(LargeBlueTitle())
    }
}


// MARK: - Custom Containers
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
