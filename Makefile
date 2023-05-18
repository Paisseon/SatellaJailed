# Basic environment configuration

export SYSROOT = $(THEOS)/sdks/iPhoneOS16.0.sdk/
export TARGET = iphone:clang:latest:12.2
export ROOTLESS = 0

# Theos optimisations

export FINALPACKAGE = 1
export DEBUG = 0
export THEOS_LEAN_AND_MEAN = 1
export USING_JINX = 1

# Define subprojects

SUBPROJECTS += Tweak

# Theos makefiles to include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

# Rootless support? with a question mark

ifeq ($(ROOTLESS),1)
internal-stage::
	@$(PRINT_FORMAT_MAKING) "Moving files to rootless paths"
	$(ECHO_NOTHING)mkdir -p "$(THEOS_STAGING_DIR)/var/jb/Library"$(ECHO_END)
	$(ECHO_NOTHING)mv "$(THEOS_STAGING_DIR)/Library" "$(THEOS_STAGING_DIR)/var/jb"$(ECHO_END)

before-package::
	@$(PRINT_FORMAT_MAKING) "Patching control file architecture"
	$(ECHO_NOTHING)sed -i '' 's/iphoneos-arm/iphoneos-arm64/' "$(THEOS_STAGING_DIR)/DEBIAN/control"$(ECHO_END)
endif
