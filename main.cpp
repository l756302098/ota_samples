/*
 * main.cpp
 *
 *  Created on: 12 01, 2021
 *      Author: liyanlong
 */
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <iostream>
#include <glog/logging.h>

int main(int argc, char *argv[])
{
    std::cout << "Start yaml demo!" << std::endl;
    // Initialize Google’s logging library.
    google::InitGoogleLogging(argv[0]);
    //所有级别的日志同时输出到标准输出设备
    google::LogToStderr();
    LOG(INFO) << "glod_init finish";
    size_t num_cookies = 0;
    while (1)
    {
        LOG(INFO) << "Found " << ++num_cookies << " cookies";
        sleep(1);
    }
    
    return 0;
}
