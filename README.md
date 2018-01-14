# timewarp-assembler
Timewarp dance in assembler

# What is it?
This an assembler coded version of lyrics of the Timewarp dance from *The Rocky Horror Picture Show*.

Lyrics upon which it is based by Richard O'Brien and Richard Hartley.

<http://en.wikipedia.org/wiki/The_Rocky_Horror_Picture_Show>

Coded in gnu assembler

# Why?

Couldn't resist

# Usage

You'll need the i686 packages in order to cross-compile it for 32-bit (elf32).
On RHEL7, that means adding:

- glibc-devel.i686
- libgcc.i686

I'm sure it's probably the same for Fedora.

Then run make:

```shell
make
./tw
```

# How call / ret instructions work

the `_drives_insane` label does something special if you hadn't noticed. A
`call` instruction saves the next instruction address by pushing it to the
stack, then jumps to the label address to execute, a `ret` instruction
automatically pops the stack to get the last address then jumps to that
address. We can manipluate that by popping the stack, then pushing our new
address into the stack. The `ret` instruction will then use our address.

1. `call` pushs the next instruction addr to the stack.
2. `call` then jumps to the label address to start execution.
3. instructions at label continue to execute.
4. upon reaching `ret`, that saved address is popped from the stack.
5. ret then jumps to that address to continue execution.

I change that behavior by:

1. `call` pushs the next instruction addr to the stack.
2. `call` then jumps to the label address to start execution.
3. instructions at label continue to execute.
4. **difference** pop saved address from stack and ignore it.
5. **difference** push our new label (new address) into the stack.
6. upon reaching `ret`, the new saved address is popped from the stack.
7. ret then jumps to the new address to continue execution.
