all: iso

iso: kernel.iso

kernel.iso: kernel.elf iso/boot/grub/grub.cfg
	cp kernel.elf iso/boot/kernel.elf
	grub2-mkrescue -o kernel.iso iso -- -quiet

kernel.elf: kernel.ld multiboot_header.o startup.o serial.o
	x86_64-elf-ld -n -o $@ -T $^

%.o: %.asm
	nasm -f elf64 -o $@ $^

run: kernel.iso
	qemu-system-x86_64 -cdrom kernel.iso -serial stdio

debug: kernel.iso
	qemu-system-x86_64 -cdrom kernel.iso -monitor stdio

dump: kernel.elf
	x86_64-elf-objdump -d -M intel kernel.elf

clean:
	rm -f *.iso *.elf *.o iso/boot/kernel.elf
