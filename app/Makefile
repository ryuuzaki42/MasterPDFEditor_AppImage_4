PWD:=$(shell pwd)

$(shell wget https://raw.githubusercontent.com/ryuuzaki42/MasterPDFEditor_AppImage/master/README.md)
VERSION := $(shell grep -o "MasterPDFEditor:.*" README.md | cut -d ' ' -f2)

.PHONY: all

all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/mpe
	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate libatk1.0-0

	# Check download links here:
	# https://code-industry.net/free-pdf-editor/

	echo "MasterPDFEditor version: $(VERSION)"

	#wget --output-document=$(PWD)/build/build.deb https://code-industry.net/public/master-pdf-editor-5.8.70-qt5_included.x86_64.deb
	wget --output-document=$(PWD)/build/build.deb https://code-industry.net/public/master-pdf-editor-$(VERSION)-qt5_included.x86_64.deb
	#wget --output-document=$(PWD)/build/build.deb https://code-industry.net/public/master-pdf-editor-5.9.61-qt5.9.x86_64.deb
	#wget --output-document=$(PWD)/build/build.deb https://code-industry.net/public/master-pdf-editor-$(VERSION)-qt5.9.x86_64.deb
	#wget --output-document=$(PWD)/build/build.deb https://code-industry.net/public/master-pdf-editor-5.9.70-qt5.9.x86_64.deb

	dpkg -x $(PWD)/build/build.deb $(PWD)/build

	cp --force --recursive $(PWD)/build/opt/master-pdf-editor*/* $(PWD)/build/Boilerplate.AppDir/mpe

	rm -f $(PWD)/build/Boilerplate.AppDir/mpe/*.desktop 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe/*.png 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe/*.svg 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe/*.jpg 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/mpe/*.sh 		|| true

	echo ''                                                    >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                    >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}:$${APPDIR}/mpe'  >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}'          >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                    >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                    >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'exec $${APPDIR}/mpe/masterpdfeditor*    "$${@}"'     >> $(PWD)/build/Boilerplate.AppDir/AppRun

	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop || true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.jpg 	|| true

	cp --force $(PWD)/AppDir/*.svg 		$(PWD)/build/Boilerplate.AppDir || true
	cp --force $(PWD)/AppDir/*.desktop 	$(PWD)/build/Boilerplate.AppDir || true
	cp --force $(PWD)/AppDir/*.png 		$(PWD)/build/Boilerplate.AppDir || true

	chmod +x $(PWD)/build/Boilerplate.AppDir/AppRun

	cp README.md $(PWD)/build/Boilerplate.AppDir/

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/MasterPDFEditor.AppImage
	chmod +x $(PWD)/MasterPDFEditor.AppImage
	mv $(PWD)/MasterPDFEditor.AppImage $(PWD)/MasterPDFEditor-$(VERSION)-x86_64-1_JB.AppImage
	md5sum $(PWD)/MasterPDFEditor-$(VERSION)-x86_64-1_JB.AppImage > $(PWD)/MasterPDFEditor-$(VERSION)-x86_64-1_JB.AppImage.md5
	ls -lah

init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo --output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
