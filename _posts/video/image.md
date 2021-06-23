## image magick

```bash
magick img.jpg -brightness-contrast 10x20 img.jpg
magick img.jpg -background white -page a4 doc.pdf
magick img.jpg -rotate 270 -resize 70% -background white -page a4 doc.pdf
magick img.jpg -rotate 270 -background white -page a4 doc.pdf
magick img.jpg -background white -page a4 -gravity center croquis.pdf
```

magick inbox.png -resize 90x90 inbox90.png
magick inbox.png -resize 50% inbox90.png
magick inbox.png -resize 4096@ inbox90.png
magick img.jpg -resize 800x600 -background white -page a4 -gravity center -extent 800x600 doc.pdf

jpegoptim --size=90k tecmint.jpeg

### Conversion from SVG to PNG

    inkscape -z -e __OUTPUT__.png -w 1024 -h 1024 __INPUT__.svg
    inkscape -f file.svg -A file.pdf
