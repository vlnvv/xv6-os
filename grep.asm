
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
   d:	e9 bb 00 00 00       	jmp    cd <grep+0xcd>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    p = buf;
  18:	c7 45 f0 20 0e 00 00 	movl   $0xe20,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  1f:	eb 4f                	jmp    70 <grep+0x70>
      *q = 0;
  21:	8b 45 e8             	mov    -0x18(%ebp),%eax
  24:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  2e:	8b 45 08             	mov    0x8(%ebp),%eax
  31:	89 04 24             	mov    %eax,(%esp)
  34:	e8 bd 01 00 00       	call   1f6 <match>
  39:	85 c0                	test   %eax,%eax
  3b:	74 2c                	je     69 <grep+0x69>
        *q = '\n';
  3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  40:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  43:	8b 45 e8             	mov    -0x18(%ebp),%eax
  46:	40                   	inc    %eax
  47:	89 c2                	mov    %eax,%edx
  49:	8b 45 f0             	mov    -0x10(%ebp),%eax
  4c:	89 d1                	mov    %edx,%ecx
  4e:	29 c1                	sub    %eax,%ecx
  50:	89 c8                	mov    %ecx,%eax
  52:	89 44 24 08          	mov    %eax,0x8(%esp)
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	89 44 24 04          	mov    %eax,0x4(%esp)
  5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  64:	e8 4b 05 00 00       	call   5b4 <write>
      }
      p = q+1;
  69:	8b 45 e8             	mov    -0x18(%ebp),%eax
  6c:	40                   	inc    %eax
  6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
  70:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  77:	00 
  78:	8b 45 f0             	mov    -0x10(%ebp),%eax
  7b:	89 04 24             	mov    %eax,(%esp)
  7e:	e8 9d 03 00 00       	call   420 <strchr>
  83:	89 45 e8             	mov    %eax,-0x18(%ebp)
  86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  8a:	75 95                	jne    21 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  8c:	81 7d f0 20 0e 00 00 	cmpl   $0xe20,-0x10(%ebp)
  93:	75 07                	jne    9c <grep+0x9c>
      m = 0;
  95:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  9c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a0:	7e 2b                	jle    cd <grep+0xcd>
      m -= p - buf;
  a2:	ba 20 0e 00 00       	mov    $0xe20,%edx
  a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  aa:	89 d1                	mov    %edx,%ecx
  ac:	29 c1                	sub    %eax,%ecx
  ae:	89 c8                	mov    %ecx,%eax
  b0:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  c1:	c7 04 24 20 0e 00 00 	movl   $0xe20,(%esp)
  c8:	e8 85 04 00 00       	call   552 <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
  cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  d0:	ba 00 04 00 00       	mov    $0x400,%edx
  d5:	89 d1                	mov    %edx,%ecx
  d7:	29 c1                	sub    %eax,%ecx
  d9:	89 c8                	mov    %ecx,%eax
  db:	8b 55 f4             	mov    -0xc(%ebp),%edx
  de:	81 c2 20 0e 00 00    	add    $0xe20,%edx
  e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  e8:	89 54 24 04          	mov    %edx,0x4(%esp)
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	89 04 24             	mov    %eax,(%esp)
  f2:	e8 b5 04 00 00       	call   5ac <read>
  f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  fe:	0f 8f 0e ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 104:	c9                   	leave  
 105:	c3                   	ret    

00000106 <main>:

