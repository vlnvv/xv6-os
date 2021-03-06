
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 48                	jmp    5b <main+0x5b>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	40                   	inc    %eax
  18:	3b 45 08             	cmp    0x8(%ebp),%eax
  1b:	7d 07                	jge    24 <main+0x24>
  1d:	b8 0f 08 00 00       	mov    $0x80f,%eax
  22:	eb 05                	jmp    29 <main+0x29>
  24:	b8 11 08 00 00       	mov    $0x811,%eax
  29:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2d:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  34:	8b 55 0c             	mov    0xc(%ebp),%edx
  37:	01 ca                	add    %ecx,%edx
  39:	8b 12                	mov    (%edx),%edx
  3b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3f:	89 54 24 08          	mov    %edx,0x8(%esp)
  43:	c7 44 24 04 13 08 00 	movl   $0x813,0x4(%esp)
  4a:	00 
  4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  52:	e8 f1 03 00 00       	call   448 <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  57:	ff 44 24 1c          	incl   0x1c(%esp)
  5b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5f:	3b 45 08             	cmp    0x8(%ebp),%eax
  62:	7c af                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  64:	e8 4f 02 00 00       	call   2b8 <exit>
  69:	66 90                	xchg   %ax,%ax
  6b:	90                   	nop

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  a1:	8a 10                	mov    (%eax),%dl
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	88 10                	mov    %dl,(%eax)
  a8:	8b 45 08             	mov    0x8(%ebp),%eax
  ab:	8a 00                	mov    (%eax),%al
  ad:	84 c0                	test   %al,%al
  af:	0f 95 c0             	setne  %al
  b2:	ff 45 08             	incl   0x8(%ebp)
  b5:	ff 45 0c             	incl   0xc(%ebp)
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 06                	jmp    cc <strcmp+0xb>
    p++, q++;
  c6:	ff 45 08             	incl   0x8(%ebp)
  c9:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cf:	8a 00                	mov    (%eax),%al
  d1:	84 c0                	test   %al,%al
  d3:	74 0e                	je     e3 <strcmp+0x22>
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	8a 10                	mov    (%eax),%dl
  da:	8b 45 0c             	mov    0xc(%ebp),%eax
  dd:	8a 00                	mov    (%eax),%al
  df:	38 c2                	cmp    %al,%dl
  e1:	74 e3                	je     c6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	8a 00                	mov    (%eax),%al
  e8:	0f b6 d0             	movzbl %al,%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	8a 00                	mov    (%eax),%al
  f0:	0f b6 c0             	movzbl %al,%eax
  f3:	89 d1                	mov    %edx,%ecx
  f5:	29 c1                	sub    %eax,%ecx
  f7:	89 c8                	mov    %ecx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 03                	jmp    10d <strlen+0x12>
 10a:	ff 45 fc             	incl   -0x4(%ebp)
 10d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	01 d0                	add    %edx,%eax
 115:	8a 00                	mov    (%eax),%al
 117:	84 c0                	test   %al,%al
 119:	75 ef                	jne    10a <strlen+0xf>
    ;
  return n;
 11b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11e:	c9                   	leave  
 11f:	c3                   	ret    

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 126:	8b 45 10             	mov    0x10(%ebp),%eax
 129:	89 44 24 08          	mov    %eax,0x8(%esp)
 12d:	8b 45 0c             	mov    0xc(%ebp),%eax
 130:	89 44 24 04          	mov    %eax,0x4(%esp)
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	89 04 24             	mov    %eax,(%esp)
 13a:	e8 2d ff ff ff       	call   6c <stosb>
  return dst;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 142:	c9                   	leave  
 143:	c3                   	ret    

00000144 <strchr>:

