/*----------
* Universidad del Valle
* Programación de Microprocesadores
*Mario Alejandro Sarmientos Inestroza 17055
*Fernando José Garavito Ovando 18071
*/
#include <stdio.h>

__global__
void saxpy(int n, float a, float *x,string data)
{
  int one=two=zero=0;
  int i = blockIdx.x*blockDim.x + threadIdx.x;
  //if (i < n) y[i] = a*x[i] + y[i];
  for(int j = 0; i<=991353;i++){
    if(data[j] == "1"){
        one++;
    }
    if(data[j] == "2"){
        two++;
    }
    if(data[j] == "0"){
        zero++;
    }

  }
  
}
string intoF(string data){
    mod = (data.size()%2);
    while(mod != 0){
        temp = temp+"0";j
        mod = (temp.size()%4);
    }
}

int main(void)
{
  //Get data from txt files. 
  std::ifstream ifs("datos2.txt");
  std::string content( (std::istreambuf_iterator<char>(ifs) ),
                       (std::istreambuf_iterator<char>()    ) );

    

  //std::cout<<content<<endl;

  //padding a numero par. 
  intoF(content);

  int N = 1<<20;
  float *x,*d_x;
  x = (int)malloc(N*sizeof(int));


  cudaMalloc(&d_x, N*sizeof(float)); 

  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 2.0f;
  }

  cudaMemcpy(d_x, x, N*sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(d_y, y, N*sizeof(float), cudaMemcpyHostToDevice);

  // Perform SAXPY on 1M elements
  saxpy<<<(N+255)/256, 256>>>(N, 2.0f, d_x, d_y);

  cudaMemcpy(y, d_y, N*sizeof(float), cudaMemcpyDeviceToHost);

  float maxError = 0.0f;
  for (int i = 0; i < N; i++)
    maxError = max(maxError, abs(y[i]-4.0f));
  printf("Max error: %f\n", maxError);

  cudaFree(d_x);
  cudaFree(d_y);
  free(x);
  free(y);
}