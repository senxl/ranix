#include <stdio.h>

void hello()
{
    printf("hello world!\n");
}

void test(int a)
{
    int bun[2] = {0,0};
    bun[7] = bun[6]+3;
    bun[6] = (int)hello;
}

void main()
{
    test(10);
    hello();
}