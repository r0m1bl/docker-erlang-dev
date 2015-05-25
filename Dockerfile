# Erlang
FROM alpine:3.1

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN apk add --update-cache make wget git grep openssh-client && rm -rf /var/cache/apk/*
RUN apk add --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    erlang \
    erlang-public-key erlang-syntax-tools erlang-erl-docgen erlang-gs erlang-observer erlang-ssh \
    erlang-ose erlang-cosfiletransfer erlang-runtime-tools erlang-os-mon erlang-tools erlang-cosproperty \
    erlang-common-test erlang-dialyzer erlang-edoc erlang-otp-mibs erlang-crypto erlang-costransaction \
    erlang-odbc erlang-inets erlang-asn1 erlang-snmp erlang-erts erlang-et erlang-cosnotification erlang-xmerl \
    erlang-typer erlang-coseventdomain erlang-stdlib erlang-diameter erlang-hipe erlang-ic erlang-eunit \
    erlang-webtool erlang-mnesia erlang-erl-interface erlang-test-server erlang-sasl erlang-jinterface \
    erlang-kernel erlang-orber erlang-costime erlang-percept erlang-dev erlang-eldap erlang-reltool \
    erlang-debugger erlang-ssl erlang-megaco erlang-parsetools erlang-cosevent erlang-compiler && rm -rf /var/cache/apk/*
	
RUN git clone git://github.com/rebar/rebar.git && cd rebar && ./bootstrap && mv rebar /usr/local/bin/rebar && cd .. && rm -rf rebar/

ENTRYPOINT ["/bin/bash"]