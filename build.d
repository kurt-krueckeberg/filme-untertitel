#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.range;

/*
 * In D, types 'char', 'string', 'char[]' are all built-in UTF-8 character-encoded types. wchar is utf-16 and dchar is utf-32. 
 */

void main(string[] args)
{
string header = q"EOS
<!DOCTYPE html>
<html lang="de">
    <head>
      <title>TODO supply a title</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" media="screen" href="../screen.css" />
</head>
<body>
<section>
EOS";

string footer = q"EOS
</section>
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

          if (line[0] == '-') {   // '-' imples a new speaker.

	        ptag =  "<p class='new-speaker'>" ;
		line_start = 2;

	  } else {

		ptag = "<p>"; 
	  }

          // For ebug, we slice off the newline`
          ofile.writeln(ptag, line[line_start .. $], "</p>\n", ptag, ebuf[line_start .. ebuf.length - 1], "</p>");
      }

      ofile.write(footer);

   } catch (ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
