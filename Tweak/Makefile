# Theos optimisations

ARCHS = arm64

ifeq ($(ROOTLESS),1)
	TARGET = iphone:clang:latest:15.0
endif


# Processes die if they are killed

INSTALL_TARGET_PROCESSES = SpringBoard

# Make Jinx work from SPM

♎ = $(HOME)/Library/Developer/Xcode/DerivedData
♍ = $(shell find $(♎) -maxdepth 1 -type d -name "Tweak-*" -exec ls -td {} + | head -n 1)
♌ = /SourcePackages/checkouts/Jinx/Sources/Jinx
♏ = $(♍)$(♌)

# Define included files, imported frameworks, etc.

LIBRARY_NAME = SatellaJailed
$(LIBRARY_NAME)_FILES = Sources/load.s $(shell find Sources/$(LIBRARY_NAME) -name '*.swift') $(shell find $(♏) -name '*.swift')

# Theos makefiles to include

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
include $(THEOS_MAKE_PATH)/library.mk

# Rootless support? with a question mark

ifeq ($(ROOTLESS),1)
$(LIBRARY_NAME)_CFLAGS += -DJINX_ROOTLESS
DYLIB_PATH = $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/$(LIBRARY_NAME).dylib

internal-stage::
	@$(PRINT_FORMAT_MAKING) "Patching load commands for $(LIBRARY_NAME)"
	
	$(ECHO_NOTHING)for fw in $($(LIBRARY_NAME)_EXTRA_FRAMEWORKS); do \
		install_name_tool -change /Library/Frameworks/$$fw.framework/$$fw \
		/var/jb/Library/Frameworks/$$fw.framework/$$fw \
		"$(DYLIB_PATH)" > /dev/null 2>&1 ; \
	done$(ECHO_END)
	
	$(ECHO_NOTHING)for lib in $($(LIBRARY_NAME)_LIBRARIES); do \
		install_name_tool -change /usr/lib/lib$$lib.dylib \
		/var/jb/usr/lib/lib$$lib.dylib \
		"$(DYLIB_PATH)" > /dev/null 2>&1 ; \
	done$(ECHO_END)
	
	@$(PRINT_FORMAT_MAKING) "Re-signing $(LIBRARY_NAME)"
	
	$(ECHO_NOTHING)ldid -S "$(DYLIB_PATH)"$(ECHO_END)
endif
