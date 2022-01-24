#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.regex;
import std.range;

/*
 * In D, types 'char', 'string', 'char[]' are all built-in types and all are UTF-8 character-encoded characters. wchar is utf-16 and dchar is utf-32. 
 */

void main(string[] args)
{
string header = q"EOS
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="general-style.css">
	<title></title>
</head>
<body>
<div id="container">
EOS";

string footer = q"EOS
</div>
</body>
</html>
EOS";

   try {

      auto ofile = File("output.html", "w");
      ofile.write(header);

      auto dfile = File("./die-welle.txt", "r");
      auto efile = File("./the-wave.txt", "r");

      char[] ebuf; 

      foreach (line; dfile.byLine) {

	  efile.readln(ebuf); 

	  string par;
	  int line_start = 0;

	  // '-' imples a new speaker.
          if (line[0] == '-') {

	        par =  "<p class='new-speaker'>" ;
		line_start = 2;

	  } else {

		par = "<p>"; 
	  }

          //auto par = (line[0] == '-') ?  "<p class='new-speaker'>" : "<p>"; 

          // Slice off the newline from ebuf
  
          ofile.writeln(par, line[line_start .. $], "</p>\n", par, ebuf[line_start .. ebuf.length - 1], "</p>");
      }

      ofile.write(footer);

   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }

}
