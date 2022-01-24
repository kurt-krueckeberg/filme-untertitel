# Film Subtitles

## Directions

To download this repository as a **zip** file, click the green **Code** button above.

## Description

The subtitles files used to create the **.txt** and **.html** files (listed in the tables below) were downloaded from the free website [opensubtitles.org](https://www.opensubtitles.org/en/search/subs), which has [.srt](https://en.wikipedia.org/wiki/SRT)
subtitle files for many films in multiple languages. The **.srt** files (which are not included in this repository) were stripped of the .SRT time-sequence indicators (and other crap) and converted to text-only files (with the extension **.txt**).
The **.txt** files in turn were used as input (to some simple software I wrote)  to create the **.html** pages.

## To Create .html

```bash
$ create-html.php german-subtitles.txt english-subtitles.txt 
```

OR 

```d
$ ./build german-subtitles.txt english-subtitles.txt bilingual.html
```

Both will output the file output.html.

**Note:** The u.d code works just like the create.html code, except the input files are hard-coded.

### general-style.css

**general-style.css** the stylesheet for bilingual html files found in each subfolder.

## [Die drei Räuber](./three-robbers)

|File|Contents|
|----|--------|
|bilingual-three-robbers.html| |
|german-three-robbers.txt|German-only subtitles subtitles in a text file|
|english-three-robbers.txt|English-only subtitles in a text file|
|english-three-robbers-subtitles.html|English-only subtitles in one long webpage|
|german-three-robbers-subtitles.html|German-only subtitles in one long webpage|
|three-robbers-input-file.txt|File to bo be processed by code that produces webpages|


## [Jenseits der Stille](./jenseits)

|File|Contents|
|----|--------|
|bilingual-jensiets-der-still.html|German and Corresponding English subtitles as one long webpage|
|german-jenseits.txt|German-only subtitles subtitles in a text file| 
|english-jenseits.txt|English-only subtitles in a text file|
|english-jenseits-der-stille.html|English-only subtitles in one long webpage|
|german-jenseits.html|German-only subtitles in one long webpage||
|jenseits.txt|File to be processed by code that produces webpages|


## [Das Wunder von Bern](./wunder)

|File|Contents|
|----|--------|
|bilingual-untertitel.html|German and English subtitles webpage|
|english-untertitel.html|English subtitles webpage|
|german-untertitel.html|German subtitles webpage|
|wunder.txt|Input file for webpage creation|

## [Die Welle](./welle)

|File|Contents|
|----|--------|
|bilingual-die-welle.html|German and English subtitles die by side as a single, long webpage|
|die-welle.txt|German subtitles as text file | |
|the-wave.txt|English subtitles as text file |
