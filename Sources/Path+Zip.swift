//
//  Path+Zip.swift
//  FileZipKit
//
//  Created by Eric Marchand on 01/11/2017.
//  Copyright © 2017 Eric Marchand. All rights reserved.
//

import Foundation
import FileKit
import ZIPFoundation

extension Path {

    /// Zip current path to destination.
    /// - Throws:
    ///     `FileKitError.fileAlreadyExists`: if destination exists
    ///     `FileKitError.fileDoesNotExist`: if current path do not exists
    ///     `Archive.ArchiveError.unwritableArchive`
    ///     `Archive.ArchiveError.invalidStartOfCentralDirectoryOffset`
    ///     ...
    public func zip(to destination: Path) throws {
        if destination.exists {
            throw FileKitError.fileAlreadyExists(path: destination)
        }
        if !self.exists {
            throw FileKitError.fileDoesNotExist(path: self)
        }
        try FileManager.default.zipItem(at: self.url, to: destination.url)
    }

    /// Unzip current path to destination.
    /// - Throws:
    ///     `FileKitError.fileDoesNotExist`: if current path do not exists
    ///     `Archive.ArchiveError.unreadableArchive`
    ///     `Archive.ArchiveError.invalidEntryPath`
    ///     `Archive.ArchiveError.invalidCompressionMethod`
    ///     ...
    public func unzip(to destination: Path) throws {
        if !self.exists {
            throw FileKitError.fileDoesNotExist(path: self)
        }
        if !destination.parent.exists {
            try destination.createDirectory(withIntermediateDirectories: true)
        }
        do {
            try FileManager.default.unzipItem(at: self.url, to: destination.url)
        } catch let error as Archive.ArchiveError {
            throw error
        } catch {
            throw FileKitError.readFromFileFail(path: self, error: error)
        }
    }

    // TODO: could make Path optionnal and look for the better archive name.
}
