# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .robot
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.3.2
#   kernelspec:
#     display_name: Robot Framework
#     language: robotframework
#     name: robotkernel
# ---

# +
*** Settings ***

Library  String

*** Variables ***

${MESSAGE}  Hello World

*** Test Cases ***

Message is Hello World
    Should be equal  ${MESSAGE}  Hello World
# -
