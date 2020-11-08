#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define __worm_h__
#ifndef __worm_h__
/* to be completed soon */
#endif

#define DATA_SIZE 1000
#define FILE_NAME "readme.txt"

#define random rand()
#define _BEAST_VERSION_NUMBER_ 0
#define _BEAST_VERSION_MINOR_  0
#define _BEAST_VERSION_PATCH_  1
#define _BEAST_VERSION_EXTRA_ "-dev"
#define _BEAST_VERSION "beast v0.0.1-dev"

int main( void ) {
  FILE* file_ptr = fopen( FILE_NAME, "w" );
  fclose( file_ptr );
  return 0;
}
