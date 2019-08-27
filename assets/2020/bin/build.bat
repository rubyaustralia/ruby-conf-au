echo "Building 2020 Assets"
mkdir -p ../../public/2020/styles

rem cp ./node_modules/normalize.css/normalize.css ./styles/vendor/normalize.scss
rem cp ./node_modules/flexboxgrid2/flexboxgrid2.css ./styles/vendor/flexboxgrid2.scss

cmd.exe /c sass --sourcemap=none --scss --load-path node_modules/foundation-sites/scss ./styles/all.scss ../../public/2020/styles/all.css

rem autoprefixer ../../public/2020/styles/all.css

certUtil -hashfile ../../public/2020/styles/all.css MD5 | findstr -V ":" > ../../public/2020/styles/all.css.md5
