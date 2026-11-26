#include <stdio.h>

unsigned int RUNPP_REG_ERR = 0;

unsigned long long postavi_jedinice(unsigned long long* vrednost);

void printbin64(unsigned long long x) {
    unsigned long long m=0x8000000000000000ULL;
    int s=0;
    while(m) {
        printf("%s%s",m&x ? "1" : "0",++s%8 ? "" : " ");
        m >>= 1;
    }
}

int main() {
    unsigned long long v, r;

    printf("Vrednost (hex): ");
    scanf("%llx",&v);
    printf("Binarno: ");
    printbin64(v);
    
    r = postavi_jedinice(&v);
    printf("\nIzlaz: ");
    printbin64(r);
    printf("\n");

    #ifdef LEVEL42
    printf("\nRUNPP_REG_ERR:%d\n",RUNPP_REG_ERR);
    #endif
    return 0;
}
