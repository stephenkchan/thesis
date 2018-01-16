# Dissertate

## Getting started
1. Install LaTeX. For Mac OS X, we recommend MacTex (http://tug.org/mactex/); for Windows, MiKTeX (http://miktex.org/); and for Ubuntu, Tex Live (`sudo apt-get install texlive-full`)
2. Install the default fonts: EB Garamond, Lato, and Source Code Pro. The files are provided in `fonts/EB Garamond`, `fonts/Lato`, and `fonts/Source Code Pro`.
3. Personalize the document by filling out your name and all the other info in `frontmatter/personalize.md`.
4. Build your dissertation with `build.command`, located in the `scripts` directory (e.g., you can `cd` into the main directory and then run `./scripts/build.command`).

## FAQ

### How do I make the text justified instead of ragged right?
Remove or comment out the line `\RaggedRight` from the .cls file.

## S. Chan Repository Comments
1.  I took out references and figures from the repository to reduce bloat
2.  Template directory structure has been maintained even if some directories are dead.
3.  I have modified Dissertate.cls.  In addition to dropping in definitions from collaboration code, I have also changed the math font (Garamond does not play well with Greek super/subscripts) and made the references brackets instead of endnotes (following the convention in my field).