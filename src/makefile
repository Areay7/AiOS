
boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

master.img:boot.bin
	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat master.img 
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

.PHINY: clean
clean:
	rm -rf *.bin
	rm -rf *.img

.PHINY: bochs
bochs: master.img
	bochs -q
