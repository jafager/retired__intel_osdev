all: iso

iso: kernel.iso

kernel.iso: kernel.elf iso/boot/grub/grub.cfg
	cp kernel.elf iso/boot/kernel.elf
	grub2-mkrescue -o kernel.iso iso

kernel.elf: kernel.ld multiboot_header.o startup.o
	x86_64-elf-ld -n -o $@ -T $^

%.o: %.s
	x86_64-elf-as -o $@ $^

run: kernel.iso
	qemu-system-x86_64 -cdrom kernel.iso

debug: kernel.iso
	qemu-system-x86_64 -cdrom kernel.iso -monitor stdio

dump: kernel.elf
	x86_64-elf-objdump -d kernel.elf

clean:
	rm -f *.iso *.elf *.o iso/boot/kernel.elf
