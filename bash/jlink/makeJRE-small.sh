rm -rf out/jre
$JAVA_HOME/bin/jlink \
	--module-path $JAVA_HOME/jmods:out/production \
	--add-modules business.stockapp.ui \
	--launcher JOKER=business.stockapp.ui/business.stockapp.ui.Main \
	--compress 2	\
	--no-header-files	\
	--no-man-pages	\
	--strip-debug	\
	--output out/jre
