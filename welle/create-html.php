#!/usr/bin/env php
<?php
declare(strict_types = 1);

use \SplFileObject as File;


$header = <<<TWOCOLSHEADER
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="general-style.css">
	<title></title>
</head>
<body>
<div id="container">
TWOCOLSHEADER;

$footer = <<<FOOTER
</div>
</body>
</html>
FOOTER;
 
   function process_strings(string $detext, string $entext)
   {
        
      if ($detext[0] == '-') {
           
          $par = "<p class='new-speaker'>"; 
          $detext = substr($detext, 2);

          $entext = substr($entext, 2); 
          
      } else 

         $par = '<p>';
       
       $ret = "{$par}$detext</p>{$par}$entext</p>";

       return $ret;
   }

  try {
     
     $defile = new File("die-welle.txt", "r");
     $enfile = new File("the-wave.txt", "r");

     $defile->setFlags(\SplFileObject::READ_AHEAD | \SplFileObject::SKIP_EMPTY | \SplFileObject::DROP_NEW_LINE);
     $enfile->setFlags(\SplFileObject::READ_AHEAD | \SplFileObject::SKIP_EMPTY | \SplFileObject::DROP_NEW_LINE);

     $outfile = new File("output.html", "w");

     $outfile->fwrite($header);  


     foreach($defile as $deline) {

        $enline = $enfile->fgets();

        $output = process_strings($deline, $enline); 

        $outfile->fwrite($output . "\n");
     } 

     $outfile->fwrite($footer);  

   } catch(\Exception $e)  {
     
        echo 'Caught Exception: ' . $e->getMessage() . ". Occurred at line: " . $e->getLine() . "\n";
  }
