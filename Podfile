# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, :deployment_target => '9.0'
inhibit_all_warnings!
use_frameworks!

def rx_swift
    pod 'RxSwift', '~> 3.5.0'
    pod 'RxSwiftExt', '~> 2.5.0'
end

def rx_cocoa
    pod 'RxCocoa', '~> 3.5.0'
end

def assets_management
    pod 'R.swift', '~> 3.3.0'
end

target 'TestRxSwift' do
    rx_swift
    rx_cocoa
    assets_management
    
    target 'TestRxSwiftTests' do
        inherit! :complete
    end
end

