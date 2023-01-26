#!/bin/bash
curl -X POST http://localhost:4000/api/die -H "ContentType: application/jason" -H "Authorization: Bearer apolloAccessTokenSecret"