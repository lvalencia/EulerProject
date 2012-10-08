<?php
function permute($str,$i,$n) {
   if ($i == $n)
       print "$str\n";
   else {
        for ($j = $i; $j < $n; $j++) {
          swap($str,$i,$j);
          permute($str, $i+1, $n);
          swap($str,$i,$j); // backtrack.
       }
   }
}
function swap(&$str,$i,$j) {
    $temp = $str[$i];
    $str[$i] = $str[$j];
    $str[$j] = $temp;
}   
$str = "0123456789";
permute($str,0,strlen($str)); 
