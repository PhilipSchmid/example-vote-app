#!/bin/bash
docker tag ghcr.io/philipschmid/vote-demo-vote pschmid/vote-demo-vote
docker push pschmid/vote-demo-vote
docker tag ghcr.io/philipschmid/vote-demo-result pschmid/vote-demo-result
docker push pschmid/vote-demo-result
docker tag ghcr.io/philipschmid/vote-demo-worker pschmid/vote-demo-worker
docker push pschmid/vote-demo-worker