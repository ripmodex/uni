#include <stdio.h>
#include <stdlib.h>

const unsigned int MAX_SIZE = 32;

int countSafeTracks(unsigned int *tracks, unsigned int n, unsigned int k, unsigned int minBlocks);

unsigned int binaryStringToNumber(const char *str) {
    unsigned int num = 0, size = 0;
    while (*str != '\0') {
        num = (num << 1) | (*str - '0');
        str++;
    }
    return num;
}

int RUNPP_REG_ERR = 0;

int main() {
    unsigned int n, k, minBlocks;
    unsigned int *tracks;

#ifdef DEBUG
    n = 4;
    char **hardcoded_tracks = malloc(n * sizeof(char *));
    if (NULL == hardcoded_tracks) {
        printf("Neuspesna alokacija memorije.\n");
        exit(1);
    }

    hardcoded_tracks[0] = "11110000111100000000000000000000";
    hardcoded_tracks[1] = "11001100110011001100110011001100";
    hardcoded_tracks[2] = "11111100000011100000000000000000";
    hardcoded_tracks[3] = "10101010101010101010101010101010";
    tracks = malloc(n * sizeof(unsigned int));
    for (int i = 0; i < n; i++)
        tracks[i] = binaryStringToNumber(hardcoded_tracks[i]);
    free(hardcoded_tracks);
#else
    printf("Unesite broj staza: ");
    scanf("%u", &n);
    tracks = malloc(n * sizeof(unsigned int));
    printf("Unesite staze:\n");
    for (int i = 0; i < n; i++) {
        char binaryString[MAX_SIZE + 1];
        scanf("%s", binaryString);
        tracks[i] = binaryStringToNumber(binaryString);
    }
#endif

    printf("Unesite minimalnu duzinu grupe: ");
    scanf("%u", &k);
    printf("Unesite minimalan broj sigurnih blokova: ");
    scanf("%u", &minBlocks);
    printf("Rezultat: %d\n\n", countSafeTracks(tracks, n, k, minBlocks));

    free(tracks);
    return 0;
}
