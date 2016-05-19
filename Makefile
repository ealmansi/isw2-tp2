BUNDLE       = ISW2-TP2.tar.gz
BUNDLE_DIR   = ISW2-TP2
BUNDLE_FILES = tex Makefile README.md informe.pdf

.PHONY: all informe.pdf clean clean-tex bundle

all: informe.pdf

informe.pdf:
	make -C tex all
	mv tex/informe.pdf .

bundle: clean informe.pdf 
	make clean-tex
	mkdir $(BUNDLE_DIR)
	cp $(BUNDLE_FILES) $(BUNDLE_DIR) -r
	tar zcf $(BUNDLE) $(BUNDLE_DIR)
	rm -rf $(BUNDLE_DIR)

clean: clean-tex
	rm -rf informe.pdf
	find . -type f -name *.swp -delete
	find . -type f -name *.pyc -delete

clean-tex:
	make -C tex clean
