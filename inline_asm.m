//
//  main.c
//  Inline Assembly
//
//  Created by Pati on 19/04/2025.
//

#include <stdio.h>
#include <time.h>

int fast_add(int a, int b) {
    int result;
    __asm__ volatile (
        "add %w0, %w1, %w2\n"
        : "=r"(result)
        : "r"(a), "r"(b)
    );
    return result;
}

int add(int a, int b) {
    return a + b;
}


__attribute__((naked)) int dangerous(void) {
    __asm__ volatile (
        "mov x0, #42\n"  // próbujemy zwrócić 42
        "ret\n"
    );
}

int main(int argc, const char * argv[]) {
    // insert code here...
    
    
    int x = 0;
        clock_t start = clock();
        for (int i = 0; i < 100000000; i++) {
            x += add(1, 2);
        }
        clock_t end = clock();
        printf("C: %ld ms\n", (end - start) * 1000 / CLOCKS_PER_SEC);

        x = 0;
        start = clock();
        for (int i = 0; i < 100000000; i++) {
            x += fast_add(1, 2);
        }
        end = clock();
        printf("ASM: %ld ms\n", (end - start) * 1000 / CLOCKS_PER_SEC);

        return 0;
    
    return 0;
}
