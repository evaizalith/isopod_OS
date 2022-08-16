lgdt [gdt_descriptor]  ; load Global Descriptor Table

mov eax, cr0
or eax, 0x1
mov cr0, eax

jmp CODE_SEG:init_pm   ; far jump to 32 bit segment

[bits 32]
init_pm:
    mov ax, DATA_SEG   ; point segment registers to data defined in GDT
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000   ; update stack position
    mov esp, ebp

    call BEGIN_PM