
@REM The variable %~dp0 (the current script's directory) is not available
@REM in Windows versions prior to Windows 7. You need to set the scriptdir
@REM variable manually (with forward slashes and with a trailing slash), e.g.
@REM set scriptdir=C:/Users/joe/myproject/calabash/

@set heap=1024m
@set sd=%~dp0
@set scriptdir=%sd:\=/%
@set distro=%scriptdir%/distro/
@set extensions=%scriptdir%/extensions/
@set adaptionsdir=%scriptdir%/../a9s
@set localdefs=%adaptionsdir%/common/calabash/localdefs.bat

@set javascriptext=%extensions%transpect/javascript-extension;%extensions%transpect/javascript-extension/lib/trireme.0.8.9.jar;%extensions%transpect/javascript-extension/lib/js.jar

@set epubckeckext=%extensions%transpect/epubcheck-extension/lib/common-image-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/common-io-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/common-lang-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/commons-compress-1.5.jar;%extensions%transpect/epubcheck-extension/lib/epubcheck_saxon-9.6.0.7.jar;%extensions%transpect/epubcheck-extension/lib/guava-14.0.1.jar;%extensions%transpect/epubcheck-extension/lib/imageio-core-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/imageio-jpeg-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/imageio-metadata-3.1.2.jar;%extensions%transpect/epubcheck-extension/lib/jackson-core-asl-1.9.12.jar;%extensions%transpect/epubcheck-extension/lib/jackson-mapper-asl-1.9.12.jar;%extensions%transpect/epubcheck-extension/lib/jing-20120724.0.0.jar;%extensions%transpect/epubcheck-extension/lib/sac-1.3.jar;%extensions%transpect/epubcheck-extension

@set config=%scriptdir%extensions/transpect/transpect-config.xml

@echo %scriptdir%saxon/saxon9he.jar

@set classpath=%scriptdir%saxon/saxon9he.jar;%extensions%transpect/rng-extension/jing.jar;%distro%lib/;%distro%lib/xmlresolver-0.12.3.jar;%distro%lib/htmlparser-1.4.jar;%distro%xmlcalabash-1.1.14-96.jar;%extensions%transpect/unzip-extension;%extensions%transpect/rng-extension;%extensions%transpect/image-transform-extension;%extensions%transpect/image-transform-extension/*;%extensions%transpect/image-props-extension;%extensions%transpect/image-props-extension/commons-imaging-1.0-SNAPSHOT.jar;%extensions%transpect/image-props-extension/xmlgraphics-commons-1.5.jar;%javascriptext%;%epubckeckext%

@REM call localdefs batch file to overwrite default values for classpath 
@REM or xproc-config
@if exist {%localdefs%} {call %localdefs%}


@java ^
   -cp %classpath% ^
   -Dfile.encoding=UTF8 ^
   -Dxml.catalog.files=file:///%scriptdir%xmlcatalog/catalog.xml ^
   -Dxml.catalog.catalog-class-name=org.apache.xml.resolver.Resolver ^
   -Xmx%heap% -Xss1024k ^
   com.xmlcalabash.drivers.Main ^
   -E org.xmlresolver.Resolver ^
   -U org.xmlresolver.Resolver ^
   -c %config% ^
   %*

