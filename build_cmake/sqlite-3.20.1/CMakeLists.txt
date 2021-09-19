cmake_minimum_required(VERSION 3.0)

project(sqlite3 C)

set(sqlite3_srcs
	../../sqlite-3.20.1/sqlite3.c
)

add_library(sqlite3static ${sqlite3_srcs})
