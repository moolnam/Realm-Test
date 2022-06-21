//
//  ContentView.swift
//  Realm-Test
//
//  Created by KimJongHee on 2022/06/20.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(Todo2.self) var toDos2
    @State private var title = ""
    
    @ObservedResults(Todo.self) var toDos
    @State private var name = ""
    @FocusState private var focus: Bool?
    @State private var searchFilter = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("입력", text: $title)
                Text("title: \(title)")
                Button(action: {
                    let newTodo2 = Todo2(title: title)
                    $toDos2.append(newTodo2)
                }, label: {
                    Text("버튼")
                })
                
                HStack {
                    TextField("일정 추가", text: $name)
                        .focused($focus, equals: true)
                        .textFieldStyle(.roundedBorder)
                        .font(.system(size: 30))
                    Spacer()
                    Button(action: {
                        let newTodo = Todo(name: name)
                        $toDos.append(newTodo)
                        name = ""
                        focus = nil
                    }, label: {
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 50))
                    })
                    .disabled(name.isEmpty)
                }
                .padding()
                
                List() {
                    ForEach(toDos.sorted(by: [
                        SortDescriptor(keyPath: "completed"),
                        SortDescriptor(keyPath: "urgncy", ascending: false)
                    ])) { item in
                        ToDoListView(todo: item)
                    }
//                    .onDelete(perform: $toDos.remove)
                    .listRowSeparator(.hidden)
                }
                .searchable(text: $searchFilter, collection: $toDos, keyPath: \.name) {
                    ForEach(toDos) { item in
                        Text(item.name)
                            .searchCompletion(item.name)
                    }
                }
                .listStyle(.plain)
            }
            .animation(.default, value: toDos)
            .navigationTitle("Realm")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
