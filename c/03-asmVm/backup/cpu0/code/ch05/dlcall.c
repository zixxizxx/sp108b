// �sĶ���O�Ggcc -o dl_call dl_call.c �Vldl (�����b Linux ���sĶ�A Cygwin �P MinGW ����)
#include <dlfcn.h>

int main(void) {
 void *handle = dlopen ("libm.so", RTLD_LAZY);
 double (*cosine)(double);
 cosine = dlsym(handle, "cos");
 printf ("%f\n", (*cosine)(2.0));
 dlclose(handle);
 return 0;
}