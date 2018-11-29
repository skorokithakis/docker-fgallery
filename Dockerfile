FROM ubuntu:precise

EXPOSE 80

RUN apt-get -y update
RUN apt-get -y install imagemagick exiftran zip liblcms2-utils libimage-exiftool-perl libjson-perl libjson-xs-perl jpegoptim pngcrush p7zip python-opencv libopencv-dev unp unzip fish wget python-numpy nginx

RUN wget --no-check-certificate http://www.thregr.org/~wavexx/software/fgallery/releases/fgallery-LATEST.zip
RUN unp fgallery-LATEST.zip
RUN rm fgallery-LATEST.zip
RUN mv fgallery-* fgallery

COPY ./gallery/ /fgallery/gallery/
WORKDIR /fgallery/

RUN wget --no-check-certificate https://github.com/wavexx/facedetect/archive/master.zip
RUN unzip -p master.zip facedetect-master/facedetect > /usr/bin/facedetect
RUN chmod +x /usr/bin/facedetect

RUN ./fgallery gallery dist

WORKDIR /fgallery/dist/

RUN cp -R /fgallery/dist/* /usr/share/nginx/www/
#CMD ["/bin/bash"]
CMD ["nginx", "-g", "daemon off;"]