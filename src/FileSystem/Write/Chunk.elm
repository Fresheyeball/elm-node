module FileSystem.Write.Chunk (..) where


fs : JSRaw
fs =
    unsafeRequire "fs"


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile' : WriteFileOptions -> FilePath -> Chunk -> Task FileSystemError ()
writeFile' options path chunk =
    case chunk of
        Left s ->
            writeFileString' options path s

        Right b ->
            writeFileBuffer' options path b


{-| fs.writeFile(file, data[, options], callback)
-}
writeFile : FilePath -> Chunk -> Task FileSystemError ()
writeFile =
    writeFile' defaultWriteFileOptions
