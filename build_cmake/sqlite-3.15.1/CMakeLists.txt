cmake_minimum_required(VERSION 2.8.8)

project(sqlite3 C)

set(sqlite3_srcs
	../../sqlite-3.15.1/sqlite3.c
)

add_library(sqlite3static ${sqlite3_srcs})
