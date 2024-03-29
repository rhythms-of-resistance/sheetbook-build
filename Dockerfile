FROM alpine:3.14

RUN apk add --no-cache qpdf texlive libreoffice-calc libreoffice-writer ttf-liberation inkscape bash ncurses msttcorefonts-installer git poppler-utils \
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
