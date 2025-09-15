import System.Directory
import System.FilePath.Posix
import System.IO
import Data.List
import Text.Printf

getFileList :: FilePath -> IO [FilePath]
getFileList directoryPath = listDirectory directoryPath

base_dir = "/home/a143753/Program/AOJ"

langs = ["rust", "haskell", "python"]
exts = [".rs", ".hs", ".py"]

rus_dir = "/home/a143753/Program/AOJ/rust"
has_dir = "/home/a143753/Program/AOJ/haskell"
pyt_dir = "/home/a143753/Program/AOJ/python"

bns ext fns = sort $ map takeBaseName $ filter (\ n -> (takeExtension n) == ext) fns

tab [] lfs = []
tab (u:us) lfs =
  let e = map (\(lang,fs) -> if elem u fs then lang else "" )  lfs
  in
    (u,e):(tab us lfs)

fmt :: (String, [String]) -> String
fmt (f, l) = printf "%-10s %10s %10s %10s" f (l!!0) (l!!1) (l!!2)

main :: IO ()
main = do
  let fds = map (\ lang -> base_dir ++ "/" ++ lang) langs

  -- 各言語のファイルリストを取得し,指定した拡張子のファイル名のみ抽出
  files <- mapM getFileList fds
  let fs = map (\ (ext, fns) -> bns ext fns) $ zip exts files

  -- file listの和集合
  let un = sort $ foldr1 union fs

  let tb = tab un $ zip langs fs
  mapM_ putStrLn $ map fmt tb
