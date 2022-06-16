LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := adb_root_helper
LOCAL_SRC_FILES := lib.cpp
LOCAL_LDFLAGS := -nodefaultlibs
LOCAL_LDLIBS := -ldl

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := adbd
LOCAL_SRC_FILES := main.cpp
LOCAL_LDFLAGS := -static

include $(BUILD_EXECUTABLE)