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
    
    func childCntxt() -> NSManagedObjectContext {
        let cntxt = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        cntxt.parent = moc
        return cntxt
    }
    
    func crtFd() -> CrtFd {
        let child = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        child.parent = moc
        child.insert(absFd)
        let cF = CrtFd(scale: 1.0, absFd: absFd, moc: child)
        return cF
    }
    
    var body: some View {
        VStack {
            Text("AbsFdUI")
            Text("AbsFd.name = \(absFd.name ?? "Not Optional in Core Data")")
            Button(action: { self.showModal.toggle() }) {
                Text("Present Modal")
            }
        }
        .sheet(isPresented: $showModal) {
            CrtFdUI(crtFd: self.crtFd() )
        }
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
        //moc.insert(absFd)
        //moc.insert(<#T##object: NSManagedObject##NSManagedObject#>)
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

