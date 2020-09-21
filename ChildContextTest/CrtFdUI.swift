//
//  CrtFdUI.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import SwiftUI

struct CrtFdUI: View
{
    @ObservedObject var crtFd: CrtFd
    @Environment(\.managedObjectContext) var childMoc
    
    var body: some View {
        VStack {
            Text("CrtFdUI")
            Text("CrtFd Scale = \(crtFd.scale)")
            Text("CrtFd.absFd.name = \(crtFd.absFd?.name ?? "WTF")")
        }
        .navigationBarTitle("CrtFdUI")
    }
}
