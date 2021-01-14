
@echo off
cls
REM **************************************
REM Change these settings
REM **************************************
set MAGIC_CHECKOUT_PATH="C:\dev\Repository\git-checkout"
set MAGIC_TOMCAT_ROOT_PATH="C:\dev\Servers\expert\apache-tomcat-9.0.12"
REM **************************************
REM Important note: 
REM For dewfault this script uses JREBEL for hot deploy, without the need to deploy and restart
REM Tomcat if code changes happen. Take care to have JRebel installed
REM and catalina-rebel.bat in your Tomcat bin directory.
REM If you do not use JRebel you need to change the following settings.
REM **************************************
REM If you do not have JRebel comment out the following line:
set MAGIC_TOMCAT_START_SCRIPT="catalina-rebel.bat"
REM If you do not have JRebel uncomment the following line:
REM set MAGIC_TOMCAT_START_SCRIPT="catalina.bat"


REM **************************************
REM Defaults - Do NOT change these settings
REM **************************************
set MAGIC_VERSION="Ver. 1.1.0 - 14.01.2021"
set MAGIC_SKIPTESTS="-DskipTests"
set MAGIC_FORCE_UPDATE_SNAPSHOTS=FALSE
set MAGIC_DO_BUILD=FALSE
set MAGIC_DO_GIT_CHECKOUT=FALSE
set MAGIC_DO_GIT_PULL=TRUE
set MAGIC_PROJECT=UNDEFINED
set MAGIC_DEPLOY_WAR_PATH=%MAGIC_TOMCAT_ROOT_PATH%\webapps
set MAGIC_DEPLOY_EXPERT_LIB_PATH=%MAGIC_TOMCAT_ROOT_PATH%\webapps\vpuexpert\WEB-INF\lib
REM **************************************

@echo -------------------------------------------------------------------------------------------------------
@echo.
@echo   magic
@echo     Version: %MAGIC_VERSION%
@echo     by Christoph Wagner (hv11f41)
@echo     VpuExpert Build und Deploy Script
@echo.

REM **************************************
REM -------------------------------------------------------------------------------------------------------
REM Tests ausführen? Standardmäßig werden keine Tests ausgeführt
if 1%3==1noskip set MAGIC_SKIPTESTS=
REM -------------------------------------------------------------------------------------------------------
REM Beim Maven-Build SNAPSHOTS aktualisieren erzwingen
if 1%3==1updatesnapshots set MAGIC_FORCE_UPDATE_SNAPSHOTS=TRUE
if 1%4==1updatesnapshots set MAGIC_FORCE_UPDATE_SNAPSHOTS=TRUE

REM Es muss mindestens ein Parameter angegeben werden
if 1%1==1 (
	@echo -------------------------------------------------------------------------------------------------------
	@echo.
	@echo   Parameter muss angegeben werden!
	@echo.
	goto hilfe
)
REM Für deploylib muss eine Datei als zweiter Parameter angegeben werden
if 1%1==1deploylib if 1%2==1 (
	@echo -------------------------------------------------------------------------------------------------------
	@echo.
	@echo   FEHLER: .jar Datei muss angegeben werden!
	@echo.
	goto hilfe
) else (
	goto deploylib
)
REM Nur deploy von vpuexpert.war
if 1%1==1deploy goto deploy
if 1%1==1start-tomcat goto start-tomcat


REM Entweder nur Git Pull oder Git Pull und MVN starten
set MAGIC_PROJECT=%1
if 1%2==1mvn set MAGIC_DO_BUILD=TRUE
if 1%2==1mvnnopull set MAGIC_DO_BUILD=TRUE
if 1%2==1mvnnopull set MAGIC_DO_GIT_PULL=FALSE
if 1%2==1checkout (
	if 1%3 NEQ 1 (
		set MAGIC_DO_GIT_CHECKOUT=TRUE
		set MAGIC_GIT_CHECKOUT_BRANCH=%3
	)
)

goto printinfos

