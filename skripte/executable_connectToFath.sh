#!/bin/bash

doas openvpn --config ~/.config/openvpn/GeekInBusiness@Fath.conf \
  --auth-user-pass ~/.config/openvpn/user@Fath

