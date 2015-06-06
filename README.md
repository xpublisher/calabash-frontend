<<<<<<< HEAD
# calabash-frontend

Bash and .bat scripts, frequently used extensions, XML catalog for XML Calabash.

You can check out the whole thing using

```
git clone --recursive https://github.com/transpect/calabash-frontend calabash
```

transpect projects usually have their Calabash runtime attached as a submodule or as an svn external. It typically resides in a subdirectory `calabash` of the project. If the project directory is `${pdu}` (in oXygen notation), the Calabash frontend will use an XML catalog `${pdu}/xmlcatalog/catalog.xml` by default. This contains `<nextCatalog>` instructions that read the catalogs of the transpect libraries that the project uses. Catalog resolution is important since the XProc, XSLT, font, … files within the modules will only be addressed by their canonical locations (typically starting with `http//transpect.io`). 

Attaching this and its submodules as a submodule to a git repo works like this:

```
git submodule add  git@github.com:transpect/calabash-frontend.git calabash --recursive
git submodule update --recursive --init
```

If you are using this from an svn-based project, you need to incorporate no less than 5 externals. This is partly because Calabash now is modularized but mainly because we cannot stick `svn:externals` properties to github projects.

The externals are:

```
https://github.com/transpect/calabash-frontend/trunk calabash
https://github.com/transpect/calabash-distro/trunk calabash/distro
https://github.com/transpect/unzip-extension/trunk calabash/extensions/transpect/unzip-extension
https://github.com/transpect/rng-extension/trunk calabash/extensions/transpect/rng-extension
https://github.com/transpect/image-props-extension/trunk calabash/extensions/transpect/image-props-extension
```

You can add more externals under `calabash/extensions` if you need other Calabash extensions, or just put them anywhere you like. In each case, make sure to add the corresponding classpaths to the CLASSPATH environment variable (currently for the `calabash/calabash.sh` invocation only). If the extensions use the new Calabash 1.1 annotation/introspection mechanism, they should be instantly available.

There is a `calabash/calabash.bat` invocation for Windows. Users of Linux, MacOS X or Cygwin should use `calabash/calabash.sh`. Apart from the `$CLASSPATH`, the latter accepts `DEBUG` and `HEAP` as environment variables. Example:

```
HEAP=512m DEBUG=yes calabash/calabash.sh calabash/extensions/transpect/image-props-extension/image-identify-example.xpl
```
=======
# calabash-distro

This repo contains the default XML Calabash distribution as downloadable from http://xmlcalabash.com/download/. Don’t wonder why there’s a README in addition to this README.md. The README.md is the only file that does not originate from the distro. README is XML Calabash’s original README.

Its purpose is to provide a place for svn or git based projects to attach their XPRoc runtime via external or submodule.

It contains the modularized version of Calabash, currently 1.1.0 for Saxon 9.6.

This Calabash distro, together with a few other modules that almost every transpect projects needs, will be pulled as a submodule of [calabash-transpect](https://github.com/transpect/calabash-transpect) or as an external. Please see calabash-transpect’s README for instructions on how to include the Calabash externals/submodule into your project.
>>>>>>> e9c3501cf1471c9c8737321b9f389e56bafb3729
