# Build Grant Searle monitor with SjASMPlus
TARGET := monitor
SRC    := monitor-sjasmplus.asm
BUILD  := build

BIN := $(BUILD)/$(TARGET).bin
HEX := $(BUILD)/$(TARGET).hex
LST := $(BUILD)/$(TARGET).lst
SYM := $(BUILD)/$(TARGET).sym

.PHONY: all clean info

all: $(BIN)

$(BUILD):
	mkdir -p $(BUILD)

$(BIN): $(SRC) | $(BUILD)
	sjasmplus \
		--raw=$(BIN) \
		--hex=$(HEX) \
		--lst=$(LST) \
		--sym=$(SYM) \
		--cleanonerror \
		$(SRC)

clean:
	rm -rf $(BUILD)

info:
	@echo "SRC=$(SRC)"
	@echo "BIN=$(BIN)"
	@echo "HEX=$(HEX)"
	@echo "LST=$(LST)"
	@echo "SYM=$(SYM)"
