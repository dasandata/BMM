#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char* argv[]) {  
  float x;
  float rock=0;  
  int i,j,N,M;
  
  N=4; M=8;

  if (argc == 3) {          // Set Loop Counts   
    N = atoi(argv[1]);      // Read as command line arguments
    M = atoi(argv[2]);
  }
  else {                    // Exit if incorrect number of arguments
    printf("Usage : ./a.out int int\n");
    exit(-1);
  }

  for(i=1;i<=N;i=i+1) {    
    for(j=1;j<=M;j=j+1) {      
      x=log((float) (i + j));     // Calculate the natural log of sum
      rock=rock+x;                // Accumulate Sum
    }  
  }  

  // Output
  printf("For loop counts N=%d M=%d\n",N,M);      
  printf("Sum=%f\n",rock);

  exit(0);
} 