:hilfe
@echo -------------------------------------------------------------------------------------------------------
@echo.
@echo Aufruf Git Pull und/oder Maven Build:
@echo.
@echo   magic all ^| allg ^| adapter-clients ^| service ^| core ^| expert [mvn ^| mvnnopull] [noskip^| updatesnapshots] [updatesnapshots]
@echo.
@echo   magic all ^| allg ^| adapter-clients ^| service ^| core ^| expert checkout branch-to-checkout
@echo.
@echo Aufruf Deployment:
@echo.
@echo   magic deploy ^| deploylib full-path-to-file.jar
@echo.
@echo Aufruf Tomcat starten (vorher stoppen):
@echo.
@echo   magic start-tomcat
@echo.
@echo Beispiele:
@echo.
@echo   magic all                  	- alle Projekte, git pull, KEIN mvn build
@echo   magic all mvn               	- alle Projekte, git pull, mvn build
@echo   magic all mvn updatesnapshots	- alle Projekte, git pull, mvn build KEINE tests, force update snapshots
@echo   magic all mvn noskip       	- alle Projekte, git pull, mvn build MIT tests
@echo   magic core                 	- vpu-Core, git pull, KEIN mvn build
@echo   magic expert mvn           	- vpu-expert, git pull, mvn build MIT tests
@echo   magic expert mvnnopull     	- vpu-expert, KEIN git pull, mvn build MIT tests
@echo   magic service mvn noskip   	- vpu-service, git pull, mvn build MIT tests
@echo.
@echo   magic deploy               	- kopiert vpuexpert.war in das Tomcat webapps Verzeichnis
@echo   magic deploylib C:\test.jar	- kopiert C:\test.jar in das Tomcat vpuexpert-lib Verzeichnis
@echo.
@echo --- Checkout Parameter Details ----
@echo   magic all checkout feature^/name-of-branch
@echo --- git checkout des angegebenen Branch fuer alle Projekte, git pull, KEIN mvn build
@echo.
@echo   magic start-tomcat          	- Tomcat neu starten (im JPDA Debug-Modus)
@echo.
goto ende

:deploy
	@echo ---------------------------------------------------------------------------------------------
	@echo.
if exist %MAGIC_CHECKOUT_PATH%\vpu-expert\VpuExpert\target\vpuexpert.war (
	@echo Kopiere vpuexpert.war ins Tomcat-webapps Verzeichnis ...
	@echo    %MAGIC_DEPLOY_WAR_PATH%
	copy %MAGIC_CHECKOUT_PATH%\vpu-expert\VpuExpert\target\vpuexpert.war %MAGIC_DEPLOY_WAR_PATH%
	@echo.
) else (
	@echo FEHLER: %MAGIC_CHECKOUT_PATH%\vpu-expert\VpuExpert\target\vpuexpert.war nicht vorhanden!
	@echo.
)
goto ende

:deploylib
	@echo ---------------------------------------------------------------------------------------------
	@echo.
if 1%2==1 (
	@echo jar-Angabe fehlt!
	@echo .
	goto hilfe
)
if exist %2 (
	@echo Kopiere
	@echo     %2
	@echo ins Tomcat-VpuExpert-Lib-Verzeichnis
	@echo     %MAGIC_DEPLOY_EXPERT_LIB_PATH%
	@echo.
	copy %2 %MAGIC_DEPLOY_EXPERT_LIB_PATH%
	@echo.
) else (
	@echo FEHLER: %2 nicht vorhanden!
	@echo.
)
goto ende

:start-tomcat
cd %MAGIC_TOMCAT_ROOT_PATH%\bin
@echo -------------------------------------------------------------------------------------------------------
@echo.
@echo Stoppe Tomcat ...
@echo.
cmd.exe /c "%MAGIC_TOMCAT_START_SCRIPT% stop"
@echo.
@echo Starte Tomcat (Debug) ...
@echo.
cmd.exe /c "%MAGIC_TOMCAT_START_SCRIPT% jpda start"
@echo.
goto ende

:printinfos

@echo ------------------------------------------------------------------
@echo.
@echo ******************************************************************
@echo Lokale Git-Checkout-root:         %MAGIC_CHECKOUT_PATH%
@echo.
@echo Lokales Tomcat-Verzeichnis:       %MAGIC_TOMCAT_ROOT_PATH%
@echo VpuExpert-WAR-Deploy-Verzeichnis: %MAGIC_DEPLOY_WAR_PATH%
@echo VpuExpert-JAR-Deploy-Verzeichnis: %MAGIC_DEPLOY_EXPERT_LIB_PATH%
@echo ******************************************************************
@echo.
@echo Kommandorzeilen-Parameter:
@echo.
@echo Kommandozeilen-Parameter 1: %1
@echo Kommandozeilen-Parameter 2: %2
@echo Kommandozeilen-Parameter 3: %3
@echo Kommandozeilen-Parameter 4: %4
@echo.
@echo ******************************************************************
@echo.

