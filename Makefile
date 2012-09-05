COMPONENT_DIR := 'components'
OUTPUT_PATH   := 'wordlist.lst'
GREP_EXPR     := '(^\#|^$$)'

all:
	egrep -Ehv $(GREP_EXPR) $(COMPONENT_DIR)/* | sort | uniq > $(OUTPUT_PATH)
	@wc -l $(OUTPUT_PATH)

clean:
	rm -f $(OUTPUT_PATH)