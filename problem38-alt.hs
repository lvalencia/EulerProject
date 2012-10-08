import Data.List
main = print(head . filter ((=="123456789") . sort) . map (\i->(++) (show i) (show (2*i))) $ [9876,9875..])
