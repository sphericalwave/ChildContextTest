//
//  ContentView.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import SwiftUI
import CoreData

struct AbsFdUI: View
{
    @State var showModal = false
    @Environment(\.managedObjectContext) var moc
    let absFd: AbsFd
    
    func crtFdModal() -> CrtFdUI {
        let cF = CrtFd(scale: 1.0, absFd: absFd, moc: moc)
        return CrtFdUI(crtFd: cF)
    }
    
    var body: some View {
        VStack {
            Text("AbsFdUI")
            Text("AbsFd.name = \(absFd.name ?? "Not Optional in Core Data")")
            Button(action: { self.showModal.toggle() }) { Text("Present Modal") }
        }
        .sheet(isPresented: $showModal) { self.crtFdModal() }
    }
}
