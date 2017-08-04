iso: kernel.iso

run: kernel.iso
	qemu-system-x86_64 -cdrom kernel.iso -monitor stdio

kernel.iso: kernel.bin
	cp kernel.bin iso/boot/kernel.bin
	grub2-mkrescue -o kernel.iso iso

clean:
	rm -f *.iso *.bin *.o iso/boot/kernel.bin

kernel.bin: linker.ld multiboot_header.o boot.o
	x86_64-elf-ld -n -o $@ -T $^

%.o: %.s
	x86_64-elf-as -o $@ $^

dump:
	x86_64-elf-objdump -h kernel.bin
