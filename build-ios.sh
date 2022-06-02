rm -rf build

flutter build ios integration_test/main_test.dart --release

pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath "../build/ios_integ" -sdk iphoneos build-for-testing
popd

pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos15.4-arm64.xctestrun
popd

gcloud firebase test ios run --test "build/ios_integ/Build/Products/ios_tests.zip" --device model=ipad5,version=15.4 --xctestrun-file="build/ios_integ/Build/Products/Runner_iphoneos15.4-arm64.xctestrun"