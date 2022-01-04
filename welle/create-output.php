<?php

$ofile = new \SplFileObject("output.txt", "w");

$ifile->setFlags(\SplFileObject::READ_AHEAD | \SplFileObject::SKIP_EMPTY | \SplFileObject::DROP_NEW_LINE);

foreach($ifile as $line) {
   
   if ($ifile->eof()) {

     ofile.write($line);
     return;
     
   }
   if (true == preg_match('/\.\.\.$/' , $line)) {
   
       $line2 = $ifile->fgets();
       
       if (true == preg_match('/^\.\.\.(.*)$/', $line2, $matches))

             $line .= $matches[1];

       else

             $line .= "\n" . $line2;
             
   } 
   echo $line . "\n";          
}
