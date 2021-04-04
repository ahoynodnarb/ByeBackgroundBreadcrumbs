export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = byebackgroundbreadcrumbsprefs

byebackgroundbreadcrumbsprefs_FILES = BBBPRootListController.m
byebackgroundbreadcrumbsprefs_INSTALL_PATH = /Library/PreferenceBundles
byebackgroundbreadcrumbsprefs_FRAMEWORKS = UIKit
byebackgroundbreadcrumbsprefs_PRIVATE_FRAMEWORKS = Preferences
byebackgroundbreadcrumbsprefs_CFLAGS = -fobjc-arc
byebackgroundbreadcrumbsprefs_LIBRARIES += sparkapplist

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/byebackgroundbreadcrumbsprefs.plist$(ECHO_END)
