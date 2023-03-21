#ifndef RANIX_STDIO_H
#define RANIX_STDIO_H

#include <ranix/stdarg.h>

int vsprintf(char *buf, const char *fmt, va_list args);
int sprintf(char *buf, const char *fmt, ...);

#endif