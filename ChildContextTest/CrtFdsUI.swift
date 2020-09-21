//
//  CrtFdsUI.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import CoreData
import SwiftUI

struct CrtFdsUI: View
{
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CrtFd.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CrtFd.scale, ascending: true)])
    var crtFds: FetchedResults<CrtFd>
    @State var showModal = false
    @ObservedObject var absFd: AbsFd
    
    func crtFdModal() -> CrtFdUI {
        print("func crtFdModal() -> CrtFdUI")
        let cF = CrtFd(scale: 1.0, absFd: absFd, moc: moc)
        return CrtFdUI(crtFd: cF)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.crtFds, id: \.objectID) {
                        CrtFdCell(crtFd: $0)
                    }
                }
                .navigationBarTitle("CrtFdsUI")
                .navigationBarItems(trailing: PlusBtn(showModal: $showModal))
            }
            .sheet(isPresented: $showModal) { self.crtFdModal() }
        }
    }
}
