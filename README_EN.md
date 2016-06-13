# Schematic Builder for ComputerCraft

*Leia-me em português: README.md*

This program takes a typical '.schematic' file as input, asks for all necessary materials and builds it. The schematic file should be in the NBT file format (typically used by MCEdit and WorldEdit). Also, it should be extracted (allmost every .schematic file is compressed as a gzip file, see **Usage** section).

## Credits

This script was originally developed by Orwell. Check [here](http://www.computercraft.info/forums2/index.php?/topic/1949-turtle-schematic-file-builder/) for the original topic on ComputerCraft forums!

## TOP TODO

* Add the data values for newer items;

## TODO

* Bundle Syli script to convert unzipped schematic files to plaintext (for pastebin use / servers);
* Implement GZIP (impossible for me?);

## Already Done:

* Added "support" for add wheat seeds in a slot to assign air and another unwanted blocks (another items will make the turtle stop);

## Setup

* [Install ComputerCraft](http://www.computercraft.info/download/) (more info on the link);
* Clone (or download as .zip) the *master* branch;
* Copy `scbuild` file and `schematics` folder (optional) for your relevant turtle folder;

## Usage

Find/create/download a specific .schematic file and decompress it (often: right click -> extract here, or use a specific file compression sofware, i recommend 7-zip).
Copy the file to the directory `schematics` (for better organization) of the relevant turtle.
Then use the command: `scbuild schematics\<your decompressed schematic file>`
It will ask for each material needed. For each material, you enter the numbers of all slots containing the material (separators don't matter). If you don't want to use the material (air is the most common example, and it's a workaround), add wheat seeds and press Enter.
Eventually it'll ask for a last key press and start building!

## Licence

I will try to contact the author about that.