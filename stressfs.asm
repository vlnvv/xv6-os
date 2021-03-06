
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   f:	8d 94 24 1e 02 00 00 	lea    0x21e(%esp),%edx
  16:	bb 72 09 00 00       	mov    $0x972,%ebx
  1b:	b8 0a 00 00 00       	mov    $0xa,%eax
  20:	89 d7                	mov    %edx,%edi
  22:	89 de                	mov    %ebx,%esi
  24:	89 c1                	mov    %eax,%ecx
  26:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	c7 44 24 04 4f 09 00 	movl   $0x94f,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 4c 05 00 00       	call   588 <printf>
  memset(data, 'a', sizeof(data));
  3c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  43:	00 
  44:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4b:	00 
  4c:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  50:	89 04 24             	mov    %eax,(%esp)
  53:	e8 08 02 00 00       	call   260 <memset>

  for(i = 0; i < 4; i++)
  58:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  5f:	00 00 00 00 
  63:	eb 10                	jmp    75 <main+0x75>
    if(fork() > 0)
  65:	e8 86 03 00 00       	call   3f0 <fork>
  6a:	85 c0                	test   %eax,%eax
  6c:	7f 13                	jg     81 <main+0x81>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  6e:	ff 84 24 2c 02 00 00 	incl   0x22c(%esp)
  75:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  7c:	03 
  7d:	7e e6                	jle    65 <main+0x65>
  7f:	eb 01                	jmp    82 <main+0x82>
    if(fork() > 0)
      break;
  81:	90                   	nop

  printf(1, "write %d\n", i);
  82:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  89:	89 44 24 08          	mov    %eax,0x8(%esp)
  8d:	c7 44 24 04 62 09 00 	movl   $0x962,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 e7 04 00 00       	call   588 <printf>

  path[8] += i;
  a1:	8a 84 24 26 02 00 00 	mov    0x226(%esp),%al
  a8:	88 c2                	mov    %al,%dl
  aa:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b1:	01 d0                	add    %edx,%eax
  b3:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  ba:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c1:	00 
  c2:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  c9:	89 04 24             	mov    %eax,(%esp)
  cc:	e8 67 03 00 00       	call   438 <open>
  d1:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  d8:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  df:	00 00 00 00 
  e3:	eb 26                	jmp    10b <main+0x10b>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  e5:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  ec:	00 
  ed:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  f5:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
  fc:	89 04 24             	mov    %eax,(%esp)
  ff:	e8 14 03 00 00       	call   418 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 104:	ff 84 24 2c 02 00 00 	incl   0x22c(%esp)
 10b:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 112:	13 
 113:	7e d0                	jle    e5 <main+0xe5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 115:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 fc 02 00 00       	call   420 <close>

  printf(1, "read\n");
 124:	c7 44 24 04 6c 09 00 	movl   $0x96c,0x4(%esp)
 12b:	00 
 12c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 133:	e8 50 04 00 00       	call   588 <printf>

  fd = open(path, O_RDONLY);
 138:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 13f:	00 
 140:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 147:	89 04 24             	mov    %eax,(%esp)
 14a:	e8 e9 02 00 00       	call   438 <open>
 14f:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 156:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 15d:	00 00 00 00 
 161:	eb 26                	jmp    189 <main+0x189>
    read(fd, data, sizeof(data));
 163:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 16a:	00 
 16b:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 16f:	89 44 24 04          	mov    %eax,0x4(%esp)
 173:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 17a:	89 04 24             	mov    %eax,(%esp)
 17d:	e8 8e 02 00 00       	call   410 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 182:	ff 84 24 2c 02 00 00 	incl   0x22c(%esp)
 189:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 190:	13 
 191:	7e d0                	jle    163 <main+0x163>
    read(fd, data, sizeof(data));
  close(fd);
 193:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 19a:	89 04 24             	mov    %eax,(%esp)
 19d:	e8 7e 02 00 00       	call   420 <close>

  wait();
 1a2:	e8 59 02 00 00       	call   400 <wait>
  
  exit();
 1a7:	e8 4c 02 00 00       	call   3f8 <exit>

