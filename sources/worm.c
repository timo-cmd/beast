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

#define _README_ "This is the Beast malware v0.01-dev\n\nEvery times when you hit any key on your keyboard this malwarw will delete a randomly choosed file on your system.\n\nDeveloped for fun and research. Use it ar your own risks. I am not responsible for any kind of damage omitted by Beast. I suggest you to run this on vms only!\n\n\tWritten by Timo Sarkar on November 2020" 
#define random rand()
#define _BEAST_VERSION_NUMBER_ 0
#define _BEAST_VERSION_MINOR_  0
#define _BEAST_VERSION_PATCH_  1
#define _BEAST_VERSION_EXTRA_ "-dev"
#define _BEAST_VERSION "beast v0.0.1-dev"

int main( void ) {
  FILE* file_ptr = fopen( FILE_NAME, "w" );
  fprintf( file_ptr, _README_ );
  fclose( file_ptr );
  return 0;
}
