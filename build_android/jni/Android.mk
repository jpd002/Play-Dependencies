LOCAL_PATH := $(call my-dir)

BOOST_PATH				:= /cygdrive/c/Components/boost_trunk

include $(CLEAR_VARS)

LOCAL_MODULE			:= libboost
LOCAL_SRC_FILES			:=	$(BOOST_PATH)/libs/chrono/src/chrono.cpp \
							$(BOOST_PATH)/libs/chrono/src/process_cpu_clocks.cpp \
							$(BOOST_PATH)/libs/chrono/src/thread_clock.cpp \
							$(BOOST_PATH)/libs/system/src/error_code.cpp \
							$(BOOST_PATH)/libs/filesystem/src/codecvt_error_category.cpp \
							$(BOOST_PATH)/libs/filesystem/src/operations.cpp \
							$(BOOST_PATH)/libs/filesystem/src/path.cpp \
							$(BOOST_PATH)/libs/filesystem/src/path_traits.cpp \
							$(BOOST_PATH)/libs/filesystem/src/portability.cpp \
							$(BOOST_PATH)/libs/filesystem/src/unique_path.cpp \
							$(BOOST_PATH)/libs/filesystem/src/utf8_codecvt_facet.cpp \
							$(BOOST_PATH)/libs/filesystem/src/windows_file_codecvt.cpp
LOCAL_C_INCLUDES		:= $(BOOST_PATH)
LOCAL_CPP_FEATURES		:= exceptions rtti

include $(BUILD_STATIC_LIBRARY)
