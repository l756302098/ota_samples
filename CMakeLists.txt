cmake_minimum_required(VERSION 3.5)

# Set the project name
project (ota_samples)

SET(CMAKE_INSTALL_PREFIX /root/workspaces)

#准备的版本设置
SET(MAJOR_VERSION 1)
SET(MINOR_VERSION 0)
SET(PATCH_VERSION 0)

#说明要生成的是deb包
SET(CPACK_GENERATOR "DEB")

#设置版本信息
SET(CPACK_PACKAGE_VERSION_MAJOR "${MAJOR_VERSION}")
SET(CPACK_PACKAGE_VERSION_MINOR "${MINOR_VERSION}")
SET(CPACK_PACKAGE_VERSION_PATCH "${PATCH_VERSION}")

#设置安装包的包名，打好的包将会是packagename-version-linux.deb，如果不设置，默认是工程名
set(CPACK_PACKAGE_NAME "cn.ota_samples")

#设置程序名，就是程序安装后的名字
set(CPACK_DEBIAN_PACKAGE_NAME "ota_samples")

#设置架构
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "amd64")
#设置依赖
SET(CPACK_DEBIAN_PACKAGE_DEPENDS "libyaml-cpp (>= 0.6.2)")
#设置依赖
SET(CPACK_DEBIAN_PACKAGE_DEPENDS "libgoogle-glog-dev")
#设置description
SET(CPACK_PACKAGE_DESCRIPTION "ota test")

#设置联系方式
SET(CPACK_PACKAGE_CONTACT "support@pro.com")

#设置维护人
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "lyl")

find_package(Boost REQUIRED COMPONENTS filesystem system)

# check if boost was found
if(Boost_FOUND)
    message ("boost found")
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

find_package(yaml-cpp REQUIRED)
if(yaml-cpp_FOUND)
    message ("yaml-cpp found")
    message (${yaml-cpp_VERSION})
else()
    message ("Cannot find yaml-cpp")
endif()

include_directories(${Boost_INCLUDE_DIRS})
add_executable(yaml_samples main.cpp)

target_link_libraries(yaml_samples
${Boost_LIBRARIES}
yaml-cpp
glog)

install(TARGETS yaml_samples DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
install(DIRECTORY scripts DESTINATION ${CMAKE_INSTALL_PREFIX})
include(CPack)