if %MAGIC_PROJECT% NEQ UNDEFINED (
	@echo Berarbeite Projekt^(e^) %MAGIC_PROJECT%
	@echo.
)
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	@echo Git Checkout auf Branch %MAGIC_GIT_CHECKOUT_BRANCH% wird ausgefuehrt.
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	@echo Git Pull wird ausgefuehrt.
	@echo.
) else (
	@echo Git Pull wird NICHT ausgefuehrt.
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	@echo Maven-Build wird ausgefuehrt.
	@echo.
	if %MAGIC_FORCE_UPDATE_SNAPSHOTS%==TRUE (
		@echo Maven-Build: force update snapshots wird ausgefuehrt ^(^-U^)
		@echo.
	) else (
		@echo Maven-Build: force update snapshots wird NICHT ausgefuehrt ^(kein ^-U^)
		@echo.
	)
) else (
	@echo Maven-Build wird NICHT ausgefuehrt.
	@echo.
)
if 1%MAGIC_SKIPTESTS%==1 (
	@echo Tests werden ausgefuehrt.
	@echo.
) else (
	@echo.
	@echo Tests werden NICHT ausgefuehrt.
)
@echo.
if %MAGIC_PROJECT%==UNDEFINED goto hilfe
if %MAGIC_PROJECT%==all goto allg
if %MAGIC_PROJECT%==allg goto allg
if %MAGIC_PROJECT%==adapter-clients goto adapter-clients
if %MAGIC_PROJECT%==service goto service
if %MAGIC_PROJECT%==core goto core
if %MAGIC_PROJECT%==expert goto expert
goto ende

:allg
@echo -------------------------------------------------------------------------------------------------------
@echo.
@echo *** vpu-allg - vpu-all-bom ***
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg
	@echo Starte git checkout %MAGIC_GIT_CHECKOUT_BRANCH% ...
	@echo.
	git checkout %MAGIC_GIT_CHECKOUT_BRANCH%
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg\vpu-all-bom
	if %MAGIC_FORCE_UPDATE_SNAPSHOTS%==TRUE (
		cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C -U"
	) else (
		cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	)
	@echo.
)
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-allg - vpu-tec-bom ***
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg\vpu-tec-bom
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-allg - VpuMvnParent ***
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-allg\VpuMvnParent
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)
if %MAGIC_PROJECT%==allg goto ende

:adapter-clients
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-adapter-clients ***
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-adapter-clients
	@echo Starte git checkout %MAGIC_GIT_CHECKOUT_BRANCH% ...
	@echo.
	git checkout %MAGIC_GIT_CHECKOUT_BRANCH%
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-adapter-clients
	@echo.
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-adapter-clients\Build_VpuWebserviceClients
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)
if %MAGIC_PROJECT%==adapter-clients goto ende

:service
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-service ***
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-service
	@echo Starte git checkout %MAGIC_GIT_CHECKOUT_BRANCH% ...
	@echo.
	git checkout %MAGIC_GIT_CHECKOUT_BRANCH%
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-service
	@echo.
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-service\Build_VpuService
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)
if %MAGIC_PROJECT%==service goto ende

:core
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-core ***
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-core
	@echo Starte git checkout %MAGIC_GIT_CHECKOUT_BRANCH% ...
	@echo.
	git checkout %MAGIC_GIT_CHECKOUT_BRANCH%
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-core
	@echo.
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-core\Build_VpuCore
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)
if %MAGIC_PROJECT%==core goto ende

:expert
@echo.
@echo ------------------------------------------------------------------
@echo.
@echo *** vpu-expert ***
if %MAGIC_DO_GIT_CHECKOUT%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-expert
	@echo Starte git checkout %MAGIC_GIT_CHECKOUT_BRANCH% ...
	@echo.
	git checkout %MAGIC_GIT_CHECKOUT_BRANCH%
	@echo.
)
if %MAGIC_DO_GIT_PULL%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-expert
	@echo git pull ...
	@echo.
	git pull
	@echo.
)
if %MAGIC_DO_BUILD%==TRUE (
	cd %MAGIC_CHECKOUT_PATH%\vpu-expert\Build_VpuExpert
	cmd.exe /c "mvn clean install -Pdevelopment %MAGIC_SKIPTESTS% -T 1C"
	@echo.
)

:ende
@echo -------------------------------------------------------------------------------------------------------
@echo.
@echo  Fertig.
@echo.
@echo -------------------------------------------------------------------------------------------------------
@echo.
cd \dev
