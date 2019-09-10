INSTALL_TARGET_PROCESSES = SpringBoard

TARGET = iphone:clang:latest:9.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = edit3d

edit3d_FILES = Tweak.xm
edit3d_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
