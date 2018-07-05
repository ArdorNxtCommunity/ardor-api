#!/bin/sh

#This is necesasry only for mac users
sudo xcodebuild -license accept

sudo brew install rbenv
sudo gem install bundler

bundle config build.nokogiri -- --use-system-libraries=true --with-xml2-include="$(xcrun --show-sdk-path)"/usr/include/libxml2
bundle install

