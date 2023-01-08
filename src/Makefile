# Basic environment configuration

SYSROOT = $(THEOS)/sdks/iPhoneOS16.0.sdk/
ARCHS = arm64
TARGET = iphone:clang:latest:12.2

# Theos optimisations

FINALPACKAGE = 1
DEBUG = 0
THEOS_LEAN_AND_MEAN = 1
USING_JINX = 1

# Processes die if they are killed

INSTALL_TARGET_PROCESSES = SpringBoard

# Make Jinx work from SPM

XCDD_TOP = $(HOME)/Library/Developer/Xcode/DerivedData/
XCDD_MID = $(shell basename $(XCDD_TOP)/$(PWD)*)
XCDD_BOT = /SourcePackages/checkouts/Jinx/Sources/Jinx
JINX_LOC = $(XCDD_TOP)$(XCDD_MID)$(XCDD_BOT)

# Define included files, imported frameworks, etc.

LIBRARY_NAME = SatellaJailed
$(LIBRARY_NAME)_FILES = Sources/load.s $(shell find Sources/$(LIBRARY_NAME) -name '*.swift') $(shell find $(JINX_LOC) -name '*.swift')

# Theos makefiles to include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk
