#!/bin/bash

set -e
set -o errtrace

export ROOT_FOLDER="$( pwd )"
export THIS_FOLDER="$( dirname "${BASH_SOURCE[0]}" )"
export EXAMPLES_FOLDER="${ROOT_FOLDER}/.."
export SINKS_FOLDER="${ROOT_FOLDER}/../sinks"
export SOURCES_FOLDER="${ROOT_FOLDER}/../sources"
export PULSAR_ROOT="/home/ddieruf/apache-pulsar-2.10.1"

while [ $# -ne 0 ]; do
	name="$1"
	case "$name" in
	--tenant)
		shift
		TENANT="$1"
		;;
	--namespace)
		shift
		NAMESPACE="$1"
		;;
	--topic)
		shift
		TOPIC="$1"
		;;
	--webserviceurl)
		shift
		WEB_SERVICE_URL="$1"
		;;
	--pulsartoken)
		shift
		PULSAR_TOKEN="$1"
		;;
	esac

	shift
done

#######################################
#       Validate required
#######################################
[[ -z ${TENANT} ]] && (echo "TENANT is a required value" && exit 1)
[[ -z ${NAMESPACE} ]] && (echo "NAMESPACE is a required value" && exit 1)
[[ -z ${TOPIC} ]] && (echo "TOPIC is a required value" && exit 1)
[[ -z ${WEB_SERVICE_URL} ]] && (echo "WEB_SERVICE_URL is a required value" && exit 1)
[[ -z ${PULSAR_TOKEN} ]] && (echo "PULSAR_TOKEN is a required value" && exit 1)

#######################################
#       Source needed functions
#######################################
source "${THIS_FOLDER}/functions/install-pulsar.sh" --version "2.10.1"
source "${THIS_FOLDER}/functions/script-runner.sh"

sinks=("elastic-search" "jdbc-clickhouse" "jdbc-mariadb" "jdbc-postgresql" "jdbc-sqlite" "kafka" "kinesis" "snowflake") #"astra-db"
sources=("data-generator" "debezium-mongodb" "debezium-mysql" "debezium-oracle" "debezium-postgres" "debezium-sqlserver" "kafka" "kinesis")
connectorAdminFiles=("pulsar-admin-create.sh" "pulsar-admin-update.sh")
generalAdminFiles=("pulsar-admin-status.sh" "pulsar-admin-stop.sh" "pulsar-admin-start.sh" "pulsar-admin-info.sh" "pulsar-admin-restart.sh" "pulsar-admin-delete.sh")
connectorCurlFiles=("curl-create.sh" "curl-update.sh")
generalCurlFiles=("curl-status.sh" "curl-stop.sh" "curl-start.sh" "curl-info.sh" "curl-restart.sh" "curl-delete.sh")

#######################################
#       Begin task
#######################################
#set -x #echo all commands
echo "--------------------------------------------------------"
echo "Starting sink tests"
echo "--------------------------------------------------------"

for sink in "${sinks[@]}"; do
  sinkFolder="${SINKS_FOLDER}/${sink}"
  sinkName="a$(echo $RANDOM | md5sum | head -c 17)"
  echo "  Testing ${sink} as ${sinkName}"

  for file in "${connectorAdminFiles[@]}"; do
    echo "    Running test ${sink}:${file}"

    pushd "${PULSAR_ROOT}"
      if ! ret=$(runScript "${TENANT}" \
                      "${NAMESPACE}" \
                      "${TOPIC}" \
                      "${sinkName}" \
                      "" \
                      "" \
                     "${sinkFolder}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    popd
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${generalAdminFiles[@]}"; do
    echo "    Running test ${sink}:${file}"

    pushd "${PULSAR_ROOT}"
      if ! ret=$(runScript "${TENANT}" \
                      "${NAMESPACE}" \
                      "${TOPIC}" \
                      "${sinkName}" \
                      "" \
                      "" \
                     "${SINKS_FOLDER}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    popd
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${connectorCurlFiles[@]}"; do
    echo "    Running test ${sink}:${file}"
    if ! ret=$(runScript "${TENANT}" \
                    "${NAMESPACE}" \
                    "${TOPIC}" \
                    "${sinkName}" \
                    "${WEB_SERVICE_URL}" \
                    "${PULSAR_TOKEN}" \
                   "${sinkFolder}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${generalCurlFiles[@]}"; do
    echo "    Running test ${sink}:${file}"
    if ! ret=$(runScript "${TENANT}" \
                    "${NAMESPACE}" \
                    "${TOPIC}" \
                    "${sinkName}" \
                    "${WEB_SERVICE_URL}" \
                    "${PULSAR_TOKEN}" \
                   "${SINKS_FOLDER}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    echo "    SUCCESS"
    sleep 2s
  done
done

echo ""
echo "--------------------------------------------------------"
echo "Starting source tests"
echo "--------------------------------------------------------"

for src in "${sources[@]}"; do
  sourceFolder="${SOURCES_FOLDER}/${src}"
  sourceName="a$(echo $RANDOM | md5sum | head -c 17)"
  echo "  Testing ${src} as ${sourceName}"

  for file in "${connectorAdminFiles[@]}"; do
    echo "    Running test ${src}:${file}"

    pushd "${PULSAR_ROOT}"
      if ! ret=$(runScript "${TENANT}" \
                      "${NAMESPACE}" \
                      "${TOPIC}" \
                      "${sourceName}" \
                      "" \
                      "" \
                     "${sourceFolder}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    popd
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${generalAdminFiles[@]}"; do
    echo "    Running test ${src}:${file}"

    pushd "${PULSAR_ROOT}"
      if ! ret=$(runScript "${TENANT}" \
                      "${NAMESPACE}" \
                      "${TOPIC}" \
                      "${sourceName}" \
                      "" \
                      "" \
                     "${SOURCES_FOLDER}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    popd
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${connectorCurlFiles[@]}"; do
    echo "    Running test ${src}:${file}"
    if ! ret=$(runScript "${TENANT}" \
                    "${NAMESPACE}" \
                    "${TOPIC}" \
                    "${sourceName}" \
                    "${WEB_SERVICE_URL}" \
                    "${PULSAR_TOKEN}" \
                   "${sourceFolder}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    echo "    SUCCESS"
    sleep 2s
  done

  for file in "${generalCurlFiles[@]}"; do
    echo "    Running test ${src}:${file}"
    if ! ret=$(runScript "${TENANT}" \
                    "${NAMESPACE}" \
                    "${TOPIC}" \
                    "${sourceName}" \
                    "${WEB_SERVICE_URL}" \
                    "${PULSAR_TOKEN}" \
                   "${SOURCES_FOLDER}/${file}"  2>&1); then (echo "    ERROR: $ret" && exit 1) fi
    echo "    SUCCESS"
    sleep 2s
  done
done

echo "All tests passed"
