NM=./node_modules
IN_STYLES=./styles
OUT_STYLES=../public/2015/styles

all: $(OUT_STYLES)/all.css
	echo "Built 2015 files"

clean:
	rm -r $(OUT_STYLES)

$(OUT_STYLES)/all.css: $(OUT_STYLES) $(IN_STYLES)/*.scss
	scss $(IN_STYLES)/all.scss $@
	$(NM)/autoprefixer/autoprefixer $@
	md5 -q $@ > $(OUT_STYLES)/all.css.md5

$(OUT_STYLES):
	mkdir -p $(OUT_STYLES)