int
main(int argc, char *argv[])
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	83 e4 f0             	and    $0xfffffff0,%esp
 10c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 10f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 113:	7f 19                	jg     12e <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 115:	c7 44 24 04 ec 0a 00 	movl   $0xaec,0x4(%esp)
 11c:	00 
 11d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 124:	e8 fb 05 00 00       	call   724 <printf>
    exit();
 129:	e8 66 04 00 00       	call   594 <exit>
  }
  pattern = argv[1];
 12e:	8b 45 0c             	mov    0xc(%ebp),%eax
 131:	8b 40 04             	mov    0x4(%eax),%eax
 134:	89 44 24 18          	mov    %eax,0x18(%esp)
  
  if(argc <= 2){
 138:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 13c:	7f 19                	jg     157 <main+0x51>
    grep(pattern, 0);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8b 44 24 18          	mov    0x18(%esp),%eax
 14a:	89 04 24             	mov    %eax,(%esp)
 14d:	e8 ae fe ff ff       	call   0 <grep>
    exit();
 152:	e8 3d 04 00 00       	call   594 <exit>
  }

  for(i = 2; i < argc; i++){
 157:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 15e:	00 
 15f:	e9 80 00 00 00       	jmp    1e4 <main+0xde>
    if((fd = open(argv[i], 0)) < 0){
 164:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 168:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 16f:	8b 45 0c             	mov    0xc(%ebp),%eax
 172:	01 d0                	add    %edx,%eax
 174:	8b 00                	mov    (%eax),%eax
 176:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 17d:	00 
 17e:	89 04 24             	mov    %eax,(%esp)
 181:	e8 4e 04 00 00       	call   5d4 <open>
 186:	89 44 24 14          	mov    %eax,0x14(%esp)
 18a:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 18f:	79 2f                	jns    1c0 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 191:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 195:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19c:	8b 45 0c             	mov    0xc(%ebp),%eax
 19f:	01 d0                	add    %edx,%eax
 1a1:	8b 00                	mov    (%eax),%eax
 1a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1a7:	c7 44 24 04 0c 0b 00 	movl   $0xb0c,0x4(%esp)
 1ae:	00 
 1af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1b6:	e8 69 05 00 00       	call   724 <printf>
      exit();
 1bb:	e8 d4 03 00 00       	call   594 <exit>
    }
    grep(pattern, fd);
 1c0:	8b 44 24 14          	mov    0x14(%esp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 44 24 18          	mov    0x18(%esp),%eax
 1cc:	89 04 24             	mov    %eax,(%esp)
 1cf:	e8 2c fe ff ff       	call   0 <grep>
    close(fd);
 1d4:	8b 44 24 14          	mov    0x14(%esp),%eax
 1d8:	89 04 24             	mov    %eax,(%esp)
 1db:	e8 dc 03 00 00       	call   5bc <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 1e0:	ff 44 24 1c          	incl   0x1c(%esp)
 1e4:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1e8:	3b 45 08             	cmp    0x8(%ebp),%eax
 1eb:	0f 8c 73 ff ff ff    	jl     164 <main+0x5e>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 1f1:	e8 9e 03 00 00       	call   594 <exit>

000001f6 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	8a 00                	mov    (%eax),%al
 201:	3c 5e                	cmp    $0x5e,%al
 203:	75 17                	jne    21c <match+0x26>
    return matchhere(re+1, text);
 205:	8b 45 08             	mov    0x8(%ebp),%eax
 208:	8d 50 01             	lea    0x1(%eax),%edx
 20b:	8b 45 0c             	mov    0xc(%ebp),%eax
 20e:	89 44 24 04          	mov    %eax,0x4(%esp)
 212:	89 14 24             	mov    %edx,(%esp)
 215:	e8 37 00 00 00       	call   251 <matchhere>
 21a:	eb 33                	jmp    24f <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 21c:	8b 45 0c             	mov    0xc(%ebp),%eax
 21f:	89 44 24 04          	mov    %eax,0x4(%esp)
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	89 04 24             	mov    %eax,(%esp)
 229:	e8 23 00 00 00       	call   251 <matchhere>
 22e:	85 c0                	test   %eax,%eax
 230:	74 07                	je     239 <match+0x43>
      return 1;
 232:	b8 01 00 00 00       	mov    $0x1,%eax
 237:	eb 16                	jmp    24f <match+0x59>
  }while(*text++ != '\0');
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	8a 00                	mov    (%eax),%al
 23e:	84 c0                	test   %al,%al
 240:	0f 95 c0             	setne  %al
 243:	ff 45 0c             	incl   0xc(%ebp)
 246:	84 c0                	test   %al,%al
 248:	75 d2                	jne    21c <match+0x26>
  return 0;
 24a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24f:	c9                   	leave  
 250:	c3                   	ret    

00000251 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 251:	55                   	push   %ebp
 252:	89 e5                	mov    %esp,%ebp
 254:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	8a 00                	mov    (%eax),%al
 25c:	84 c0                	test   %al,%al
 25e:	75 0a                	jne    26a <matchhere+0x19>
    return 1;
 260:	b8 01 00 00 00       	mov    $0x1,%eax
 265:	e9 8c 00 00 00       	jmp    2f6 <matchhere+0xa5>
  if(re[1] == '*')
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	40                   	inc    %eax
 26e:	8a 00                	mov    (%eax),%al
 270:	3c 2a                	cmp    $0x2a,%al
 272:	75 23                	jne    297 <matchhere+0x46>
    return matchstar(re[0], re+2, text);
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	8d 48 02             	lea    0x2(%eax),%ecx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	8a 00                	mov    (%eax),%al
 27f:	0f be c0             	movsbl %al,%eax
 282:	8b 55 0c             	mov    0xc(%ebp),%edx
 285:	89 54 24 08          	mov    %edx,0x8(%esp)
 289:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 28d:	89 04 24             	mov    %eax,(%esp)
 290:	e8 63 00 00 00       	call   2f8 <matchstar>
 295:	eb 5f                	jmp    2f6 <matchhere+0xa5>
  if(re[0] == '$' && re[1] == '\0')
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	8a 00                	mov    (%eax),%al
 29c:	3c 24                	cmp    $0x24,%al
 29e:	75 19                	jne    2b9 <matchhere+0x68>
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	40                   	inc    %eax
 2a4:	8a 00                	mov    (%eax),%al
 2a6:	84 c0                	test   %al,%al
 2a8:	75 0f                	jne    2b9 <matchhere+0x68>
    return *text == '\0';
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	8a 00                	mov    (%eax),%al
 2af:	84 c0                	test   %al,%al
 2b1:	0f 94 c0             	sete   %al
 2b4:	0f b6 c0             	movzbl %al,%eax
 2b7:	eb 3d                	jmp    2f6 <matchhere+0xa5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bc:	8a 00                	mov    (%eax),%al
 2be:	84 c0                	test   %al,%al
 2c0:	74 2f                	je     2f1 <matchhere+0xa0>
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
 2c5:	8a 00                	mov    (%eax),%al
 2c7:	3c 2e                	cmp    $0x2e,%al
 2c9:	74 0e                	je     2d9 <matchhere+0x88>
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	8a 10                	mov    (%eax),%dl
 2d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d3:	8a 00                	mov    (%eax),%al
 2d5:	38 c2                	cmp    %al,%dl
 2d7:	75 18                	jne    2f1 <matchhere+0xa0>
    return matchhere(re+1, text+1);
 2d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dc:	8d 50 01             	lea    0x1(%eax),%edx
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	40                   	inc    %eax
 2e3:	89 54 24 04          	mov    %edx,0x4(%esp)
 2e7:	89 04 24             	mov    %eax,(%esp)
 2ea:	e8 62 ff ff ff       	call   251 <matchhere>
 2ef:	eb 05                	jmp    2f6 <matchhere+0xa5>
  return 0;
 2f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f6:	c9                   	leave  
 2f7:	c3                   	ret    

000002f8 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 2fe:	8b 45 10             	mov    0x10(%ebp),%eax
 301:	89 44 24 04          	mov    %eax,0x4(%esp)
 305:	8b 45 0c             	mov    0xc(%ebp),%eax
 308:	89 04 24             	mov    %eax,(%esp)
 30b:	e8 41 ff ff ff       	call   251 <matchhere>
 310:	85 c0                	test   %eax,%eax
 312:	74 07                	je     31b <matchstar+0x23>
      return 1;
 314:	b8 01 00 00 00       	mov    $0x1,%eax
 319:	eb 29                	jmp    344 <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 31b:	8b 45 10             	mov    0x10(%ebp),%eax
 31e:	8a 00                	mov    (%eax),%al
 320:	84 c0                	test   %al,%al
 322:	74 1b                	je     33f <matchstar+0x47>
 324:	8b 45 10             	mov    0x10(%ebp),%eax
 327:	8a 00                	mov    (%eax),%al
 329:	0f be c0             	movsbl %al,%eax
 32c:	3b 45 08             	cmp    0x8(%ebp),%eax
 32f:	0f 94 c0             	sete   %al
 332:	ff 45 10             	incl   0x10(%ebp)
 335:	84 c0                	test   %al,%al
 337:	75 c5                	jne    2fe <matchstar+0x6>
 339:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 33d:	74 bf                	je     2fe <matchstar+0x6>
  return 0;
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 344:	c9                   	leave  
 345:	c3                   	ret    
 346:	66 90                	xchg   %ax,%ax

00000348 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	57                   	push   %edi
 34c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 34d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 350:	8b 55 10             	mov    0x10(%ebp),%edx
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	89 cb                	mov    %ecx,%ebx
 358:	89 df                	mov    %ebx,%edi
 35a:	89 d1                	mov    %edx,%ecx
 35c:	fc                   	cld    
 35d:	f3 aa                	rep stos %al,%es:(%edi)
 35f:	89 ca                	mov    %ecx,%edx
 361:	89 fb                	mov    %edi,%ebx
 363:	89 5d 08             	mov    %ebx,0x8(%ebp)
 366:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 369:	5b                   	pop    %ebx
 36a:	5f                   	pop    %edi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    

0000036d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 379:	90                   	nop
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	8a 10                	mov    (%eax),%dl
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	88 10                	mov    %dl,(%eax)
 384:	8b 45 08             	mov    0x8(%ebp),%eax
 387:	8a 00                	mov    (%eax),%al
 389:	84 c0                	test   %al,%al
 38b:	0f 95 c0             	setne  %al
 38e:	ff 45 08             	incl   0x8(%ebp)
 391:	ff 45 0c             	incl   0xc(%ebp)
 394:	84 c0                	test   %al,%al
 396:	75 e2                	jne    37a <strcpy+0xd>
    ;
  return os;
 398:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39b:	c9                   	leave  
 39c:	c3                   	ret    

0000039d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3a0:	eb 06                	jmp    3a8 <strcmp+0xb>
    p++, q++;
 3a2:	ff 45 08             	incl   0x8(%ebp)
 3a5:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	8a 00                	mov    (%eax),%al
 3ad:	84 c0                	test   %al,%al
 3af:	74 0e                	je     3bf <strcmp+0x22>
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	8a 10                	mov    (%eax),%dl
 3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b9:	8a 00                	mov    (%eax),%al
 3bb:	38 c2                	cmp    %al,%dl
 3bd:	74 e3                	je     3a2 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	8a 00                	mov    (%eax),%al
 3c4:	0f b6 d0             	movzbl %al,%edx
 3c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ca:	8a 00                	mov    (%eax),%al
 3cc:	0f b6 c0             	movzbl %al,%eax
 3cf:	89 d1                	mov    %edx,%ecx
 3d1:	29 c1                	sub    %eax,%ecx
 3d3:	89 c8                	mov    %ecx,%eax
}
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret    

