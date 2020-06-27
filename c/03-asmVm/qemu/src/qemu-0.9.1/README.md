# qemu 源碼解讀

```
cpu-exec.c -- 在 x86 模擬其他平台的主程式。
softmmu_*.h -- 軟體 MMU 模擬。
dyngen.c -- Generic Dynamic compiler generator
target-arm/ -- ARM 處理器
  cpu.h -- 處理器模型
  exec.h -- 
linux-user/
  main.c -- qemu user main
```

## linux-user/main.c

```c
#ifdef TARGET_ARM

/* XXX: find a better solution */
extern void tb_invalidate_page_range(abi_ulong start, abi_ulong end);

static void arm_cache_flush(abi_ulong start, abi_ulong last)
{
    abi_ulong addr, last1;

    if (last < start)
        return;
    addr = start;
    for(;;) {
        last1 = ((addr + TARGET_PAGE_SIZE) & TARGET_PAGE_MASK) - 1;
        if (last1 > last)
            last1 = last;
        tb_invalidate_page_range(addr, last1 + 1);
        if (last1 == last)
            break;
        addr = last1 + 1;
    }
}

void cpu_loop(CPUARMState *env)
{
    int trapnr;
    unsigned int n, insn;
    target_siginfo_t info;
    uint32_t addr;

    for(;;) {
        trapnr = cpu_arm_exec(env);
        switch(trapnr) {
        case EXCP_UDEF:
            {
                TaskState *ts = env->opaque;
                uint32_t opcode;

                /* we handle the FPU emulation here, as Linux */
                /* we get the opcode */
                /* FIXME - what to do if get_user() fails? */
                get_user_u32(opcode, env->regs[15]);

                if (EmulateAll(opcode, &ts->fpa, env) == 0) {
                    info.si_signo = SIGILL;
                    info.si_errno = 0;
                    info.si_code = TARGET_ILL_ILLOPN;
                    info._sifields._sigfault._addr = env->regs[15];
                    queue_signal(info.si_signo, &info);
                } else {
                    /* increment PC */
                    env->regs[15] += 4;
                }
            }
            break;
        case EXCP_SWI:
        case EXCP_BKPT:
            {
                env->eabi = 1;
                /* system call */
                if (trapnr == EXCP_BKPT) {
                    if (env->thumb) {
                        /* FIXME - what to do if get_user() fails? */
                        get_user_u16(insn, env->regs[15]);
                        n = insn & 0xff;
                        env->regs[15] += 2;
                    } else {
                        /* FIXME - what to do if get_user() fails? */
                        get_user_u32(insn, env->regs[15]);
                        n = (insn & 0xf) | ((insn >> 4) & 0xff0);
                        env->regs[15] += 4;
                    }
                } else {
                    if (env->thumb) {
                        /* FIXME - what to do if get_user() fails? */
                        get_user_u16(insn, env->regs[15] - 2);
                        n = insn & 0xff;
                    } else {
                        /* FIXME - what to do if get_user() fails? */
                        get_user_u32(insn, env->regs[15] - 4);
                        n = insn & 0xffffff;
                    }
                }

                if (n == ARM_NR_cacheflush) {
                    arm_cache_flush(env->regs[0], env->regs[1]);
                } else if (n == ARM_NR_semihosting
                           || n == ARM_NR_thumb_semihosting) {
                    env->regs[0] = do_arm_semihosting (env);
                } else if (n == 0 || n >= ARM_SYSCALL_BASE
                           || (env->thumb && n == ARM_THUMB_SYSCALL)) {
                    /* linux syscall */
                    if (env->thumb || n == 0) {
                        n = env->regs[7];
                    } else {
                        n -= ARM_SYSCALL_BASE;
                        env->eabi = 0;
                    }
                    env->regs[0] = do_syscall(env,
                                              n,
                                              env->regs[0],
                                              env->regs[1],
                                              env->regs[2],
                                              env->regs[3],
                                              env->regs[4],
                                              env->regs[5]);
                } else {
                    goto error;
                }
            }
            break;
        case EXCP_INTERRUPT:
            /* just indicate that signals should be handled asap */
            break;
        case EXCP_PREFETCH_ABORT:
            addr = env->cp15.c6_data;
            goto do_segv;
        case EXCP_DATA_ABORT:
            addr = env->cp15.c6_insn;
            goto do_segv;
        do_segv:
            {
                info.si_signo = SIGSEGV;
                info.si_errno = 0;
                /* XXX: check env->error_code */
                info.si_code = TARGET_SEGV_MAPERR;
                info._sifields._sigfault._addr = addr;
                queue_signal(info.si_signo, &info);
            }
            break;
        case EXCP_DEBUG:
            {
                int sig;

                sig = gdb_handlesig (env, TARGET_SIGTRAP);
                if (sig)
                  {
                    info.si_signo = sig;
                    info.si_errno = 0;
                    info.si_code = TARGET_TRAP_BRKPT;
                    queue_signal(info.si_signo, &info);
                  }
            }
            break;
        default:
        error:
            fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                    trapnr);
            cpu_dump_state(env, stderr, fprintf, 0);
            abort();
        }
        process_pending_signals(env);
    }
}

#endif
```
