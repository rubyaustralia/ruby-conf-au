NM=./node_modules
IN_STYLES=./styles
OUT_STYLES=../../public/2018/styles

AUTOPREFIXER=$(NM)/autoprefixer/autoprefixer

all: $(OUT_STYLES)/all.css
	echo "Built 2018 files"

clean:
	rm -r $(OUT_STYLES)

watch:
	make all
	watch "make all" $(IN_STYLES) --interval=0.1

vendor:
	cp ./node_modules/flexboxgrid2/flexboxgrid2.css ./styles/vendor/flexboxgrid2.scss
	cp ./node_modules/flexboxgrid/dist/flexboxgrid.css ./styles/vendor/flexboxgrid.scss
	cp ./node_modules/normalize.css/normalize.css ./styles/vendor/normalize.scss

$(AUTOPREFIXER):
	npm install

$(OUT_STYLES):
	mkdir -p $(OUT_STYLES)

$(OUT_STYLES)/all.css: vendor $(AUTOPREFIXER) $(OUT_STYLES) $(IN_STYLES)/*.scss
	scss --sourcemap=none $(IN_STYLES)/all.scss $@
	$(AUTOPREFIXER) $@
	md5 -q $@ > $(OUT_STYLES)/all.css.md5
