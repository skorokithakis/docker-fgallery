docker-fgallery
===============

A Dockerfile for installing fgallery.

fgallery is a static image gallery generation script, it takes images from a directory and generates a static HTML page
with the images displayed in a slideshow. It can be found at:

http://www.thregr.org/~wavexx/software/fgallery/

This fork is inteded to create a simple container that exposes http port and serves the newly created site on port 80.

The gallery folder contains the images you want in the gallery in this fork. 

Usage
-----

If you want to modify the images first update the ./gallery folder with the images you want to include

To use this image, just do:

    docker build -t sam-rowe/fgallery .
    docker run -p 8080:80 -t sam-rowe/fgallery 


Alternative usage
-----------------

The ci folder has a build pipeline for Azure DevOps that builds the container image and pushes to docker hub. It also publishes a k8s deployment + service definition that can be used to deploy on AKS. 