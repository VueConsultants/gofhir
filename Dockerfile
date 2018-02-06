FROM golang:1.9.3

ENV ROOT /go/src/github.com/vueconsultants/fhirserver 

WORKDIR ${ROOT}
COPY . .

RUN apt-get update \
  && mkdir -p ${ROOT}/vendor/github.com/synthetichealth \
  && ln -sfn ${ROOT} ${ROOT}/vendor/github.com/synthetichealth/gofhir \
  && go build

ENTRYPOINT [ "./fhirserver" ]
CMD [ "-db.host=fhirdb" ]