000003d7 <strlen>:

uint
strlen(char *s)
{
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3dd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e4:	eb 03                	jmp    3e9 <strlen+0x12>
 3e6:	ff 45 fc             	incl   -0x4(%ebp)
 3e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3ec:	8b 45 08             	mov    0x8(%ebp),%eax
 3ef:	01 d0                	add    %edx,%eax
 3f1:	8a 00                	mov    (%eax),%al
 3f3:	84 c0                	test   %al,%al
 3f5:	75 ef                	jne    3e6 <strlen+0xf>
    ;
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memset>:

void*
memset(void *dst, int c, uint n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 402:	8b 45 10             	mov    0x10(%ebp),%eax
 405:	89 44 24 08          	mov    %eax,0x8(%esp)
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	89 44 24 04          	mov    %eax,0x4(%esp)
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	89 04 24             	mov    %eax,(%esp)
 416:	e8 2d ff ff ff       	call   348 <stosb>
  return dst;
 41b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41e:	c9                   	leave  
 41f:	c3                   	ret    

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	83 ec 04             	sub    $0x4,%esp
 426:	8b 45 0c             	mov    0xc(%ebp),%eax
 429:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 42c:	eb 12                	jmp    440 <strchr+0x20>
    if(*s == c)
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	8a 00                	mov    (%eax),%al
 433:	3a 45 fc             	cmp    -0x4(%ebp),%al
 436:	75 05                	jne    43d <strchr+0x1d>
      return (char*)s;
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	eb 11                	jmp    44e <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 43d:	ff 45 08             	incl   0x8(%ebp)
 440:	8b 45 08             	mov    0x8(%ebp),%eax
 443:	8a 00                	mov    (%eax),%al
 445:	84 c0                	test   %al,%al
 447:	75 e5                	jne    42e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 449:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44e:	c9                   	leave  
 44f:	c3                   	ret    

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 456:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 45d:	eb 42                	jmp    4a1 <gets+0x51>
    cc = read(0, &c, 1);
 45f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 466:	00 
 467:	8d 45 ef             	lea    -0x11(%ebp),%eax
 46a:	89 44 24 04          	mov    %eax,0x4(%esp)
 46e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 475:	e8 32 01 00 00       	call   5ac <read>
 47a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 47d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 481:	7e 29                	jle    4ac <gets+0x5c>
      break;
    buf[i++] = c;
 483:	8b 55 f4             	mov    -0xc(%ebp),%edx
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	01 c2                	add    %eax,%edx
 48b:	8a 45 ef             	mov    -0x11(%ebp),%al
 48e:	88 02                	mov    %al,(%edx)
 490:	ff 45 f4             	incl   -0xc(%ebp)
    if(c == '\n' || c == '\r')
 493:	8a 45 ef             	mov    -0x11(%ebp),%al
 496:	3c 0a                	cmp    $0xa,%al
 498:	74 13                	je     4ad <gets+0x5d>
 49a:	8a 45 ef             	mov    -0x11(%ebp),%al
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	74 0c                	je     4ad <gets+0x5d>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a4:	40                   	inc    %eax
 4a5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4a8:	7c b5                	jl     45f <gets+0xf>
 4aa:	eb 01                	jmp    4ad <gets+0x5d>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ac:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	01 d0                	add    %edx,%eax
 4b5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <stat>:

int
stat(char *n, struct stat *st)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4ca:	00 
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	89 04 24             	mov    %eax,(%esp)
 4d1:	e8 fe 00 00 00       	call   5d4 <open>
 4d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4d9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4dd:	79 07                	jns    4e6 <stat+0x29>
    return -1;
 4df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e4:	eb 23                	jmp    509 <stat+0x4c>
  r = fstat(fd, st);
 4e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f0:	89 04 24             	mov    %eax,(%esp)
 4f3:	e8 f4 00 00 00       	call   5ec <fstat>
 4f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fe:	89 04 24             	mov    %eax,(%esp)
 501:	e8 b6 00 00 00       	call   5bc <close>
  return r;
 506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 518:	eb 21                	jmp    53b <atoi+0x30>
    n = n*10 + *s++ - '0';
 51a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 51d:	89 d0                	mov    %edx,%eax
 51f:	c1 e0 02             	shl    $0x2,%eax
 522:	01 d0                	add    %edx,%eax
 524:	d1 e0                	shl    %eax
 526:	89 c2                	mov    %eax,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	8a 00                	mov    (%eax),%al
 52d:	0f be c0             	movsbl %al,%eax
 530:	01 d0                	add    %edx,%eax
 532:	83 e8 30             	sub    $0x30,%eax
 535:	89 45 fc             	mov    %eax,-0x4(%ebp)
 538:	ff 45 08             	incl   0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53b:	8b 45 08             	mov    0x8(%ebp),%eax
 53e:	8a 00                	mov    (%eax),%al
 540:	3c 2f                	cmp    $0x2f,%al
 542:	7e 09                	jle    54d <atoi+0x42>
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	8a 00                	mov    (%eax),%al
 549:	3c 39                	cmp    $0x39,%al
 54b:	7e cd                	jle    51a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 54d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 550:	c9                   	leave  
 551:	c3                   	ret    

00000552 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 552:	55                   	push   %ebp
 553:	89 e5                	mov    %esp,%ebp
 555:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 55e:	8b 45 0c             	mov    0xc(%ebp),%eax
 561:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 564:	eb 10                	jmp    576 <memmove+0x24>
    *dst++ = *src++;
 566:	8b 45 f8             	mov    -0x8(%ebp),%eax
 569:	8a 10                	mov    (%eax),%dl
 56b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 56e:	88 10                	mov    %dl,(%eax)
 570:	ff 45 fc             	incl   -0x4(%ebp)
 573:	ff 45 f8             	incl   -0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 576:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 57a:	0f 9f c0             	setg   %al
 57d:	ff 4d 10             	decl   0x10(%ebp)
 580:	84 c0                	test   %al,%al
 582:	75 e2                	jne    566 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
}
 587:	c9                   	leave  
 588:	c3                   	ret    
 589:	66 90                	xchg   %ax,%ax
 58b:	90                   	nop

0000058c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58c:	b8 01 00 00 00       	mov    $0x1,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <exit>:
SYSCALL(exit)
 594:	b8 02 00 00 00       	mov    $0x2,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <wait>:
SYSCALL(wait)
 59c:	b8 03 00 00 00       	mov    $0x3,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <pipe>:
SYSCALL(pipe)
 5a4:	b8 04 00 00 00       	mov    $0x4,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <read>:
SYSCALL(read)
 5ac:	b8 05 00 00 00       	mov    $0x5,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <write>:
SYSCALL(write)
 5b4:	b8 10 00 00 00       	mov    $0x10,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <close>:
SYSCALL(close)
 5bc:	b8 15 00 00 00       	mov    $0x15,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <kill>:
SYSCALL(kill)
 5c4:	b8 06 00 00 00       	mov    $0x6,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <exec>:
SYSCALL(exec)
 5cc:	b8 07 00 00 00       	mov    $0x7,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <open>:
SYSCALL(open)
 5d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <mknod>:
SYSCALL(mknod)
 5dc:	b8 11 00 00 00       	mov    $0x11,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <unlink>:
SYSCALL(unlink)
 5e4:	b8 12 00 00 00       	mov    $0x12,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <fstat>:
SYSCALL(fstat)
 5ec:	b8 08 00 00 00       	mov    $0x8,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <link>:
SYSCALL(link)
 5f4:	b8 13 00 00 00       	mov    $0x13,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <mkdir>:
SYSCALL(mkdir)
 5fc:	b8 14 00 00 00       	mov    $0x14,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <chdir>:
SYSCALL(chdir)
 604:	b8 09 00 00 00       	mov    $0x9,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <dup>:
SYSCALL(dup)
 60c:	b8 0a 00 00 00       	mov    $0xa,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <getpid>:
SYSCALL(getpid)
 614:	b8 0b 00 00 00       	mov    $0xb,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <sbrk>:
SYSCALL(sbrk)
 61c:	b8 0c 00 00 00       	mov    $0xc,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <sleep>:
SYSCALL(sleep)
 624:	b8 0d 00 00 00       	mov    $0xd,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <uptime>:
SYSCALL(uptime)
 62c:	b8 0e 00 00 00       	mov    $0xe,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <getppid>:
SYSCALL(getppid)        // USER DEFINED SYS CALL
 634:	b8 16 00 00 00       	mov    $0x16,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <icount>:
SYSCALL(icount)         // USER DEFINED SYS CALL
 63c:	b8 17 00 00 00       	mov    $0x17,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <signal>:
SYSCALL(signal)         // USER DEFINED SYS CALL
 644:	b8 18 00 00 00       	mov    $0x18,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 64c:	55                   	push   %ebp
 64d:	89 e5                	mov    %esp,%ebp
 64f:	83 ec 28             	sub    $0x28,%esp
 652:	8b 45 0c             	mov    0xc(%ebp),%eax
 655:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 658:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 65f:	00 
 660:	8d 45 f4             	lea    -0xc(%ebp),%eax
 663:	89 44 24 04          	mov    %eax,0x4(%esp)
 667:	8b 45 08             	mov    0x8(%ebp),%eax
 66a:	89 04 24             	mov    %eax,(%esp)
 66d:	e8 42 ff ff ff       	call   5b4 <write>
}
 672:	c9                   	leave  
 673:	c3                   	ret    

