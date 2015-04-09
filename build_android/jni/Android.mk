LOCAL_PATH := $(call my-dir)

BOOST_PATH				:= /cygdrive/c/Components/boost_trunk
BZLIB_PATH				:= ../../bzip2-1.0.6

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
LOCAL_CFLAGS			:= -Wno-extern-c-compat
LOCAL_C_INCLUDES		:= $(BOOST_PATH)
LOCAL_CPP_FEATURES		:= exceptions rtti

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE			:= libbzip2
LOCAL_SRC_FILES			:=	$(BZLIB_PATH)/blocksort.c \
							$(BZLIB_PATH)/bzlib.c \
							$(BZLIB_PATH)/compress.c \
							$(BZLIB_PATH)/crctable.c \
							$(BZLIB_PATH)/decompress.c \
							$(BZLIB_PATH)/huffman.c \
							$(BZLIB_PATH)/randtable.c
LOCAL_CFLAGS			:= -Wno-extern-c-compat
LOCAL_C_INCLUDES		:= $(BZLIB_PATH)
LOCAL_CPP_FEATURES		:= exceptions rtti

include $(BUILD_STATIC_LIBRARY)
