#!/bin/bash
docker tag ghcr.io/philipschmid/vote-demo-vote:1.0 pschmid/vote-demo-vote:1.0
docker push pschmid/vote-demo-vote:1.0
docker tag ghcr.io/philipschmid/vote-demo-result:1.0 pschmid/vote-demo-result:1.0
docker push pschmid/vote-demo-result:1.0
docker tag ghcr.io/philipschmid/vote-demo-worker:1.0 pschmid/vote-demo-worker:1.0
docker push pschmid/vote-demo-worker:1.0