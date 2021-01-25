#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>

/* My attempt at re-creating the Unix/Linux command-line tool ls. */

                                                                            
int main(int argc, char *argv[])
{

  if (argc < 2) {
    fprintf(stdout, "Failure to initiate...\n");
    fprintf(stdout, "Proper Usage: %s <directory>\n", argv[0]);
    exit(1);
  }

  // Defining a pointer to DIR, etc
  DIR *dirPtr;
  dirPtr = opendir(argv[1]);

  // Defining a pointer to structure dirent
  struct dirent *sd;
  
  if (dirPtr == NULL) {
    fprintf(stdout, "Unable to access directory...\n");
    fprintf(stdout, "Try specifying the directory path, e.g.: ~/Desktop\n");
    exit(2);
  }

  while ((sd = readdir(dirPtr)) != NULL) {
    if (strcmp(sd->d_name, ".") == 0) 
      continue; 
    else if (strcmp(sd->d_name, "..") == 0)
      continue; 
    else if (strcmp(sd->d_name, "./") == 0)
      continue;
    else 
      fprintf(stdout, "%s\n", sd->d_name);
  }
      
  closedir(dirPtr);  
  return 0;
}
