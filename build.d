#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.regex;
import std.range;

/*
 * In D, types 'char', 'string', 'char[]' are all built-in UTF-8 character-encoded types. wchar is utf-16 and dchar is utf-32. 
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

    if (args.length < 4) {

        writeln("Enter German subtitle file name, followed by English subtitle file name, followed by name of output file.");
        return;
    }


   try {

      auto ofile = File(args[3], "w");

      ofile.write(header);

      auto dfile = File(args[1], "r");
      auto efile = File(args[2], "r");

      char[] ebuf; 

      foreach (line; dfile.byLine) {

	  efile.readln(ebuf); 

	  string ptag;
	  int line_start = 0;

          if (line[0] == '-') {// '-' imples a new speaker.

	        ptag =  "<p class='new-speaker'>" ;
		line_start = 2;

	  } else {

		ptag = "<p>"; 
	  }

          // Slice off the newline from ebuf
          ofile.writeln(ptag, line[line_start .. $], "</p>\n", ptag, ebuf[line_start .. ebuf.length - 1], "</p>");
      }

      ofile.write(footer);

   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
