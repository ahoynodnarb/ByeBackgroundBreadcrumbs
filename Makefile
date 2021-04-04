export PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ByeBackgroundBreadcrumbs

ByeBackgroundBreadcrumbs_FILES = Tweak.xm
ByeBackgroundBreadcrumbs_CFLAGS = -fobjc-arc
ByeBackgroundBreadcrumbs_LIBRARIES = sparkapplist

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += byebackgroundbreadcrumbsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
