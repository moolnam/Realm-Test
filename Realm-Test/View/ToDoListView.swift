//
//  ToDoListView.swift
//  Realm-Test
//
//  Created by KimJongHee on 2022/06/21.
//

import SwiftUI
import RealmSwift

struct ToDoListView: View {
    
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        HStack {
            Button(action: {
                $todo.completed.wrappedValue.toggle()
            }, label: {
                Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")

            })
            .buttonStyle(.plain)
            TextField("", text: $todo.name)
                .font(.system(size: 20))
                .frame(height: 40)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Button(action: {
                $todo.urgncy.wrappedValue = todo.increment()
            }, label: {
                Text(todo.urgncy.text)
            })
            .padding()
            .frame(width: 100, height: 40)
            .foregroundColor(Color(.systemBackground))
            .background(RoundedRectangle(cornerRadius: 10).fill(todo.urgncy.color))
        }
        .padding(.all, 5)
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(todo: Todo(name: "Make The Bed"))
            .previewLayout(.sizeThatFits)
    }
}
