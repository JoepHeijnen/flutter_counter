xcodebuild test-without-building -xctestrun "build/ios_integ/Build/Products/Runner_iphoneos15.4-arm64.xctestrun" -destination id=A83DDD36-2EF5-41B8-A314-88A1201D9ACB

gcloud firebase test ios run --test "build/ios_integ/Build/Products/ios_tests.zip" --xctestrun-file="build/ios_integ/Build/Products/Runner_iphoneos15.4-arm64.xctestrun"
