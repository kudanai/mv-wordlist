COMPONENT_DIR := 'components'
OUTPUT_PATH   := 'wordlist.lst'
GREP_EXPR     := '(^\#|^$$)'

all:
	zgrep -Ev --no-filename $(GREP_EXPR) $(COMPONENT_DIR)/* | sort | uniq > $(OUTPUT_PATH)
	@wc -l $(OUTPUT_PATH)

comp_components:
	@echo "compressing component lists"
	gzip $(COMPONENT_DIR)/*.lst

decomp_components:
	@echo "decompressing component lists"
	gunzip $(COMPONENT_DIR)/*.gz
	
clean:
	rm -f $(OUTPUT_PATH)