000001ac <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	57                   	push   %edi
 1b0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b4:	8b 55 10             	mov    0x10(%ebp),%edx
 1b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ba:	89 cb                	mov    %ecx,%ebx
 1bc:	89 df                	mov    %ebx,%edi
 1be:	89 d1                	mov    %edx,%ecx
 1c0:	fc                   	cld    
 1c1:	f3 aa                	rep stos %al,%es:(%edi)
 1c3:	89 ca                	mov    %ecx,%edx
 1c5:	89 fb                	mov    %edi,%ebx
 1c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1ca:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1cd:	5b                   	pop    %ebx
 1ce:	5f                   	pop    %edi
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    

000001d1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1dd:	90                   	nop
 1de:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e1:	8a 10                	mov    (%eax),%dl
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	88 10                	mov    %dl,(%eax)
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	8a 00                	mov    (%eax),%al
 1ed:	84 c0                	test   %al,%al
 1ef:	0f 95 c0             	setne  %al
 1f2:	ff 45 08             	incl   0x8(%ebp)
 1f5:	ff 45 0c             	incl   0xc(%ebp)
 1f8:	84 c0                	test   %al,%al
 1fa:	75 e2                	jne    1de <strcpy+0xd>
    ;
  return os;
 1fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 204:	eb 06                	jmp    20c <strcmp+0xb>
    p++, q++;
 206:	ff 45 08             	incl   0x8(%ebp)
 209:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
 20f:	8a 00                	mov    (%eax),%al
 211:	84 c0                	test   %al,%al
 213:	74 0e                	je     223 <strcmp+0x22>
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	8a 10                	mov    (%eax),%dl
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	8a 00                	mov    (%eax),%al
 21f:	38 c2                	cmp    %al,%dl
 221:	74 e3                	je     206 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	8a 00                	mov    (%eax),%al
 228:	0f b6 d0             	movzbl %al,%edx
 22b:	8b 45 0c             	mov    0xc(%ebp),%eax
 22e:	8a 00                	mov    (%eax),%al
 230:	0f b6 c0             	movzbl %al,%eax
 233:	89 d1                	mov    %edx,%ecx
 235:	29 c1                	sub    %eax,%ecx
 237:	89 c8                	mov    %ecx,%eax
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    

0000023b <strlen>:

uint
strlen(char *s)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 241:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 248:	eb 03                	jmp    24d <strlen+0x12>
 24a:	ff 45 fc             	incl   -0x4(%ebp)
 24d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	01 d0                	add    %edx,%eax
 255:	8a 00                	mov    (%eax),%al
 257:	84 c0                	test   %al,%al
 259:	75 ef                	jne    24a <strlen+0xf>
    ;
  return n;
 25b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 25e:	c9                   	leave  
 25f:	c3                   	ret    

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 266:	8b 45 10             	mov    0x10(%ebp),%eax
 269:	89 44 24 08          	mov    %eax,0x8(%esp)
 26d:	8b 45 0c             	mov    0xc(%ebp),%eax
 270:	89 44 24 04          	mov    %eax,0x4(%esp)
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	89 04 24             	mov    %eax,(%esp)
 27a:	e8 2d ff ff ff       	call   1ac <stosb>
  return dst;
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <strchr>:

