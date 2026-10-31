#include <stdio.h>
#include <stdlib.h>

static void init_matrix(float *m, int n, unsigned seed) {
    srand(seed);
    for (int i = 0; i < n * n; i++)
        m[i] = (float)rand() / RAND_MAX;
}

static void multiply(const float *restrict a, const float *restrict b,
                     float *restrict c, int n) {
    for (int i = 0; i < n; i++)
        for (int k = 0; k < n; k++) {
            float aik = a[i * n + k];
            for (int j = 0; j < n; j++)
                c[i * n + j] += aik * b[k * n + j];
        }
}

static double checksum(const float *m, int n) {
    double s = 0;
    for (int i = 0; i < n * n; i++)
        s += m[i];
    return s;
}

int main(int argc, char **argv) {
    int n = argc > 1 ? atoi(argv[1]) : 1024;
    float *a = malloc(sizeof(float) * n * n);
    float *b = malloc(sizeof(float) * n * n);
    float *c = calloc((size_t)n * n, sizeof(float));
    if (!a || !b || !c) { fprintf(stderr, "out of memory\n"); return 1; }

    init_matrix(a, n, 1);
    init_matrix(b, n, 2);
    multiply(a, b, c, n);
    printf("N=%d checksum=%.3f\n", n, checksum(c, n));

    free(a); free(b); free(c);
    return 0;
}
