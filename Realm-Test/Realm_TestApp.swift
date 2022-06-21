//
//  Realm_TestApp.swift
//  Realm-Test
//
//  Created by KimJongHee on 2022/06/20.
//

import SwiftUI


@main
struct Realm_TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLatoutLogUnsatisfiable")
                }
        }
    }
}