char*
strchr(const char *s, char c)
{
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	83 ec 04             	sub    $0x4,%esp
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 290:	eb 12                	jmp    2a4 <strchr+0x20>
    if(*s == c)
 292:	8b 45 08             	mov    0x8(%ebp),%eax
 295:	8a 00                	mov    (%eax),%al
 297:	3a 45 fc             	cmp    -0x4(%ebp),%al
 29a:	75 05                	jne    2a1 <strchr+0x1d>
      return (char*)s;
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
 29f:	eb 11                	jmp    2b2 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a1:	ff 45 08             	incl   0x8(%ebp)
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8a 00                	mov    (%eax),%al
 2a9:	84 c0                	test   %al,%al
 2ab:	75 e5                	jne    292 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2ad:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2b2:	c9                   	leave  
 2b3:	c3                   	ret    

000002b4 <gets>:

char*
gets(char *buf, int max)
{
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2c1:	eb 42                	jmp    305 <gets+0x51>
    cc = read(0, &c, 1);
 2c3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ca:	00 
 2cb:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2d9:	e8 32 01 00 00       	call   410 <read>
 2de:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2e1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2e5:	7e 29                	jle    310 <gets+0x5c>
      break;
    buf[i++] = c;
 2e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
 2ed:	01 c2                	add    %eax,%edx
 2ef:	8a 45 ef             	mov    -0x11(%ebp),%al
 2f2:	88 02                	mov    %al,(%edx)
 2f4:	ff 45 f4             	incl   -0xc(%ebp)
    if(c == '\n' || c == '\r')
 2f7:	8a 45 ef             	mov    -0x11(%ebp),%al
 2fa:	3c 0a                	cmp    $0xa,%al
 2fc:	74 13                	je     311 <gets+0x5d>
 2fe:	8a 45 ef             	mov    -0x11(%ebp),%al
 301:	3c 0d                	cmp    $0xd,%al
 303:	74 0c                	je     311 <gets+0x5d>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 305:	8b 45 f4             	mov    -0xc(%ebp),%eax
 308:	40                   	inc    %eax
 309:	3b 45 0c             	cmp    0xc(%ebp),%eax
 30c:	7c b5                	jl     2c3 <gets+0xf>
 30e:	eb 01                	jmp    311 <gets+0x5d>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 310:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 311:	8b 55 f4             	mov    -0xc(%ebp),%edx
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	01 d0                	add    %edx,%eax
 319:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <stat>:

int
stat(char *n, struct stat *st)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 327:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 32e:	00 
 32f:	8b 45 08             	mov    0x8(%ebp),%eax
 332:	89 04 24             	mov    %eax,(%esp)
 335:	e8 fe 00 00 00       	call   438 <open>
 33a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 33d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 341:	79 07                	jns    34a <stat+0x29>
    return -1;
 343:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 348:	eb 23                	jmp    36d <stat+0x4c>
  r = fstat(fd, st);
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 44 24 04          	mov    %eax,0x4(%esp)
 351:	8b 45 f4             	mov    -0xc(%ebp),%eax
 354:	89 04 24             	mov    %eax,(%esp)
 357:	e8 f4 00 00 00       	call   450 <fstat>
 35c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 35f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 362:	89 04 24             	mov    %eax,(%esp)
 365:	e8 b6 00 00 00       	call   420 <close>
  return r;
 36a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <atoi>:

int
atoi(const char *s)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 375:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 37c:	eb 21                	jmp    39f <atoi+0x30>
    n = n*10 + *s++ - '0';
 37e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 381:	89 d0                	mov    %edx,%eax
 383:	c1 e0 02             	shl    $0x2,%eax
 386:	01 d0                	add    %edx,%eax
 388:	d1 e0                	shl    %eax
 38a:	89 c2                	mov    %eax,%edx
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	8a 00                	mov    (%eax),%al
 391:	0f be c0             	movsbl %al,%eax
 394:	01 d0                	add    %edx,%eax
 396:	83 e8 30             	sub    $0x30,%eax
 399:	89 45 fc             	mov    %eax,-0x4(%ebp)
 39c:	ff 45 08             	incl   0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	8a 00                	mov    (%eax),%al
 3a4:	3c 2f                	cmp    $0x2f,%al
 3a6:	7e 09                	jle    3b1 <atoi+0x42>
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8a 00                	mov    (%eax),%al
 3ad:	3c 39                	cmp    $0x39,%al
 3af:	7e cd                	jle    37e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    

000003b6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3bc:	8b 45 08             	mov    0x8(%ebp),%eax
 3bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3c8:	eb 10                	jmp    3da <memmove+0x24>
    *dst++ = *src++;
 3ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3cd:	8a 10                	mov    (%eax),%dl
 3cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3d2:	88 10                	mov    %dl,(%eax)
 3d4:	ff 45 fc             	incl   -0x4(%ebp)
 3d7:	ff 45 f8             	incl   -0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3da:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 3de:	0f 9f c0             	setg   %al
 3e1:	ff 4d 10             	decl   0x10(%ebp)
 3e4:	84 c0                	test   %al,%al
 3e6:	75 e2                	jne    3ca <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3eb:	c9                   	leave  
 3ec:	c3                   	ret    
 3ed:	66 90                	xchg   %ax,%ax
 3ef:	90                   	nop

000003f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f0:	b8 01 00 00 00       	mov    $0x1,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <exit>:
SYSCALL(exit)
 3f8:	b8 02 00 00 00       	mov    $0x2,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <wait>:
SYSCALL(wait)
 400:	b8 03 00 00 00       	mov    $0x3,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <pipe>:
SYSCALL(pipe)
 408:	b8 04 00 00 00       	mov    $0x4,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <read>:
SYSCALL(read)
 410:	b8 05 00 00 00       	mov    $0x5,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <write>:
SYSCALL(write)
 418:	b8 10 00 00 00       	mov    $0x10,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <close>:
SYSCALL(close)
 420:	b8 15 00 00 00       	mov    $0x15,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <kill>:
SYSCALL(kill)
 428:	b8 06 00 00 00       	mov    $0x6,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <exec>:
SYSCALL(exec)
 430:	b8 07 00 00 00       	mov    $0x7,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <open>:
SYSCALL(open)
 438:	b8 0f 00 00 00       	mov    $0xf,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <mknod>:
SYSCALL(mknod)
 440:	b8 11 00 00 00       	mov    $0x11,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <unlink>:
SYSCALL(unlink)
 448:	b8 12 00 00 00       	mov    $0x12,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <fstat>:
SYSCALL(fstat)
 450:	b8 08 00 00 00       	mov    $0x8,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <link>:
SYSCALL(link)
 458:	b8 13 00 00 00       	mov    $0x13,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <mkdir>:
SYSCALL(mkdir)
 460:	b8 14 00 00 00       	mov    $0x14,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <chdir>:
SYSCALL(chdir)
 468:	b8 09 00 00 00       	mov    $0x9,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <dup>:
SYSCALL(dup)
 470:	b8 0a 00 00 00       	mov    $0xa,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <getpid>:
SYSCALL(getpid)
 478:	b8 0b 00 00 00       	mov    $0xb,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <sbrk>:
SYSCALL(sbrk)
 480:	b8 0c 00 00 00       	mov    $0xc,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <sleep>:
SYSCALL(sleep)
 488:	b8 0d 00 00 00       	mov    $0xd,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <uptime>:
SYSCALL(uptime)
 490:	b8 0e 00 00 00       	mov    $0xe,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <getppid>:
SYSCALL(getppid)        // USER DEFINED SYS CALL
 498:	b8 16 00 00 00       	mov    $0x16,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <icount>:
SYSCALL(icount)         // USER DEFINED SYS CALL
 4a0:	b8 17 00 00 00       	mov    $0x17,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <signal>:
SYSCALL(signal)         // USER DEFINED SYS CALL
 4a8:	b8 18 00 00 00       	mov    $0x18,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	83 ec 28             	sub    $0x28,%esp
 4b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4bc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c3:	00 
 4c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	89 04 24             	mov    %eax,(%esp)
 4d1:	e8 42 ff ff ff       	call   418 <write>
}
 4d6:	c9                   	leave  
 4d7:	c3                   	ret    

000004d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d8:	55                   	push   %ebp
 4d9:	89 e5                	mov    %esp,%ebp
 4db:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4e5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e9:	74 17                	je     502 <printint+0x2a>
 4eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ef:	79 11                	jns    502 <printint+0x2a>
    neg = 1;
 4f1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fb:	f7 d8                	neg    %eax
 4fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 500:	eb 06                	jmp    508 <printint+0x30>
  } else {
    x = xx;
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 508:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 50f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 512:	8b 45 ec             	mov    -0x14(%ebp),%eax
 515:	ba 00 00 00 00       	mov    $0x0,%edx
 51a:	f7 f1                	div    %ecx
 51c:	89 d0                	mov    %edx,%eax
 51e:	8a 80 c4 0b 00 00    	mov    0xbc4(%eax),%al
 524:	8d 4d dc             	lea    -0x24(%ebp),%ecx
 527:	8b 55 f4             	mov    -0xc(%ebp),%edx
 52a:	01 ca                	add    %ecx,%edx
 52c:	88 02                	mov    %al,(%edx)
 52e:	ff 45 f4             	incl   -0xc(%ebp)
  }while((x /= base) != 0);
 531:	8b 55 10             	mov    0x10(%ebp),%edx
 534:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 537:	8b 45 ec             	mov    -0x14(%ebp),%eax
 53a:	ba 00 00 00 00       	mov    $0x0,%edx
 53f:	f7 75 d4             	divl   -0x2c(%ebp)
 542:	89 45 ec             	mov    %eax,-0x14(%ebp)
 545:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 549:	75 c4                	jne    50f <printint+0x37>
  if(neg)
 54b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 54f:	74 2c                	je     57d <printint+0xa5>
    buf[i++] = '-';
 551:	8d 55 dc             	lea    -0x24(%ebp),%edx
 554:	8b 45 f4             	mov    -0xc(%ebp),%eax
 557:	01 d0                	add    %edx,%eax
 559:	c6 00 2d             	movb   $0x2d,(%eax)
 55c:	ff 45 f4             	incl   -0xc(%ebp)

  while(--i >= 0)
 55f:	eb 1c                	jmp    57d <printint+0xa5>
    putc(fd, buf[i]);
 561:	8d 55 dc             	lea    -0x24(%ebp),%edx
 564:	8b 45 f4             	mov    -0xc(%ebp),%eax
 567:	01 d0                	add    %edx,%eax
 569:	8a 00                	mov    (%eax),%al
 56b:	0f be c0             	movsbl %al,%eax
 56e:	89 44 24 04          	mov    %eax,0x4(%esp)
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	89 04 24             	mov    %eax,(%esp)
 578:	e8 33 ff ff ff       	call   4b0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 57d:	ff 4d f4             	decl   -0xc(%ebp)
 580:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 584:	79 db                	jns    561 <printint+0x89>
    putc(fd, buf[i]);
}
 586:	c9                   	leave  
 587:	c3                   	ret    

