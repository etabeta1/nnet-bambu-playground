BAMBU=bambu
TARGET?=
_TARGET_FIRMWARE_NNET=$(TARGET)/nnet_utils

BAMBU_COMPILE_FLAGS=--top-fname=myproject --generate-interface=INFER --compiler=I386_CLANG16 --print-dot --no-clean -lm

all:
ifeq (, $(shell which $(BAMBU)))
	$(error "Bambu not found")
endif
ifeq ($(TARGET),)
	@echo Testing on all targets
	@for target in ./firmwares/*/; do [ -d "$$target" ] && make TARGET="$$target"; done
else
	@echo Testing on target $(TARGET)
	@rm -rf $(_TARGET_FIRMWARE_NNET)
	@cp -r ./nnet_utils $(_TARGET_FIRMWARE_NNET)
	
	cd $(TARGET) && $(BAMBU) *.cpp $(BAMBU_COMPILE_FLAGS)

	# @rm -rf $(TARGET)/bambu/HLS_output/ $(TARGET)/bambu/panda_temp $(TARGET)/bambu/synthesize_*_.sh
endif


.PHONY: all

