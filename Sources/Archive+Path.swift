//
//  Archive+Path.swift
//  FileZipKit
//
//  Created by Eric Marchand on 01/11/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation
import FileKit
import ZIPFoundation

extension Archive {

    /// Init an archive from `Path`.
    public convenience init?(path: Path, mode: Archive.AccessMode) {
        self.init(url: path.url, accessMode: mode)
    }

    /// Extract an entry to `path`
    public func extract(_ entry: Entry, to path: Path, bufferSize: UInt32 = defaultReadChunkSize) throws -> CRC32 {
        return try self.extract(entry, to: path.url, bufferSize: bufferSize)
    }

}
