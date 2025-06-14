init: clean get generate

clean:
	echo "Cleaning the project.." ; \
	fvm flutter clean ; \

get:
	echo "Getting dependencies.." ; \
	fvm flutter pub get ; \

generate:
	echo "Generating needed codes.." ; \
    fvm dart run build_runner build --delete-conflicting-outputs ; \

# build:
#     echo "Building the project.." ; \
#     fvm flutter build apk --release ; \

# l10n:
# 	echo "Generating needed codes.." ; \
# 	fvm flutter gen-l10n ; \
