cmake_minimum_required(VERSION 3.20)

project(maqao LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 26)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(maqao
    main.cpp
)

target_compile_options(maqao PRIVATE
    -Wall
)