rem Script to Sync Files from Development Terminal to Version Control

@echo off
setlocal enabledelayedexpansion

set SOURCE_DIR="C:\Program Files (x86)\AM MT4 - Terminal 2\MQL4\Include"
set DEST_DIR="E:\trading\Git\Include"

ROBOCOPY %SOURCE_DIR% %DEST_DIR% *.mqh