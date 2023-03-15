
BUILD:=../build
SRC:=.



$(BUILD)/boot/%.bin: $(SRC)/boot/%.asm
	$(shell mkdir -p $(dir $@))
	nasm -f bin $< -o $@

$(BUILD)/master.img: $(BUILD)/boot/boot.bin \

	yes | bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $@
	dd if=$(BUILD)/boot/boot.bin of=$@ bs=512 count=1 conv=notrunc

.PHONY: test
test: $(BUILD)/master.img

.PHONY: bochs
bochs: $(BUILD)/master.img
	bochs -q -f ../bochs/bochsrc

.PHONY: bochsg
bochsg: $(BUILD)/master.img
	bochs-gdb -q -f ../bochs/bochsrc.gdb

.PHONY: qemu
qemu: $(BUILD)/master.img
	qemu-system-i386 \
	 -m 32M -boot c -hda $<

.PHONY: qemug
qemug: $(BUILD)/master.img
	qemu-system-i386 -s -S \
	 -m 32M -boot c -hda $<


$(BUILD)/master.vmdk: $(BUILD)/master.img
	qemu-img.exe convert -O vmdk $< $@

.PHONY: vmdk
vmdk: $(BUILD)/master.vmdk