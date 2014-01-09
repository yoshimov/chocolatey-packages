@echo off

SET DIR=%~dp0%

java -jar %DIR%\plantuml.jar %*
