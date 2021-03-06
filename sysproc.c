#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "traps.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

// USER DEFINED SYS CALL
int
sys_getppid(void)
{ 
  if(proc->parent == 0)
      return (0);

  return proc->parent->pid;
}

// USER DEFINED SYS CALL
int
sys_icount(void)
{
  int cnt = 0;//kbd_int_count;
  return cnt;
}

int
sys_signal(void)
{
  int signum;
  sighandler_t signal_handler;
  
  if(argint(0, &signum) < 0)
    return -1;
  if((signum != 0) && (signum != 1))
    return -1;
  if(argsig(1, &signal_handler) < 0)  // Get 2nd argument
    return -1;
      
  return (signal(signum, signal_handler));
}

int
sys_clone(void)
{
  int temp;
  void *fcn_arg, *stack_arg, *arg_arg;

  if(argint(0, &temp) < 0)
    return -1;
  fcn_arg = (void *) temp;

  if(argint(1, &temp) < 0)
    return -1;
  arg_arg = (void *) temp;

  if(argint(2, &temp) < 0)
    stack_arg = (void *) temp;

  return clone(fcn_arg, arg_arg, stack_arg);

}

int
sys_join(void)
{

  void **stack_arg;
  int pid;

  if(argptr(0, (void *) &stack_arg, sizeof(void *)) < 0)
    return -1;

  while((pid = join(stack_arg)) != -1);
  //pid = join(stack_arg);
  return pid;

  //return 1;

  //return join(stack_arg);
}

int 
sys_listprocesses(void)
{
  return listprocesses();
}









