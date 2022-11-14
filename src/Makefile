SYSROOT = $(THEOS)/sdks/iPhoneOS16.0.sdk/
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:12.2

FINALPACKAGE = 1
DEBUG = 0
THEOS_LEAN_AND_MEAN = 1
FOR_RELEASE = 1
USING_JINX = 1

INSTALL_TARGET_PROCESSES = SpringBoard

LIBRARY_NAME = SatellaJailed
$(LIBRARY_NAME)_FILES = $(shell find Sources/$(LIBRARY_NAME) -name '*.swift') $(shell find Sources/$(LIBRARY_NAME)C -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
$(LIBRARY_NAME)_SWIFTFLAGS = -ISources/$(LIBRARY_NAME)C/include
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc -ISources/$(LIBRARY_NAME)C/include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk
