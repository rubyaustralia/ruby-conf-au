NM=./node_modules
IN_STYLES=./styles
OUT_STYLES=../public/2015/styles

AUTOPREFIXER=$(NM)/autoprefixer/autoprefixer

all: $(OUT_STYLES)/all.css
	echo "Built 2015 files"

clean:
	rm -r $(OUT_STYLES)

watch:
	$(NM)/watching/bin/watching $(IN_STYLES) "make all"

$(AUTOPREFIXER):
	npm install

$(OUT_STYLES):
	mkdir -p $(OUT_STYLES)

$(OUT_STYLES)/all.css: $(AUTOPREFIXER) $(OUT_STYLES) $(IN_STYLES)/*.scss
	scss --sourcemap=none $(IN_STYLES)/all.scss $@
	$(AUTOPREFIXER) $@
	md5 -q $@ > $(OUT_STYLES)/all.css.md5
