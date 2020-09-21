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

struct CrtFdUI: View
{
    let crtFd: CrtFd
    @Environment(\.managedObjectContext) var childMoc
    
    var body: some View {
        VStack {
            Text("CrtFdUI")
            Text("CrtFd Scale = \(crtFd.scale)")
            Text("CrtFd.absFd.name = \(crtFd.absFd?.name ?? "WTF")")
        }
    }
}

extension CrtFd
{
    convenience init(scale: Double, absFd: AbsFd, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.absFd = absFd
        self.scale = scale
    }
}

extension AbsFd
{    
    convenience init(name: String, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.name = name
    }
}

