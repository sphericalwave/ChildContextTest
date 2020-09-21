//
//  PlusBtn.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import SwiftUI

struct PlusBtn: View
{
    @Binding var showModal: Bool
    
    var body: some View {
        Button(action: { self.showModal.toggle() } ) {
            Image(systemName: "plus")
                .foregroundColor(.black)
                .padding()
        }
    }
}
