# find boost; we use this for the testing framework
if(MINGW)
  set(Boost_COMPILER -gcc45)
endif(MINGW)
find_package(Boost 1.45.0 REQUIRED COMPONENTS unit_test_framework)
include_directories(${Boost_INCLUDE_DIRS})

foreach(TEST
        write_test)
    add_executable(${TEST} ${TEST}.cpp)
    target_link_libraries(${TEST} ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY} niflib)
    add_test(niflib::${TEST} ${TEST})
endforeach()
