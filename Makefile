BAMBU=bambu
TARGET?=
_TARGET_FIRMWARE_NNET=$(TARGET)/nnet_utils

all:
ifeq ($(TARGET),)
	@echo Testing on all targets
	@for target in ./firmwares/*/; do [ -d "$$target" ] && make TARGET="$$target"; done
else
	@echo Testing on target $(TARGET)
	@rm -rf $(_TARGET_FIRMWARE_NNET)
	@cp -r ./nnet_utils $(_TARGET_FIRMWARE_NNET)
endif


.PHONY: all

