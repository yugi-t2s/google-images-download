FROM python:3.7-alpine as base
FROM base as builder
#Labels as key value pair
LABEL Maintainer="yuge"

RUN mkdir /google_images_download/
WORKDIR /google_images_download/
RUN ls -ltrh
COPY google-images-download/ /google_images_download/
RUN pip install -r /google_images_download/requirements.txt
RUN python /google_images_download/setup.py install
RUN ls -ltrh /google_images_download/

ENTRYPOINT [ "python3" ]
CMD ["google_images_download.py --keywords "Polar bears" --limit 2"]
