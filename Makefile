PAPER = main

LATEX_FLAGS = -shell-escape

all:
	xelatex $(LATEX_FLAGS) $(PAPER)
	bibtex  $(PAPER)
	xelatex $(LATEX_FLAGS) $(PAPER)
	xelatex $(LATEX_FLAGS) $(PAPER)

.PHONY: clean

clean:
ifeq ($(OS), Windows_NT)     # is Windows_NT on XP, 2000, 7, Vista, 10...
	ps clean.ps1
else
	find $(dirname "$0") -regextype posix-extended  -regex ".*\.(aux|log|out|thm|toc|bbl|blg|fdb_latexmk|fls|gz)" -delete
	rm _* -rf
endif