char*
strchr(const char *s, char c)
{
 144:	55                   	push   %ebp
 145:	89 e5                	mov    %esp,%ebp
 147:	83 ec 04             	sub    $0x4,%esp
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 150:	eb 12                	jmp    164 <strchr+0x20>
    if(*s == c)
 152:	8b 45 08             	mov    0x8(%ebp),%eax
 155:	8a 00                	mov    (%eax),%al
 157:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15a:	75 05                	jne    161 <strchr+0x1d>
      return (char*)s;
 15c:	8b 45 08             	mov    0x8(%ebp),%eax
 15f:	eb 11                	jmp    172 <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 161:	ff 45 08             	incl   0x8(%ebp)
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	8a 00                	mov    (%eax),%al
 169:	84 c0                	test   %al,%al
 16b:	75 e5                	jne    152 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 16d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 172:	c9                   	leave  
 173:	c3                   	ret    

00000174 <gets>:

char*
gets(char *buf, int max)
{
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 181:	eb 42                	jmp    1c5 <gets+0x51>
    cc = read(0, &c, 1);
 183:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18a:	00 
 18b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 18e:	89 44 24 04          	mov    %eax,0x4(%esp)
 192:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 199:	e8 32 01 00 00       	call   2d0 <read>
 19e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a5:	7e 29                	jle    1d0 <gets+0x5c>
      break;
    buf[i++] = c;
 1a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1aa:	8b 45 08             	mov    0x8(%ebp),%eax
 1ad:	01 c2                	add    %eax,%edx
 1af:	8a 45 ef             	mov    -0x11(%ebp),%al
 1b2:	88 02                	mov    %al,(%edx)
 1b4:	ff 45 f4             	incl   -0xc(%ebp)
    if(c == '\n' || c == '\r')
 1b7:	8a 45 ef             	mov    -0x11(%ebp),%al
 1ba:	3c 0a                	cmp    $0xa,%al
 1bc:	74 13                	je     1d1 <gets+0x5d>
 1be:	8a 45 ef             	mov    -0x11(%ebp),%al
 1c1:	3c 0d                	cmp    $0xd,%al
 1c3:	74 0c                	je     1d1 <gets+0x5d>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c8:	40                   	inc    %eax
 1c9:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1cc:	7c b5                	jl     183 <gets+0xf>
 1ce:	eb 01                	jmp    1d1 <gets+0x5d>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1d0:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	01 d0                	add    %edx,%eax
 1d9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1dc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1df:	c9                   	leave  
 1e0:	c3                   	ret    

000001e1 <stat>:

int
stat(char *n, struct stat *st)
{
 1e1:	55                   	push   %ebp
 1e2:	89 e5                	mov    %esp,%ebp
 1e4:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1ee:	00 
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	89 04 24             	mov    %eax,(%esp)
 1f5:	e8 fe 00 00 00       	call   2f8 <open>
 1fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 201:	79 07                	jns    20a <stat+0x29>
    return -1;
 203:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 208:	eb 23                	jmp    22d <stat+0x4c>
  r = fstat(fd, st);
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 44 24 04          	mov    %eax,0x4(%esp)
 211:	8b 45 f4             	mov    -0xc(%ebp),%eax
 214:	89 04 24             	mov    %eax,(%esp)
 217:	e8 f4 00 00 00       	call   310 <fstat>
 21c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 b6 00 00 00       	call   2e0 <close>
  return r;
 22a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 22d:	c9                   	leave  
 22e:	c3                   	ret    

0000022f <atoi>:

int
atoi(const char *s)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 235:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 23c:	eb 21                	jmp    25f <atoi+0x30>
    n = n*10 + *s++ - '0';
 23e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 241:	89 d0                	mov    %edx,%eax
 243:	c1 e0 02             	shl    $0x2,%eax
 246:	01 d0                	add    %edx,%eax
 248:	d1 e0                	shl    %eax
 24a:	89 c2                	mov    %eax,%edx
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	8a 00                	mov    (%eax),%al
 251:	0f be c0             	movsbl %al,%eax
 254:	01 d0                	add    %edx,%eax
 256:	83 e8 30             	sub    $0x30,%eax
 259:	89 45 fc             	mov    %eax,-0x4(%ebp)
 25c:	ff 45 08             	incl   0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8a 00                	mov    (%eax),%al
 264:	3c 2f                	cmp    $0x2f,%al
 266:	7e 09                	jle    271 <atoi+0x42>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	8a 00                	mov    (%eax),%al
 26d:	3c 39                	cmp    $0x39,%al
 26f:	7e cd                	jle    23e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 271:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 274:	c9                   	leave  
 275:	c3                   	ret    

00000276 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 282:	8b 45 0c             	mov    0xc(%ebp),%eax
 285:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 288:	eb 10                	jmp    29a <memmove+0x24>
    *dst++ = *src++;
 28a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 28d:	8a 10                	mov    (%eax),%dl
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 292:	88 10                	mov    %dl,(%eax)
 294:	ff 45 fc             	incl   -0x4(%ebp)
 297:	ff 45 f8             	incl   -0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 29e:	0f 9f c0             	setg   %al
 2a1:	ff 4d 10             	decl   0x10(%ebp)
 2a4:	84 c0                	test   %al,%al
 2a6:	75 e2                	jne    28a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ab:	c9                   	leave  
 2ac:	c3                   	ret    
 2ad:	66 90                	xchg   %ax,%ax
 2af:	90                   	nop

000002b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b0:	b8 01 00 00 00       	mov    $0x1,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <exit>:
SYSCALL(exit)
 2b8:	b8 02 00 00 00       	mov    $0x2,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <wait>:
SYSCALL(wait)
 2c0:	b8 03 00 00 00       	mov    $0x3,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <pipe>:
SYSCALL(pipe)
 2c8:	b8 04 00 00 00       	mov    $0x4,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <read>:
SYSCALL(read)
 2d0:	b8 05 00 00 00       	mov    $0x5,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <write>:
SYSCALL(write)
 2d8:	b8 10 00 00 00       	mov    $0x10,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <close>:
SYSCALL(close)
 2e0:	b8 15 00 00 00       	mov    $0x15,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <kill>:
SYSCALL(kill)
 2e8:	b8 06 00 00 00       	mov    $0x6,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exec>:
SYSCALL(exec)
 2f0:	b8 07 00 00 00       	mov    $0x7,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <open>:
SYSCALL(open)
 2f8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mknod>:
SYSCALL(mknod)
 300:	b8 11 00 00 00       	mov    $0x11,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <unlink>:
SYSCALL(unlink)
 308:	b8 12 00 00 00       	mov    $0x12,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <fstat>:
SYSCALL(fstat)
 310:	b8 08 00 00 00       	mov    $0x8,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <link>:
SYSCALL(link)
 318:	b8 13 00 00 00       	mov    $0x13,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <mkdir>:
SYSCALL(mkdir)
 320:	b8 14 00 00 00       	mov    $0x14,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <chdir>:
SYSCALL(chdir)
 328:	b8 09 00 00 00       	mov    $0x9,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <dup>:
SYSCALL(dup)
 330:	b8 0a 00 00 00       	mov    $0xa,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <getpid>:
SYSCALL(getpid)
 338:	b8 0b 00 00 00       	mov    $0xb,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <sbrk>:
SYSCALL(sbrk)
 340:	b8 0c 00 00 00       	mov    $0xc,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <sleep>:
SYSCALL(sleep)
 348:	b8 0d 00 00 00       	mov    $0xd,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <uptime>:
SYSCALL(uptime)
 350:	b8 0e 00 00 00       	mov    $0xe,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <getppid>:
SYSCALL(getppid)        // USER DEFINED SYS CALL
 358:	b8 16 00 00 00       	mov    $0x16,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <icount>:
SYSCALL(icount)         // USER DEFINED SYS CALL
 360:	b8 17 00 00 00       	mov    $0x17,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <signal>:
SYSCALL(signal)         // USER DEFINED SYS CALL
 368:	b8 18 00 00 00       	mov    $0x18,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 28             	sub    $0x28,%esp
 376:	8b 45 0c             	mov    0xc(%ebp),%eax
 379:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 37c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 383:	00 
 384:	8d 45 f4             	lea    -0xc(%ebp),%eax
 387:	89 44 24 04          	mov    %eax,0x4(%esp)
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 04 24             	mov    %eax,(%esp)
 391:	e8 42 ff ff ff       	call   2d8 <write>
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 39e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3a5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3a9:	74 17                	je     3c2 <printint+0x2a>
 3ab:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3af:	79 11                	jns    3c2 <printint+0x2a>
    neg = 1;
 3b1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bb:	f7 d8                	neg    %eax
 3bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c0:	eb 06                	jmp    3c8 <printint+0x30>
  } else {
    x = xx;
 3c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d5:	ba 00 00 00 00       	mov    $0x0,%edx
 3da:	f7 f1                	div    %ecx
 3dc:	89 d0                	mov    %edx,%eax
 3de:	8a 80 5c 0a 00 00    	mov    0xa5c(%eax),%al
 3e4:	8d 4d dc             	lea    -0x24(%ebp),%ecx
 3e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3ea:	01 ca                	add    %ecx,%edx
 3ec:	88 02                	mov    %al,(%edx)
 3ee:	ff 45 f4             	incl   -0xc(%ebp)
  }while((x /= base) != 0);
 3f1:	8b 55 10             	mov    0x10(%ebp),%edx
 3f4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 3f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fa:	ba 00 00 00 00       	mov    $0x0,%edx
 3ff:	f7 75 d4             	divl   -0x2c(%ebp)
 402:	89 45 ec             	mov    %eax,-0x14(%ebp)
 405:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 409:	75 c4                	jne    3cf <printint+0x37>
  if(neg)
 40b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 40f:	74 2c                	je     43d <printint+0xa5>
    buf[i++] = '-';
 411:	8d 55 dc             	lea    -0x24(%ebp),%edx
 414:	8b 45 f4             	mov    -0xc(%ebp),%eax
 417:	01 d0                	add    %edx,%eax
 419:	c6 00 2d             	movb   $0x2d,(%eax)
 41c:	ff 45 f4             	incl   -0xc(%ebp)

  while(--i >= 0)
 41f:	eb 1c                	jmp    43d <printint+0xa5>
    putc(fd, buf[i]);
 421:	8d 55 dc             	lea    -0x24(%ebp),%edx
 424:	8b 45 f4             	mov    -0xc(%ebp),%eax
 427:	01 d0                	add    %edx,%eax
 429:	8a 00                	mov    (%eax),%al
 42b:	0f be c0             	movsbl %al,%eax
 42e:	89 44 24 04          	mov    %eax,0x4(%esp)
 432:	8b 45 08             	mov    0x8(%ebp),%eax
 435:	89 04 24             	mov    %eax,(%esp)
 438:	e8 33 ff ff ff       	call   370 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 43d:	ff 4d f4             	decl   -0xc(%ebp)
 440:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 444:	79 db                	jns    421 <printint+0x89>
    putc(fd, buf[i]);
}
 446:	c9                   	leave  
 447:	c3                   	ret    

00000448 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 44e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 455:	8d 45 0c             	lea    0xc(%ebp),%eax
 458:	83 c0 04             	add    $0x4,%eax
 45b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 45e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 465:	e9 78 01 00 00       	jmp    5e2 <printf+0x19a>
    c = fmt[i] & 0xff;
 46a:	8b 55 0c             	mov    0xc(%ebp),%edx
 46d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 470:	01 d0                	add    %edx,%eax
 472:	8a 00                	mov    (%eax),%al
 474:	0f be c0             	movsbl %al,%eax
 477:	25 ff 00 00 00       	and    $0xff,%eax
 47c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 47f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 483:	75 2c                	jne    4b1 <printf+0x69>
      if(c == '%'){
 485:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 489:	75 0c                	jne    497 <printf+0x4f>
        state = '%';
 48b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 492:	e9 48 01 00 00       	jmp    5df <printf+0x197>
      } else {
        putc(fd, c);
 497:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 49a:	0f be c0             	movsbl %al,%eax
 49d:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	89 04 24             	mov    %eax,(%esp)
 4a7:	e8 c4 fe ff ff       	call   370 <putc>
 4ac:	e9 2e 01 00 00       	jmp    5df <printf+0x197>
      }
    } else if(state == '%'){
 4b1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4b5:	0f 85 24 01 00 00    	jne    5df <printf+0x197>
      if(c == 'd'){
 4bb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4bf:	75 2d                	jne    4ee <printf+0xa6>
        printint(fd, *ap, 10, 1);
 4c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c4:	8b 00                	mov    (%eax),%eax
 4c6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4cd:	00 
 4ce:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4d5:	00 
 4d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4da:	8b 45 08             	mov    0x8(%ebp),%eax
 4dd:	89 04 24             	mov    %eax,(%esp)
 4e0:	e8 b3 fe ff ff       	call   398 <printint>
        ap++;
 4e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e9:	e9 ea 00 00 00       	jmp    5d8 <printf+0x190>
      } else if(c == 'x' || c == 'p'){
 4ee:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4f2:	74 06                	je     4fa <printf+0xb2>
 4f4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f8:	75 2d                	jne    527 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 4fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fd:	8b 00                	mov    (%eax),%eax
 4ff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 506:	00 
 507:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 50e:	00 
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 7a fe ff ff       	call   398 <printint>
        ap++;
 51e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 522:	e9 b1 00 00 00       	jmp    5d8 <printf+0x190>
      } else if(c == 's'){
 527:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 52b:	75 43                	jne    570 <printf+0x128>
        s = (char*)*ap;
 52d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 530:	8b 00                	mov    (%eax),%eax
 532:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 535:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 539:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 53d:	75 25                	jne    564 <printf+0x11c>
          s = "(null)";
 53f:	c7 45 f4 18 08 00 00 	movl   $0x818,-0xc(%ebp)
        while(*s != 0){
 546:	eb 1c                	jmp    564 <printf+0x11c>
          putc(fd, *s);
 548:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54b:	8a 00                	mov    (%eax),%al
 54d:	0f be c0             	movsbl %al,%eax
 550:	89 44 24 04          	mov    %eax,0x4(%esp)
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	89 04 24             	mov    %eax,(%esp)
 55a:	e8 11 fe ff ff       	call   370 <putc>
          s++;
 55f:	ff 45 f4             	incl   -0xc(%ebp)
 562:	eb 01                	jmp    565 <printf+0x11d>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 564:	90                   	nop
 565:	8b 45 f4             	mov    -0xc(%ebp),%eax
 568:	8a 00                	mov    (%eax),%al
 56a:	84 c0                	test   %al,%al
 56c:	75 da                	jne    548 <printf+0x100>
 56e:	eb 68                	jmp    5d8 <printf+0x190>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 570:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 574:	75 1d                	jne    593 <printf+0x14b>
        putc(fd, *ap);
 576:	8b 45 e8             	mov    -0x18(%ebp),%eax
 579:	8b 00                	mov    (%eax),%eax
 57b:	0f be c0             	movsbl %al,%eax
 57e:	89 44 24 04          	mov    %eax,0x4(%esp)
 582:	8b 45 08             	mov    0x8(%ebp),%eax
 585:	89 04 24             	mov    %eax,(%esp)
 588:	e8 e3 fd ff ff       	call   370 <putc>
        ap++;
 58d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 591:	eb 45                	jmp    5d8 <printf+0x190>
      } else if(c == '%'){
 593:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 597:	75 17                	jne    5b0 <printf+0x168>
        putc(fd, c);
 599:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59c:	0f be c0             	movsbl %al,%eax
 59f:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	89 04 24             	mov    %eax,(%esp)
 5a9:	e8 c2 fd ff ff       	call   370 <putc>
 5ae:	eb 28                	jmp    5d8 <printf+0x190>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5b0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5b7:	00 
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
 5bb:	89 04 24             	mov    %eax,(%esp)
 5be:	e8 ad fd ff ff       	call   370 <putc>
        putc(fd, c);
 5c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c6:	0f be c0             	movsbl %al,%eax
 5c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	89 04 24             	mov    %eax,(%esp)
 5d3:	e8 98 fd ff ff       	call   370 <putc>
      }
      state = 0;
 5d8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5df:	ff 45 f0             	incl   -0x10(%ebp)
 5e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 5e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e8:	01 d0                	add    %edx,%eax
 5ea:	8a 00                	mov    (%eax),%al
 5ec:	84 c0                	test   %al,%al
 5ee:	0f 85 76 fe ff ff    	jne    46a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f4:	c9                   	leave  
 5f5:	c3                   	ret    
 5f6:	66 90                	xchg   %ax,%ax

000005f8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	83 e8 08             	sub    $0x8,%eax
 604:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 607:	a1 78 0a 00 00       	mov    0xa78,%eax
 60c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 60f:	eb 24                	jmp    635 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 611:	8b 45 fc             	mov    -0x4(%ebp),%eax
 614:	8b 00                	mov    (%eax),%eax
 616:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 619:	77 12                	ja     62d <free+0x35>
 61b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 621:	77 24                	ja     647 <free+0x4f>
 623:	8b 45 fc             	mov    -0x4(%ebp),%eax
 626:	8b 00                	mov    (%eax),%eax
 628:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62b:	77 1a                	ja     647 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 630:	8b 00                	mov    (%eax),%eax
 632:	89 45 fc             	mov    %eax,-0x4(%ebp)
 635:	8b 45 f8             	mov    -0x8(%ebp),%eax
 638:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63b:	76 d4                	jbe    611 <free+0x19>
 63d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 645:	76 ca                	jbe    611 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 647:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64a:	8b 40 04             	mov    0x4(%eax),%eax
 64d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 654:	8b 45 f8             	mov    -0x8(%ebp),%eax
 657:	01 c2                	add    %eax,%edx
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	39 c2                	cmp    %eax,%edx
 660:	75 24                	jne    686 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 662:	8b 45 f8             	mov    -0x8(%ebp),%eax
 665:	8b 50 04             	mov    0x4(%eax),%edx
 668:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	8b 40 04             	mov    0x4(%eax),%eax
 670:	01 c2                	add    %eax,%edx
 672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 675:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 678:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67b:	8b 00                	mov    (%eax),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	89 10                	mov    %edx,(%eax)
 684:	eb 0a                	jmp    690 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 686:	8b 45 fc             	mov    -0x4(%ebp),%eax
 689:	8b 10                	mov    (%eax),%edx
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 40 04             	mov    0x4(%eax),%eax
 696:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	01 d0                	add    %edx,%eax
 6a2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a5:	75 20                	jne    6c7 <free+0xcf>
    p->s.size += bp->s.size;
 6a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6aa:	8b 50 04             	mov    0x4(%eax),%edx
 6ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b0:	8b 40 04             	mov    0x4(%eax),%eax
 6b3:	01 c2                	add    %eax,%edx
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6be:	8b 10                	mov    (%eax),%edx
 6c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c3:	89 10                	mov    %edx,(%eax)
 6c5:	eb 08                	jmp    6cf <free+0xd7>
  } else
    p->s.ptr = bp;
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6cd:	89 10                	mov    %edx,(%eax)
  freep = p;
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	a3 78 0a 00 00       	mov    %eax,0xa78
}
 6d7:	c9                   	leave  
 6d8:	c3                   	ret    

