rm -rf out/jre
$JAVA_HOME/bin/jlink \
	--module-path $JAVA_HOME/jmods:out/production \
	--add-modules business.stockapp.ui \
	--launcher CoolLauncher=business.stockapp.ui/business.stockapp.ui.Main \
	--output out/jre