00000674 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 67a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 681:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 685:	74 17                	je     69e <printint+0x2a>
 687:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 68b:	79 11                	jns    69e <printint+0x2a>
    neg = 1;
 68d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 694:	8b 45 0c             	mov    0xc(%ebp),%eax
 697:	f7 d8                	neg    %eax
 699:	89 45 ec             	mov    %eax,-0x14(%ebp)
 69c:	eb 06                	jmp    6a4 <printint+0x30>
  } else {
    x = xx;
 69e:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b1:	ba 00 00 00 00       	mov    $0x0,%edx
 6b6:	f7 f1                	div    %ecx
 6b8:	89 d0                	mov    %edx,%eax
 6ba:	8a 80 e8 0d 00 00    	mov    0xde8(%eax),%al
 6c0:	8d 4d dc             	lea    -0x24(%ebp),%ecx
 6c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 6c6:	01 ca                	add    %ecx,%edx
 6c8:	88 02                	mov    %al,(%edx)
 6ca:	ff 45 f4             	incl   -0xc(%ebp)
  }while((x /= base) != 0);
 6cd:	8b 55 10             	mov    0x10(%ebp),%edx
 6d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 6d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d6:	ba 00 00 00 00       	mov    $0x0,%edx
 6db:	f7 75 d4             	divl   -0x2c(%ebp)
 6de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6e5:	75 c4                	jne    6ab <printint+0x37>
  if(neg)
 6e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6eb:	74 2c                	je     719 <printint+0xa5>
    buf[i++] = '-';
 6ed:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f3:	01 d0                	add    %edx,%eax
 6f5:	c6 00 2d             	movb   $0x2d,(%eax)
 6f8:	ff 45 f4             	incl   -0xc(%ebp)

  while(--i >= 0)
 6fb:	eb 1c                	jmp    719 <printint+0xa5>
    putc(fd, buf[i]);
 6fd:	8d 55 dc             	lea    -0x24(%ebp),%edx
 700:	8b 45 f4             	mov    -0xc(%ebp),%eax
 703:	01 d0                	add    %edx,%eax
 705:	8a 00                	mov    (%eax),%al
 707:	0f be c0             	movsbl %al,%eax
 70a:	89 44 24 04          	mov    %eax,0x4(%esp)
 70e:	8b 45 08             	mov    0x8(%ebp),%eax
 711:	89 04 24             	mov    %eax,(%esp)
 714:	e8 33 ff ff ff       	call   64c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 719:	ff 4d f4             	decl   -0xc(%ebp)
 71c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 720:	79 db                	jns    6fd <printint+0x89>
    putc(fd, buf[i]);
}
 722:	c9                   	leave  
 723:	c3                   	ret    

