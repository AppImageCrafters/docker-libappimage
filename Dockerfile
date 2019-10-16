FROM appimagecrafters/docker-base
RUN yum install -y git wget make binutils fuse libarchive3-devel fuse-devel zlib-devel patch openssl-static openssl-devel \
                                       automake autoconf libtool vim-common desktop-file-utils librsvg2-devel


COPY --from=appimagecrafters/docker-glib /usr/local /usr/local
COPY --from=appimagecrafters/docker-libpng /usr/local /usr/local
COPY --from=appimagecrafters/docker-pixman /usr/local /usr/local
COPY --from=appimagecrafters/docker-freetype /usr/local /usr/local
COPY --from=appimagecrafters/docker-cairo /usr/local /usr/local
COPY --from=appimagecrafters/docker-cmake /usr/local /usr/local
COPY --from=appimagecrafters/docker-automake /usr/local /usr/local

ADD install-libappimage.sh /
RUN source /entrypoint.sh && /install-libappimage.sh