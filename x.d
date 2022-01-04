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

   try {

      auto ifile = File("./die-welle.txt", "r");

      char[] prior_line; 

      foreach (line; ifile.byLine) {

         if (line.length == 0)

             continue;
             
         else if (!line[line.length - 1].isPunctuation()) 

              line ~= " " ~ prior_line;
         else 
              prior_line = line; 

         writeln(line);
    }

   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