000006d9 <morecore>:

static Header*
morecore(uint nu)
{
 6d9:	55                   	push   %ebp
 6da:	89 e5                	mov    %esp,%ebp
 6dc:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6df:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6e6:	77 07                	ja     6ef <morecore+0x16>
    nu = 4096;
 6e8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ef:	8b 45 08             	mov    0x8(%ebp),%eax
 6f2:	c1 e0 03             	shl    $0x3,%eax
 6f5:	89 04 24             	mov    %eax,(%esp)
 6f8:	e8 43 fc ff ff       	call   340 <sbrk>
 6fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 700:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 704:	75 07                	jne    70d <morecore+0x34>
    return 0;
 706:	b8 00 00 00 00       	mov    $0x0,%eax
 70b:	eb 22                	jmp    72f <morecore+0x56>
  hp = (Header*)p;
 70d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 710:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 713:	8b 45 f0             	mov    -0x10(%ebp),%eax
 716:	8b 55 08             	mov    0x8(%ebp),%edx
 719:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 71c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71f:	83 c0 08             	add    $0x8,%eax
 722:	89 04 24             	mov    %eax,(%esp)
 725:	e8 ce fe ff ff       	call   5f8 <free>
  return freep;
 72a:	a1 78 0a 00 00       	mov    0xa78,%eax
}
 72f:	c9                   	leave  
 730:	c3                   	ret    

