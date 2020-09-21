//
//  AbsFd.swift
//  ChildContextTest
//
//  Created by Aaron Anthony on 2020-09-21.
//  Copyright © 2020 SphericalWaveSoftware. All rights reserved.
//

import CoreData

extension AbsFd
{
    convenience init(name: String, moc: NSManagedObjectContext) {
        self.init(context: moc)
        self.name = name
    }
}
