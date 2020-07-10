export SDKVERSION = 13.4
ARCHS = arm64 arm64e

THEOS_DEVICE_IP=localhost
THEOS_DEVICE_PORT=2222

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CloseBreadcrumb

CloseBreadcrumb_FILES = Tweak.xm
CloseBreadcrumb_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