00000731 <malloc>:

void*
malloc(uint nbytes)
{
 731:	55                   	push   %ebp
 732:	89 e5                	mov    %esp,%ebp
 734:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	83 c0 07             	add    $0x7,%eax
 73d:	c1 e8 03             	shr    $0x3,%eax
 740:	40                   	inc    %eax
 741:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 744:	a1 78 0a 00 00       	mov    0xa78,%eax
 749:	89 45 f0             	mov    %eax,-0x10(%ebp)
 74c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 750:	75 23                	jne    775 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 752:	c7 45 f0 70 0a 00 00 	movl   $0xa70,-0x10(%ebp)
 759:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75c:	a3 78 0a 00 00       	mov    %eax,0xa78
 761:	a1 78 0a 00 00       	mov    0xa78,%eax
 766:	a3 70 0a 00 00       	mov    %eax,0xa70
    base.s.size = 0;
 76b:	c7 05 74 0a 00 00 00 	movl   $0x0,0xa74
 772:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 775:	8b 45 f0             	mov    -0x10(%ebp),%eax
 778:	8b 00                	mov    (%eax),%eax
 77a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 77d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 780:	8b 40 04             	mov    0x4(%eax),%eax
 783:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 786:	72 4d                	jb     7d5 <malloc+0xa4>
      if(p->s.size == nunits)
 788:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 791:	75 0c                	jne    79f <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79b:	89 10                	mov    %edx,(%eax)
 79d:	eb 26                	jmp    7c5 <malloc+0x94>
      else {
        p->s.size -= nunits;
 79f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a2:	8b 40 04             	mov    0x4(%eax),%eax
 7a5:	89 c2                	mov    %eax,%edx
 7a7:	2b 55 ec             	sub    -0x14(%ebp),%edx
 7aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ad:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	8b 40 04             	mov    0x4(%eax),%eax
 7b6:	c1 e0 03             	shl    $0x3,%eax
 7b9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7c2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c8:	a3 78 0a 00 00       	mov    %eax,0xa78
      return (void*)(p + 1);
 7cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d0:	83 c0 08             	add    $0x8,%eax
 7d3:	eb 38                	jmp    80d <malloc+0xdc>
    }
    if(p == freep)
 7d5:	a1 78 0a 00 00       	mov    0xa78,%eax
 7da:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7dd:	75 1b                	jne    7fa <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 7df:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e2:	89 04 24             	mov    %eax,(%esp)
 7e5:	e8 ef fe ff ff       	call   6d9 <morecore>
 7ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7f1:	75 07                	jne    7fa <malloc+0xc9>
        return 0;
 7f3:	b8 00 00 00 00       	mov    $0x0,%eax
 7f8:	eb 13                	jmp    80d <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 800:	8b 45 f4             	mov    -0xc(%ebp),%eax
 803:	8b 00                	mov    (%eax),%eax
 805:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 808:	e9 70 ff ff ff       	jmp    77d <malloc+0x4c>
}
 80d:	c9                   	leave  
 80e:	c3                   	ret    
