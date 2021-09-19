cmake_minimum_required(VERSION 3.0)

project(lzmasdk)

set(lzmasdk_srcs
	../../lzmasdk-18.05/C/7zAlloc.c
	../../lzmasdk-18.05/C/7zArcIn.c
	../../lzmasdk-18.05/C/7zBuf.c
	../../lzmasdk-18.05/C/7zBuf2.c
	../../lzmasdk-18.05/C/7zCrc.c
	../../lzmasdk-18.05/C/7zCrcOpt.c
	../../lzmasdk-18.05/C/7zDec.c
	../../lzmasdk-18.05/C/7zFile.c
	../../lzmasdk-18.05/C/7zStream.c
	
	../../lzmasdk-18.05/C/Bcj2.c
	../../lzmasdk-18.05/C/Bcj2Enc.c
	
	../../lzmasdk-18.05/C/Bra.c
	../../lzmasdk-18.05/C/Bra86.c
	../../lzmasdk-18.05/C/BraIA64.c
	
	../../lzmasdk-18.05/C/CpuArch.c
	
	../../lzmasdk-18.05/C/Delta.c
	
	../../lzmasdk-18.05/C/LzFind.c
	../../lzmasdk-18.05/C/LzFindMt.c
	../../lzmasdk-18.05/C/Lzma2Dec.c
	../../lzmasdk-18.05/C/Lzma2DecMt.c
	../../lzmasdk-18.05/C/Lzma2Enc.c
	../../lzmasdk-18.05/C/Lzma86Dec.c
	../../lzmasdk-18.05/C/LzmaDec.c
	../../lzmasdk-18.05/C/LzmaEnc.c
	../../lzmasdk-18.05/C/LzmaLib.c
)

add_library(lzmasdk ${lzmasdk_srcs})
target_include_directories(lzmasdk PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../lzmasdk-18.05/C/)
