export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
export PREFIX = $(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/
export ARCHS = arm64
export TARGET = iphone:clang:latest:12.0

export FINALPACKAGE = 1
export DEBUG = 0
export THEOS_LEAN_AND_MEAN = 1

TWEAK_NAME = Satella
$(TWEAK_NAME)_FILES = $(TWEAK_NAME).x SatellaObserver.m SatellaDelegate.m SatellaPreferences.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_EXTRA_FRAMEWORKS = StoreKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