00000588 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 58e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 595:	8d 45 0c             	lea    0xc(%ebp),%eax
 598:	83 c0 04             	add    $0x4,%eax
 59b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 59e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a5:	e9 78 01 00 00       	jmp    722 <printf+0x19a>
    c = fmt[i] & 0xff;
 5aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b0:	01 d0                	add    %edx,%eax
 5b2:	8a 00                	mov    (%eax),%al
 5b4:	0f be c0             	movsbl %al,%eax
 5b7:	25 ff 00 00 00       	and    $0xff,%eax
 5bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c3:	75 2c                	jne    5f1 <printf+0x69>
      if(c == '%'){
 5c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c9:	75 0c                	jne    5d7 <printf+0x4f>
        state = '%';
 5cb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d2:	e9 48 01 00 00       	jmp    71f <printf+0x197>
      } else {
        putc(fd, c);
 5d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5da:	0f be c0             	movsbl %al,%eax
 5dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	89 04 24             	mov    %eax,(%esp)
 5e7:	e8 c4 fe ff ff       	call   4b0 <putc>
 5ec:	e9 2e 01 00 00       	jmp    71f <printf+0x197>
      }
    } else if(state == '%'){
 5f1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f5:	0f 85 24 01 00 00    	jne    71f <printf+0x197>
      if(c == 'd'){
 5fb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5ff:	75 2d                	jne    62e <printf+0xa6>
        printint(fd, *ap, 10, 1);
 601:	8b 45 e8             	mov    -0x18(%ebp),%eax
 604:	8b 00                	mov    (%eax),%eax
 606:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 60d:	00 
 60e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 615:	00 
 616:	89 44 24 04          	mov    %eax,0x4(%esp)
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	89 04 24             	mov    %eax,(%esp)
 620:	e8 b3 fe ff ff       	call   4d8 <printint>
        ap++;
 625:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 629:	e9 ea 00 00 00       	jmp    718 <printf+0x190>
      } else if(c == 'x' || c == 'p'){
 62e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 632:	74 06                	je     63a <printf+0xb2>
 634:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 638:	75 2d                	jne    667 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 63a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63d:	8b 00                	mov    (%eax),%eax
 63f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 646:	00 
 647:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64e:	00 
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 7a fe ff ff       	call   4d8 <printint>
        ap++;
 65e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 662:	e9 b1 00 00 00       	jmp    718 <printf+0x190>
      } else if(c == 's'){
 667:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 66b:	75 43                	jne    6b0 <printf+0x128>
        s = (char*)*ap;
 66d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 675:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 679:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67d:	75 25                	jne    6a4 <printf+0x11c>
          s = "(null)";
 67f:	c7 45 f4 7c 09 00 00 	movl   $0x97c,-0xc(%ebp)
        while(*s != 0){
 686:	eb 1c                	jmp    6a4 <printf+0x11c>
          putc(fd, *s);
 688:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68b:	8a 00                	mov    (%eax),%al
 68d:	0f be c0             	movsbl %al,%eax
 690:	89 44 24 04          	mov    %eax,0x4(%esp)
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	89 04 24             	mov    %eax,(%esp)
 69a:	e8 11 fe ff ff       	call   4b0 <putc>
          s++;
 69f:	ff 45 f4             	incl   -0xc(%ebp)
 6a2:	eb 01                	jmp    6a5 <printf+0x11d>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6a4:	90                   	nop
 6a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a8:	8a 00                	mov    (%eax),%al
 6aa:	84 c0                	test   %al,%al
 6ac:	75 da                	jne    688 <printf+0x100>
 6ae:	eb 68                	jmp    718 <printf+0x190>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6b0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b4:	75 1d                	jne    6d3 <printf+0x14b>
        putc(fd, *ap);
 6b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b9:	8b 00                	mov    (%eax),%eax
 6bb:	0f be c0             	movsbl %al,%eax
 6be:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c2:	8b 45 08             	mov    0x8(%ebp),%eax
 6c5:	89 04 24             	mov    %eax,(%esp)
 6c8:	e8 e3 fd ff ff       	call   4b0 <putc>
        ap++;
 6cd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d1:	eb 45                	jmp    718 <printf+0x190>
      } else if(c == '%'){
 6d3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d7:	75 17                	jne    6f0 <printf+0x168>
        putc(fd, c);
 6d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6dc:	0f be c0             	movsbl %al,%eax
 6df:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	89 04 24             	mov    %eax,(%esp)
 6e9:	e8 c2 fd ff ff       	call   4b0 <putc>
 6ee:	eb 28                	jmp    718 <printf+0x190>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6f7:	00 
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	89 04 24             	mov    %eax,(%esp)
 6fe:	e8 ad fd ff ff       	call   4b0 <putc>
        putc(fd, c);
 703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 706:	0f be c0             	movsbl %al,%eax
 709:	89 44 24 04          	mov    %eax,0x4(%esp)
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	89 04 24             	mov    %eax,(%esp)
 713:	e8 98 fd ff ff       	call   4b0 <putc>
      }
      state = 0;
 718:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 71f:	ff 45 f0             	incl   -0x10(%ebp)
 722:	8b 55 0c             	mov    0xc(%ebp),%edx
 725:	8b 45 f0             	mov    -0x10(%ebp),%eax
 728:	01 d0                	add    %edx,%eax
 72a:	8a 00                	mov    (%eax),%al
 72c:	84 c0                	test   %al,%al
 72e:	0f 85 76 fe ff ff    	jne    5aa <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 734:	c9                   	leave  
 735:	c3                   	ret    
 736:	66 90                	xchg   %ax,%ax

00000738 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 738:	55                   	push   %ebp
 739:	89 e5                	mov    %esp,%ebp
 73b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	83 e8 08             	sub    $0x8,%eax
 744:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 747:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 74c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 74f:	eb 24                	jmp    775 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 00                	mov    (%eax),%eax
 756:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 759:	77 12                	ja     76d <free+0x35>
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 761:	77 24                	ja     787 <free+0x4f>
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76b:	77 1a                	ja     787 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 00                	mov    (%eax),%eax
 772:	89 45 fc             	mov    %eax,-0x4(%ebp)
 775:	8b 45 f8             	mov    -0x8(%ebp),%eax
 778:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77b:	76 d4                	jbe    751 <free+0x19>
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	8b 00                	mov    (%eax),%eax
 782:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 785:	76 ca                	jbe    751 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	8b 40 04             	mov    0x4(%eax),%eax
 78d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 794:	8b 45 f8             	mov    -0x8(%ebp),%eax
 797:	01 c2                	add    %eax,%edx
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	39 c2                	cmp    %eax,%edx
 7a0:	75 24                	jne    7c6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	8b 50 04             	mov    0x4(%eax),%edx
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	8b 00                	mov    (%eax),%eax
 7ad:	8b 40 04             	mov    0x4(%eax),%eax
 7b0:	01 c2                	add    %eax,%edx
 7b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	8b 00                	mov    (%eax),%eax
 7bd:	8b 10                	mov    (%eax),%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	89 10                	mov    %edx,(%eax)
 7c4:	eb 0a                	jmp    7d0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 10                	mov    (%eax),%edx
 7cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ce:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	01 d0                	add    %edx,%eax
 7e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e5:	75 20                	jne    807 <free+0xcf>
    p->s.size += bp->s.size;
 7e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ea:	8b 50 04             	mov    0x4(%eax),%edx
 7ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f0:	8b 40 04             	mov    0x4(%eax),%eax
 7f3:	01 c2                	add    %eax,%edx
 7f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	8b 10                	mov    (%eax),%edx
 800:	8b 45 fc             	mov    -0x4(%ebp),%eax
 803:	89 10                	mov    %edx,(%eax)
 805:	eb 08                	jmp    80f <free+0xd7>
  } else
    p->s.ptr = bp;
 807:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80d:	89 10                	mov    %edx,(%eax)
  freep = p;
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 817:	c9                   	leave  
 818:	c3                   	ret    

00000819 <morecore>:

static Header*
morecore(uint nu)
{
 819:	55                   	push   %ebp
 81a:	89 e5                	mov    %esp,%ebp
 81c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 81f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 826:	77 07                	ja     82f <morecore+0x16>
    nu = 4096;
 828:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 82f:	8b 45 08             	mov    0x8(%ebp),%eax
 832:	c1 e0 03             	shl    $0x3,%eax
 835:	89 04 24             	mov    %eax,(%esp)
 838:	e8 43 fc ff ff       	call   480 <sbrk>
 83d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 840:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 844:	75 07                	jne    84d <morecore+0x34>
    return 0;
 846:	b8 00 00 00 00       	mov    $0x0,%eax
 84b:	eb 22                	jmp    86f <morecore+0x56>
  hp = (Header*)p;
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	8b 55 08             	mov    0x8(%ebp),%edx
 859:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	83 c0 08             	add    $0x8,%eax
 862:	89 04 24             	mov    %eax,(%esp)
 865:	e8 ce fe ff ff       	call   738 <free>
  return freep;
 86a:	a1 e0 0b 00 00       	mov    0xbe0,%eax
}
 86f:	c9                   	leave  
 870:	c3                   	ret    

00000871 <malloc>:

void*
malloc(uint nbytes)
{
 871:	55                   	push   %ebp
 872:	89 e5                	mov    %esp,%ebp
 874:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	83 c0 07             	add    $0x7,%eax
 87d:	c1 e8 03             	shr    $0x3,%eax
 880:	40                   	inc    %eax
 881:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 884:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 889:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 890:	75 23                	jne    8b5 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 892:	c7 45 f0 d8 0b 00 00 	movl   $0xbd8,-0x10(%ebp)
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	a3 e0 0b 00 00       	mov    %eax,0xbe0
 8a1:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 8a6:	a3 d8 0b 00 00       	mov    %eax,0xbd8
    base.s.size = 0;
 8ab:	c7 05 dc 0b 00 00 00 	movl   $0x0,0xbdc
 8b2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c0:	8b 40 04             	mov    0x4(%eax),%eax
 8c3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c6:	72 4d                	jb     915 <malloc+0xa4>
      if(p->s.size == nunits)
 8c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cb:	8b 40 04             	mov    0x4(%eax),%eax
 8ce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d1:	75 0c                	jne    8df <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 10                	mov    (%eax),%edx
 8d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8db:	89 10                	mov    %edx,(%eax)
 8dd:	eb 26                	jmp    905 <malloc+0x94>
      else {
        p->s.size -= nunits;
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	8b 40 04             	mov    0x4(%eax),%eax
 8e5:	89 c2                	mov    %eax,%edx
 8e7:	2b 55 ec             	sub    -0x14(%ebp),%edx
 8ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	8b 40 04             	mov    0x4(%eax),%eax
 8f6:	c1 e0 03             	shl    $0x3,%eax
 8f9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
 902:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 905:	8b 45 f0             	mov    -0x10(%ebp),%eax
 908:	a3 e0 0b 00 00       	mov    %eax,0xbe0
      return (void*)(p + 1);
 90d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 910:	83 c0 08             	add    $0x8,%eax
 913:	eb 38                	jmp    94d <malloc+0xdc>
    }
    if(p == freep)
 915:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 91a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91d:	75 1b                	jne    93a <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 91f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 922:	89 04 24             	mov    %eax,(%esp)
 925:	e8 ef fe ff ff       	call   819 <morecore>
 92a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 931:	75 07                	jne    93a <malloc+0xc9>
        return 0;
 933:	b8 00 00 00 00       	mov    $0x0,%eax
 938:	eb 13                	jmp    94d <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 940:	8b 45 f4             	mov    -0xc(%ebp),%eax
 943:	8b 00                	mov    (%eax),%eax
 945:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 948:	e9 70 ff ff ff       	jmp    8bd <malloc+0x4c>
}
 94d:	c9                   	leave  
 94e:	c3                   	ret    
