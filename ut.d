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

      auto dfile = File("./die-welle.txt", "r");
      auto efile = File("./the-wave.txt", "r");

      foreach (line; dfile.byLine) {

          string estr = chomp( efile.readln() ); 

          writeln("<p>", line, "</p><p>", estr, "</p>");
    }

   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
