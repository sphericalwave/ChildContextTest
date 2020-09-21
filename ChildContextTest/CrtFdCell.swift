//
//  CrtFdCell.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import SwiftUI

struct CrtFdCell: View
{
    @ObservedObject var crtFd: CrtFd
    
    var body: some View {
        NavigationLink(destination: CrtFdUI(crtFd: crtFd)){
            HStack {
                VStack(alignment: .leading) {
                    Text("Scale \(crtFd.scale)")
                        .font(.headline)
                    Text("100cal, prtn: 10g, fat: 9g, carbs: 4g")
                        .font(.subheadline)
                        .lineLimit(1)
                }
                Spacer()
            }
        }
    }
}
