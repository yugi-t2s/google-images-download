FROM python:3.7-alpine as base
FROM base as builder
#Labels as key value pair
LABEL Maintainer="yuge"

RUN mkdir /google_images_download/

RUN ls -ltrh
COPY . /google_images_download/
RUN ls -ltrh /google_images_download/

WORKDIR /google_images_download/
RUN pip install -r requirements.txt
RUN python setup.py install


ENTRYPOINT [ "python3" ]
CMD ["google_images_download --keywords "Polar bears" --limit 2"]
