BUILD:=../build
SRC:=.

CFLAGS:= -m32 # 32位程序
CFLAGS+= -fno-builtin # 不需要 gcc 内置函数
CFLAGS+= -nostdinc # 不需要标准头文件
CFLAGS+= -fno-pic # 不需要位置无关的代码 position independent code 
CFLAGS+= -fno-pie # 不需要位置无关的可执行程序 position independent executable
CFLAGS+= -nostdlib # 不需要标准库
CFLAGS+= -fno-stack-protector # 不需要栈保护
CFLAGS:= $(strip ${CFLAGS})

DEBUG:= -g
INCLUDE:= -I $(SRC)/include

ENTRYPOINT:=0x10000

$(BUILD)/boot/%.bin: $(SRC)/boot/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f elf32 $(DEBUG) $< -o $@

$(BUILD)/kernel/%.o: $(SRC)/kernel/%.c
	$(shell mkdir -p $(dir $@))
	gcc $(CFLAGS) $(DEBUG) $(INCLUDE) -c $^ -o $@

$(BUILD)/kernel.bin: $(BUILD)/kernel/start.o \
	$(BUILD)/kernel/main.o 

	$(shell mkdir -p $(dir $@))
	ld -m elf_i386 -static $^ -o $@ -Ttext $(ENTRYPOINT)
	
$(BUILD)/system.bin: $(BUILD)/kernel.bin 
	objcopy -O binary $< $@

$(BUILD)/system.map: $(BUILD)/kernel.bin 
	nm $< | sort > $@	

$(BUILD)/master.img: $(BUILD)/boot/boot.bin \
	$(BUILD)/boot/loader.bin \
	$(BUILD)/system.bin	\
	$(BUILD)/system.map \

	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@ 
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc
	dd if=$(BUILD)/boot/loader.bin of=$@ bs=512 count=4 seek=2 conv=notrunc
	dd if=$(BUILD)/system.bin of=$@ bs=512 count=200 seek=10 conv=notrunc

# .PHINY: usb
#usb: $(BUILD)/boot/boot.bin /dev/sdb
# 	sudo dd if=/dev/sdb of=tmp.bin bs=512 count=1 conv=notrunc	
# 	cp tmp.bin usb.bin
# 	sudo rm tmp.bin
# 	dd if=$(BUILD)/boot/boot.bin of=usb.bin bs=446 count=1 conv=notrunc
# 	sudo dd if=usb.bin of=/dev/sdb bs=512 count=1 conv=notrunc
# 	rm usb.bin	

test: $(BUILD)/master.img

.PHINY: clean
clean:
	rm -rf $(BUILD)

.PHINY: bochs
bochs: $(BUILD)/master.img
	bochs -q
