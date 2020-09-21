//
//  CrtFd.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import CoreData

extension CrtFd
{
    convenience init(scale: Double, absFd: AbsFd, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.absFd = absFd
        self.scale = scale
    }
}
