//
//  Path+Archive.swift
//  FileZipKit
//
//  Created by Eric Marchand on 01/11/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation
import FileKit
import ZIPFoundation

extension Path {

    /// Get a zip archive from path.
    public func archive(mode: Archive.AccessMode) -> Archive? {
        return Archive(path: self, mode: mode)
    }

}
