*** Settings ***
Documentation    Common project settings
Library    Collections
Library    RequestsLibrary

Resource        ${CURDIR}/resources/resource.robot
Resource        ${CURDIR}/resources/common.robot

Output Directory    ${CURDIR}/Results