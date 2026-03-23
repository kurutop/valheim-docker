FROM cm2network/steamcmd:root

ENV STEAMAPPID=896660
ENV STEAMAPPDIR="${HOMEDIR}/valheim-dedicated"
ENV SERVER_DATA="${HOMEDIR}/config"

RUN mkdir -p "${STEAMAPPDIR}" "${SERVER_DATA}" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}"

USER ${USER}
WORKDIR ${STEAMAPPDIR}

COPY --chown=${USER}:${USER} entry.sh /entry.sh
RUN chmod +x /entry.sh

ENTRYPOINT ["/entry.sh"]
