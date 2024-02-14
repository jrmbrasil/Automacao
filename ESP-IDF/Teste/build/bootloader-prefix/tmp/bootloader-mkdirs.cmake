# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/sn1084363/esp/v5.1.2/esp-idf/components/bootloader/subproject"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/tmp"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/src/bootloader-stamp"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/src"
  "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/sn1084363/Documents/GitHub/Automacao/ESP-IDF/Teste/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
