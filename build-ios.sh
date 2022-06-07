rm -rf build

flutter build ios integration_test/main_test.dart --release

pushd ios
xcodebuild -workspace Runner.xcworkspace -allowProvisioningUpdates -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath "../build/ios_integ" -sdk iphoneos build-for-testing
popd

pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos15.4-arm64.xctestrun
popd