00000724 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 72a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 731:	8d 45 0c             	lea    0xc(%ebp),%eax
 734:	83 c0 04             	add    $0x4,%eax
 737:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 73a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 741:	e9 78 01 00 00       	jmp    8be <printf+0x19a>
    c = fmt[i] & 0xff;
 746:	8b 55 0c             	mov    0xc(%ebp),%edx
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	01 d0                	add    %edx,%eax
 74e:	8a 00                	mov    (%eax),%al
 750:	0f be c0             	movsbl %al,%eax
 753:	25 ff 00 00 00       	and    $0xff,%eax
 758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 75b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 75f:	75 2c                	jne    78d <printf+0x69>
      if(c == '%'){
 761:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 765:	75 0c                	jne    773 <printf+0x4f>
        state = '%';
 767:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 76e:	e9 48 01 00 00       	jmp    8bb <printf+0x197>
      } else {
        putc(fd, c);
 773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 776:	0f be c0             	movsbl %al,%eax
 779:	89 44 24 04          	mov    %eax,0x4(%esp)
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	89 04 24             	mov    %eax,(%esp)
 783:	e8 c4 fe ff ff       	call   64c <putc>
 788:	e9 2e 01 00 00       	jmp    8bb <printf+0x197>
      }
    } else if(state == '%'){
 78d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 791:	0f 85 24 01 00 00    	jne    8bb <printf+0x197>
      if(c == 'd'){
 797:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 79b:	75 2d                	jne    7ca <printf+0xa6>
        printint(fd, *ap, 10, 1);
 79d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7a9:	00 
 7aa:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7b1:	00 
 7b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	89 04 24             	mov    %eax,(%esp)
 7bc:	e8 b3 fe ff ff       	call   674 <printint>
        ap++;
 7c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c5:	e9 ea 00 00 00       	jmp    8b4 <printf+0x190>
      } else if(c == 'x' || c == 'p'){
 7ca:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7ce:	74 06                	je     7d6 <printf+0xb2>
 7d0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7d4:	75 2d                	jne    803 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 7d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d9:	8b 00                	mov    (%eax),%eax
 7db:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7e2:	00 
 7e3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7ea:	00 
 7eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ef:	8b 45 08             	mov    0x8(%ebp),%eax
 7f2:	89 04 24             	mov    %eax,(%esp)
 7f5:	e8 7a fe ff ff       	call   674 <printint>
        ap++;
 7fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7fe:	e9 b1 00 00 00       	jmp    8b4 <printf+0x190>
      } else if(c == 's'){
 803:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 807:	75 43                	jne    84c <printf+0x128>
        s = (char*)*ap;
 809:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80c:	8b 00                	mov    (%eax),%eax
 80e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 811:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 815:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 819:	75 25                	jne    840 <printf+0x11c>
          s = "(null)";
 81b:	c7 45 f4 22 0b 00 00 	movl   $0xb22,-0xc(%ebp)
        while(*s != 0){
 822:	eb 1c                	jmp    840 <printf+0x11c>
          putc(fd, *s);
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	8a 00                	mov    (%eax),%al
 829:	0f be c0             	movsbl %al,%eax
 82c:	89 44 24 04          	mov    %eax,0x4(%esp)
 830:	8b 45 08             	mov    0x8(%ebp),%eax
 833:	89 04 24             	mov    %eax,(%esp)
 836:	e8 11 fe ff ff       	call   64c <putc>
          s++;
 83b:	ff 45 f4             	incl   -0xc(%ebp)
 83e:	eb 01                	jmp    841 <printf+0x11d>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 840:	90                   	nop
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8a 00                	mov    (%eax),%al
 846:	84 c0                	test   %al,%al
 848:	75 da                	jne    824 <printf+0x100>
 84a:	eb 68                	jmp    8b4 <printf+0x190>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 84c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 850:	75 1d                	jne    86f <printf+0x14b>
        putc(fd, *ap);
 852:	8b 45 e8             	mov    -0x18(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	0f be c0             	movsbl %al,%eax
 85a:	89 44 24 04          	mov    %eax,0x4(%esp)
 85e:	8b 45 08             	mov    0x8(%ebp),%eax
 861:	89 04 24             	mov    %eax,(%esp)
 864:	e8 e3 fd ff ff       	call   64c <putc>
        ap++;
 869:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 86d:	eb 45                	jmp    8b4 <printf+0x190>
      } else if(c == '%'){
 86f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 873:	75 17                	jne    88c <printf+0x168>
        putc(fd, c);
 875:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 878:	0f be c0             	movsbl %al,%eax
 87b:	89 44 24 04          	mov    %eax,0x4(%esp)
 87f:	8b 45 08             	mov    0x8(%ebp),%eax
 882:	89 04 24             	mov    %eax,(%esp)
 885:	e8 c2 fd ff ff       	call   64c <putc>
 88a:	eb 28                	jmp    8b4 <printf+0x190>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 88c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 893:	00 
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	89 04 24             	mov    %eax,(%esp)
 89a:	e8 ad fd ff ff       	call   64c <putc>
        putc(fd, c);
 89f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a2:	0f be c0             	movsbl %al,%eax
 8a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 98 fd ff ff       	call   64c <putc>
      }
      state = 0;
 8b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8bb:	ff 45 f0             	incl   -0x10(%ebp)
 8be:	8b 55 0c             	mov    0xc(%ebp),%edx
 8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c4:	01 d0                	add    %edx,%eax
 8c6:	8a 00                	mov    (%eax),%al
 8c8:	84 c0                	test   %al,%al
 8ca:	0f 85 76 fe ff ff    	jne    746 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8d0:	c9                   	leave  
 8d1:	c3                   	ret    
 8d2:	66 90                	xchg   %ax,%ax

000008d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	83 e8 08             	sub    $0x8,%eax
 8e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e3:	a1 08 0e 00 00       	mov    0xe08,%eax
 8e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8eb:	eb 24                	jmp    911 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f0:	8b 00                	mov    (%eax),%eax
 8f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f5:	77 12                	ja     909 <free+0x35>
 8f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fd:	77 24                	ja     923 <free+0x4f>
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	8b 00                	mov    (%eax),%eax
 904:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 907:	77 1a                	ja     923 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 917:	76 d4                	jbe    8ed <free+0x19>
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 921:	76 ca                	jbe    8ed <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 923:	8b 45 f8             	mov    -0x8(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 930:	8b 45 f8             	mov    -0x8(%ebp),%eax
 933:	01 c2                	add    %eax,%edx
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	39 c2                	cmp    %eax,%edx
 93c:	75 24                	jne    962 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 93e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 941:	8b 50 04             	mov    0x4(%eax),%edx
 944:	8b 45 fc             	mov    -0x4(%ebp),%eax
 947:	8b 00                	mov    (%eax),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	01 c2                	add    %eax,%edx
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 954:	8b 45 fc             	mov    -0x4(%ebp),%eax
 957:	8b 00                	mov    (%eax),%eax
 959:	8b 10                	mov    (%eax),%edx
 95b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95e:	89 10                	mov    %edx,(%eax)
 960:	eb 0a                	jmp    96c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 962:	8b 45 fc             	mov    -0x4(%ebp),%eax
 965:	8b 10                	mov    (%eax),%edx
 967:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 96c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96f:	8b 40 04             	mov    0x4(%eax),%eax
 972:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	01 d0                	add    %edx,%eax
 97e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 981:	75 20                	jne    9a3 <free+0xcf>
    p->s.size += bp->s.size;
 983:	8b 45 fc             	mov    -0x4(%ebp),%eax
 986:	8b 50 04             	mov    0x4(%eax),%edx
 989:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	01 c2                	add    %eax,%edx
 991:	8b 45 fc             	mov    -0x4(%ebp),%eax
 994:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 997:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99a:	8b 10                	mov    (%eax),%edx
 99c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99f:	89 10                	mov    %edx,(%eax)
 9a1:	eb 08                	jmp    9ab <free+0xd7>
  } else
    p->s.ptr = bp;
 9a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9a9:	89 10                	mov    %edx,(%eax)
  freep = p;
 9ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ae:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 9b3:	c9                   	leave  
 9b4:	c3                   	ret    

000009b5 <morecore>:

static Header*
morecore(uint nu)
{
 9b5:	55                   	push   %ebp
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9bb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9c2:	77 07                	ja     9cb <morecore+0x16>
    nu = 4096;
 9c4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ce:	c1 e0 03             	shl    $0x3,%eax
 9d1:	89 04 24             	mov    %eax,(%esp)
 9d4:	e8 43 fc ff ff       	call   61c <sbrk>
 9d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9dc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9e0:	75 07                	jne    9e9 <morecore+0x34>
    return 0;
 9e2:	b8 00 00 00 00       	mov    $0x0,%eax
 9e7:	eb 22                	jmp    a0b <morecore+0x56>
  hp = (Header*)p;
 9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f2:	8b 55 08             	mov    0x8(%ebp),%edx
 9f5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fb:	83 c0 08             	add    $0x8,%eax
 9fe:	89 04 24             	mov    %eax,(%esp)
 a01:	e8 ce fe ff ff       	call   8d4 <free>
  return freep;
 a06:	a1 08 0e 00 00       	mov    0xe08,%eax
}
 a0b:	c9                   	leave  
 a0c:	c3                   	ret    

00000a0d <malloc>:

void*
malloc(uint nbytes)
{
 a0d:	55                   	push   %ebp
 a0e:	89 e5                	mov    %esp,%ebp
 a10:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
 a16:	83 c0 07             	add    $0x7,%eax
 a19:	c1 e8 03             	shr    $0x3,%eax
 a1c:	40                   	inc    %eax
 a1d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a20:	a1 08 0e 00 00       	mov    0xe08,%eax
 a25:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a28:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a2c:	75 23                	jne    a51 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 a2e:	c7 45 f0 00 0e 00 00 	movl   $0xe00,-0x10(%ebp)
 a35:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a38:	a3 08 0e 00 00       	mov    %eax,0xe08
 a3d:	a1 08 0e 00 00       	mov    0xe08,%eax
 a42:	a3 00 0e 00 00       	mov    %eax,0xe00
    base.s.size = 0;
 a47:	c7 05 04 0e 00 00 00 	movl   $0x0,0xe04
 a4e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a54:	8b 00                	mov    (%eax),%eax
 a56:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5c:	8b 40 04             	mov    0x4(%eax),%eax
 a5f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a62:	72 4d                	jb     ab1 <malloc+0xa4>
      if(p->s.size == nunits)
 a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a67:	8b 40 04             	mov    0x4(%eax),%eax
 a6a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a6d:	75 0c                	jne    a7b <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a72:	8b 10                	mov    (%eax),%edx
 a74:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a77:	89 10                	mov    %edx,(%eax)
 a79:	eb 26                	jmp    aa1 <malloc+0x94>
      else {
        p->s.size -= nunits;
 a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7e:	8b 40 04             	mov    0x4(%eax),%eax
 a81:	89 c2                	mov    %eax,%edx
 a83:	2b 55 ec             	sub    -0x14(%ebp),%edx
 a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a89:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8f:	8b 40 04             	mov    0x4(%eax),%eax
 a92:	c1 e0 03             	shl    $0x3,%eax
 a95:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a9e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa4:	a3 08 0e 00 00       	mov    %eax,0xe08
      return (void*)(p + 1);
 aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aac:	83 c0 08             	add    $0x8,%eax
 aaf:	eb 38                	jmp    ae9 <malloc+0xdc>
    }
    if(p == freep)
 ab1:	a1 08 0e 00 00       	mov    0xe08,%eax
 ab6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ab9:	75 1b                	jne    ad6 <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 abb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abe:	89 04 24             	mov    %eax,(%esp)
 ac1:	e8 ef fe ff ff       	call   9b5 <morecore>
 ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ac9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 acd:	75 07                	jne    ad6 <malloc+0xc9>
        return 0;
 acf:	b8 00 00 00 00       	mov    $0x0,%eax
 ad4:	eb 13                	jmp    ae9 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 adc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adf:	8b 00                	mov    (%eax),%eax
 ae1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ae4:	e9 70 ff ff ff       	jmp    a59 <malloc+0x4c>
}
 ae9:	c9                   	leave  
 aea:	c3                   	ret    
