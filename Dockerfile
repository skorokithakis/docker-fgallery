FROM ubuntu:precise

RUN apt-get -y update
RUN apt-get -y install imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python-numpy

RUN wget --no-check-certificate http://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-LATEST.zip
RUN unp fgallery-LATEST.zip
RUN rm fgallery-LATEST.zip
RUN mv fgallery-* fgallery

VOLUME ["/fgallery/gallery/"]
WORKDIR /fgallery/

RUN wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip
RUN unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect
RUN chmod +x /usr/bin/facedetect

CMD ["/bin/bash"]
