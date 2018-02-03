FROM    gregcoleman/docker-cobol
WORKDIR /app

COPY    ["zero-zero-six.cob", "."]

CMD     cobc zero-zero-six.cob && cobcrun zero-zero-six
