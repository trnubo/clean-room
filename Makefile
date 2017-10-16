.PHONY: all build
all:
	@echo "Nothing to do"

build: clean
	rsync -avu src/ build/
	cd build && lb config && rsync -auv /usr/share/live/build/bootloaders/isolinux/ config/bootloaders/isolinux/
	cd build && lb build

clean:
	/bin/bash -O extglob -O dotglob -c 'rm -rf build/!(cache)'

install-deps:
	apt-get install live-build
