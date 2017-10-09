CAS
===

## Build Resources

#### checkout

```
git clone git@github.com:apereo/cas.git cas-server
```

#### build
```
cd cas-server
git checkout master
./gradlew build install --parallel -x test -x javadoc -x check
```

## [Generate Keystore]("INSTALL.md")
