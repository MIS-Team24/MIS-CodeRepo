FROM ubuntu:18.04


RUN apt-get update -y && apt-get upgrade -y && useradd -m docker


RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip


RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz


RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh


COPY start.sh start.sh


RUN chmod +x start.sh


USER docker


ENTRYPOINT ["./start.sh"]
