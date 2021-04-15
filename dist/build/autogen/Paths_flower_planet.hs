{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_flower_planet (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/tof/Library/Haskell/bin"
libdir     = "/Users/tof/Library/Haskell/ghc-8.4.2-x86_64/lib/flower-planet-0.1.0.0"
dynlibdir  = "/Users/tof/Library/Haskell/ghc-8.4.2-x86_64/lib/x86_64-osx-ghc-8.4.2"
datadir    = "/Users/tof/Library/Haskell/share/ghc-8.4.2-x86_64/flower-planet-0.1.0.0"
libexecdir = "/Users/tof/Library/Haskell/libexec/x86_64-osx-ghc-8.4.2/flower-planet-0.1.0.0"
sysconfdir = "/Users/tof/Library/Haskell/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "flower_planet_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "flower_planet_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "flower_planet_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "flower_planet_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "flower_planet_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "flower_planet_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
