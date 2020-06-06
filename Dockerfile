FROM alpine:3.12

RUN apk add --no-cache pdftk texlive libreoffice-calc libreoffice-writer inkscape bash ncurses msttcorefonts-installer git \
    && update-ms-fonts

RUN adduser -D ror

ENV TERM=xterm

COPY . /home/ror/sheetbook-build
RUN chown -R ror:ror /home/ror \
    && unzip /home/ror/sheetbook-build/BTNGrilledCheese.zip -d /usr/share/fonts/truetype \
    && fc-cache -f

VOLUME /home/ror/sheetbook

WORKDIR /home/ror/sheetbook-build

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/home/ror/sheetbook-build/build.sh" ]
